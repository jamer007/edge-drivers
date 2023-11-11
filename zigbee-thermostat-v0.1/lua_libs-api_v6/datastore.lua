local json = require "st.json"
local datastore = _envlibrequire "datastore"
local log = require "log"

--- @module st_datastore
local st_datastore = {}

-- A registry of metatables we have created for datastore entries.  This allows us to
-- know when a value passed in actually has one of our mts
local our_mts = {}

-- Set up our mt registry with weak keys, so they will collected if this is the last reference
local weak_key_mt = {}
weak_key_mt.__mode = "k"
setmetatable(our_mts, weak_key_mt)

local convert_child

-- Recursively check keys and values to verify that they will be serializable
-- Raises error if any value is invalid
local function check_if_valid(value)
    local t = type(value)
    local valid_types = {
        boolean = true,
        number = true,
        string = true,
        ["nil"] = true,
    }

    if t == "table" then
        local table_mt = getmetatable(value)
        -- Only allow a table with metatable behavior if it is a datastore table
        if table_mt ~= nil and not our_mts[table_mt] then
            error("datastore table values should be simple and not include metatable functionality", 2)
        end
        for k,v in pairs(value) do
            check_if_valid(k)
            check_if_valid(v)
        end
        -- all keys and values are of accepted types.
        return
    elseif valid_types[t] then
        return
    end
    error("Data store keys and values must be JSON encodable: " .. tostring(value) .. " is of unsupported type " .. type(value), 2)
end

local proxies = {}
setmetatable(proxies, weak_key_mt)
local family_tree = {}
setmetatable(family_tree, weak_key_mt)

local function mt_new_index(self, key, value)
    local mt = getmetatable(self)
    if mt.__funcs[key] ~= nil then
        error("Key: " .. key .. " refers to a protected method, do not overwrite.", 2)
    end
    -- will raise error if invalid
    check_if_valid(key)
    check_if_valid(value)

    -- only able to set here if it was valid
    local values = proxies[self]
    values[key] = convert_child(value, self)
    mt:__set_dirty(self)
end

local function mt_set_dirty(my_mt, child)
    local parent = family_tree[child]
    if parent ~= nil then
        local mt = getmetatable(parent)
        mt:__set_dirty(parent)
    else
        my_mt.__dirty = true
    end
end

local function mt_index(self, key)
    local mt = getmetatable(self)
    local values = proxies[self]
    return mt.__funcs[key] or values[key]
end

local function mt_pairs(self)
    return pairs(proxies[self])
end

local function mt_load(self)
    local mt = getmetatable(self)
    local loaded_json = datastore.get()
    -- the emptry string is not valid JSON.
    -- dkjson for whatever reason handled this gracefully,
    -- but serde will throw an error. We guard against this
    -- now.
    if (loaded_json == nil) or #loaded_json == 0 then return end
    local success, loaded_table = pcall(json.decode, loaded_json)
    if success then
        if type(loaded_table) == "table" then
            local values = proxies[self]
            for k, v in pairs(loaded_table) do
                values[k] = convert_child(v, self)
            end
        end
    else
        -- if this fails, it's gone, just go as though we had no datastore
        -- loaded_table contains the error from the pcall
        log.error_with({hub_logs = true}, "Could not load datastore:\n" .. tostring(loaded_table), 2)
    end
end

local function mt_save(self)
    local mt = getmetatable(self)
    -- Shouldn't fail as we have ensured that all values are encodable, but could fail if
    -- users bypassed restrictions
    local succ, val = pcall(json.encode, self:get_serializable())
    if succ then
        datastore.set(val)
        mt.__dirty = false
    else
        error("Unable to serialize datastore value: " .. tostring(val), 2)
    end
end

local function mt_is_dirty(self)
    local parent = family_tree[self]
    local mt = getmetatable(self)
    if parent == nil then
        return mt.__dirty
    end
    return parent:is_dirty()
end

local function get_serializable(self)
    local valid_types = {
        boolean = true,
        number = true,
        string = true,
        ["nil"] = true,
    }
    local out_table = {}
    for k,v in pairs(proxies[self]) do
        local t = type(v)
        if t == "table" then
            out_table[k] = v:get_serializable()
        elseif valid_types[t] then
            out_table[k] = v
        else
            error("Data store keys and values must be JSON encodable: " .. tostring(v) .. " is of unsupported type " .. type(v), 2)
        end
    end
    return out_table
end

-- Create a new metatable to control the behavior of a datastore or a nested table
-- within that datastore.  The metatable constrains values to be serializable so
-- that we can pass it over RPC.  It also tracks the dirty status so if any nested
-- value is changed the top level datastore will have :is_dirty() return true
local function new_mt(head)
    local mt = {}
    our_mts[mt] = true

    mt.__funcs = {}

    -- Set up controls to ensure any value written to the data store is json encodable
    mt.__newindex = mt_new_index
    mt.__set_dirty = mt_set_dirty
    mt.__index = mt_index
    mt.__pairs = mt_pairs

    -- Define any functionality on the data store we want
    if head then
        mt.__funcs.load = mt_load
        mt.__funcs.save = mt_save
    end

    --- @function st_datastore:is_dirty()
    --- A function to return the dirty status of the datastore
    --- @return boolean the dirty status of the datastore
    mt.__funcs.is_dirty = mt_is_dirty

    --- @function st_datastore.getserializable()
    --- A function to return the serialable version of the table
    ---
    --- This primarily will pull out just the values and return the value table without
    --- metatables and functions included
    ---
    --- @return table a table with the values to be serialized
    mt.__funcs.get_serializable = get_serializable

    return mt
end

local head_mt = new_mt(true)
local child_mt = new_mt(false)

-- This is a local recursive function to convert each value present in a table being set
-- in the data store to be able to use the above defined metatable.
function convert_child(child, parent)
    if type(child) ~= "table" then
        return child
    else
        local values = {}
        family_tree[child] = parent
        for k,v in pairs(child) do
            child[k] = nil
            values[k] = convert_child(v, child)
        end
        proxies[child] = values
        setmetatable(child, child_mt)
        return child
    end
end

--- Initialize the datastore for this driver
---
--- This will create and return a special lua table which, when written to
---
--- @param driver Driver The current driver running containing necessary context for execution
--- @return table The table to write values that need to be persisted to.
function st_datastore.init(driver)
    local ds = {}
    proxies[ds] = {}
    setmetatable(ds, head_mt)
    ds:load()
    return ds
end

return st_datastore
