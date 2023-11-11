-- Copyright 2022 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- DO NOT EDIT: this code is automatically generated by ZCL Advanced Platform generator.

local data_types = require "st.matter.data_types"
local log = require "log"
local TLVParser = require "st.matter.TLV.TLVParser"

-----------------------------------------------------------
-- DoorLock command UnlockDoor
-----------------------------------------------------------

--- @class st.matter.clusters.DoorLock.UnlockDoor
--- @alias UnlockDoor
---
--- @field public ID number 0x0001 the ID of this command
--- @field public NAME string "UnlockDoor" the name of this command
--- @field public pin_code data_types.OctetString1
local UnlockDoor = {}

UnlockDoor.NAME = "UnlockDoor"
UnlockDoor.ID = 0x0001
UnlockDoor.field_defs = {
  {
    name = "pin_code",
    field_id = 0,
    optional = true,
    nullable = false,
    data_type = data_types.OctetString1,
  },
}

--- Builds an UnlockDoor test command reponse for the driver integration testing framework
---
--- @param device st.matter.Device the device to build this message to
--- @param endpoint_id number|nil
--- @param status string Interaction status associated with the path
--- @return st.matter.st.matter.interaction_model.InteractionResponse of type COMMAND_RESPONSE
function UnlockDoor:build_test_command_response(device, endpoint_id, status)
  return self._cluster:build_test_command_response(
    device,
    endpoint_id,
    self._cluster.ID,
    self.ID,
    nil, --tlv
    status
  )
end

--- Initialize the UnlockDoor command
---
--- @param self UnlockDoor the template class for this command
--- @param device st.matter.Device the device to build this message to
--- @param pin_code st.matter.data_types.OctetString1

--- @return st.matter.interaction_model.InteractionRequest of type INVOKE
function UnlockDoor:init(device, endpoint_id, pin_code)
  local out = {}
  local args = {pin_code}
  if #args > #self.field_defs then
    error(self.NAME .. " received too many arguments")
  end
  for i,v in ipairs(self.field_defs) do
    if v.optional and args[i] == nil then
      out[v.name] = nil
    elseif v.nullable and args[i] == nil then
      out[v.name] = data_types.validate_or_build_type(args[i], data_types.Null, v.name)
      out[v.name].field_id = v.field_id
    elseif not v.optional and args[i] == nil then
      out[v.name] = data_types.validate_or_build_type(v.default, v.data_type, v.name)
      out[v.name].field_id = v.field_id
    else
      out[v.name] = data_types.validate_or_build_type(args[i], v.data_type, v.name)
      out[v.name].field_id = v.field_id
    end
  end
  setmetatable(out, {
    __index = UnlockDoor,
    __tostring = UnlockDoor.pretty_print
  })
  return self._cluster:build_cluster_command(
    device,
    out,
    endpoint_id,
    self._cluster.ID,
    self.ID,
    true
  )
end

function UnlockDoor:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

--- Add field names to each command field
---
--- @param base_type_obj st.matter.data_types.Structure
function UnlockDoor:augment_type(base_type_obj)
  local elems = {}
  for _, v in ipairs(base_type_obj.elements) do
    for _, field_def in ipairs(self.field_defs) do
      if field_def.field_id == v.field_id and
         field_def.is_nullable and
         (v.value == nil and v.elements == nil) then
        elems[field_def.name] = data_types.validate_or_build_type(v, data_types.Null, field_def.field_name)
      elseif field_def.field_id == v.field_id and not
        (field_def.is_optional and v.value == nil) then
        elems[field_def.name] = data_types.validate_or_build_type(v, field_def.data_type, field_def.field_name)
      end
    end
  end
  base_type_obj.elements = elems
end

function UnlockDoor:deserialize(tlv_buf)
  return TLVParser.decode_tlv(tlv_buf)
end

setmetatable(UnlockDoor, {__call = UnlockDoor.init})

return UnlockDoor

