-- Copyright 2021 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--- @type st.zigbee.data_types
local data_types = require "st.zigbee.data_types"
local messages = require "st.zigbee.messages"
local read_attribute = require "st.zigbee.zcl.global_commands.read_attribute"
local write_attribute = require "st.zigbee.zcl.global_commands.write_attribute"
local config_rep = require "st.zigbee.zcl.global_commands.configure_reporting"
local report_attr = require "st.zigbee.zcl.global_commands.report_attribute"
local read_attr_response = require "st.zigbee.zcl.global_commands.read_attribute_response"
local FrameCtrl = require "st.zigbee.zcl.frame_ctrl"
local utils = require "st.zigbee.utils"
local zb_const = require "st.zigbee.constants"
local zcl_messages = require "st.zigbee.zcl"
local Status = require "st.zigbee.generated.types.ZclStatus"
local generic_body = require "st.zigbee.generic_body"
local log = require "log"

---@module cluster_base
local cluster_base_index = {}

--- @class ZigbeeClusterAttribute
---
--- @field public NAME string the name of this attribute
--- @field public ID number the ID of this attribute
--- @field public cluster ZigbeeCluster A reference to the cluster this is a part of
local ZigbeeClusterAttribute = {}

--- Build a ReadAttribute ZigbeeMessageTx for this cluster attribute
---
--- @param device st.Device The device to send the read command to
--- @return st.zigbee.ZigbeeMessageTx The constructed ReadAttribute body with the message headers to send
--- @see cluster_base
function ZigbeeClusterAttribute:read(device) end

--- Build a WriteAttribute ZigbeeMessageTx for this cluster attribute
---
--- This function will only be available on attributes that are read/write and will not be present on those that
--- are read only.
---
--- @param device st.Device The device to send the write command to
--- @param value st.zigbee.data_types.DataType The value to write to this cluster attribute
--- @return st.zigbee.ZigbeeMessageTx The constructed WriteAttribute body with the message headers to send
--- @see cluster_base.write_attribute
function ZigbeeClusterAttribute:write(device, value) end

--- Build a ConfigureReporting ZigbeeMessageTx for this cluster attribute
---
--- @param device st.Device The device to send the configure command to
--- @param min_rep_int number The minimum reporting interval for this attribute reporting
--- @param max_rep_int number The maximum reporting interval for this attribute reporting
--- @param rep_change st.zigbee.data_types.DataType The amount of change necessary to trigger a report (only necessary on non-discrete data types)
--- @return st.zigbee.ZigbeeMessageTx The constructed ConfigureReporting body with the message headers to send
--- @see cluster_base.configure_reporting
function ZigbeeClusterAttribute:configure_reporting(device, min_rep_int, max_rep_int, rep_change) end

--- Build a DataType instance of this attribute
---
--- This can also be called with the constructor syntax ZigbeeClusterAttribute(value)
---
--- @param orig ZigbeeClusterAttribute The ZigbeeClusterAttribute object we are instantiating
--- @param value value The value to use to create the st.zigbee.data_types.DataType
--- @return st.zigbee.data_types.DataType The constructed DataType of this attribute
function ZigbeeClusterAttribute.new_value(orig, value) end

--- @class ZigbeeClusterCommand
---
--- @field public NAME string the name of this command
--- @field public ID number the ID of this command
local ZigbeeClusterCommand = {}


--- @class ZigbeeCluster
---
--- A template class for the ZCL clusters as represented in this library
---
--- @field public attributes ZigbeeClusterAttribute[] the list of attributes defined for this cluster
--- @field public commands ZigbeeClusterCommand[] th list of commands defined for this cluster
local ZigbeeCluster = {}

function cluster_base_index.build_test_attr_report(attribute_def, device, value)
  local report_body = report_attr.ReportAttribute({
    report_attr.ReportAttributeAttributeRecord(attribute_def.ID, attribute_def.base_type.ID, value)
  })

  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(report_body.ID)
  })
  local addrh = messages.AddressHeader(
      device:get_short_address(),
      device:get_endpoint(attribute_def._cluster.ID),
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      zb_const.HA_PROFILE_ID,
      attribute_def._cluster.ID
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = report_body
  })
  return messages.ZigbeeMessageRx({
    address_header = addrh,
    body = message_body
  })

end

function cluster_base_index.build_test_read_attr_response(attribute_def, device, value)
  local read_response_body = read_attr_response.ReadAttributeResponse({
    read_attr_response.ReadAttributeResponseAttributeRecord(attribute_def.ID, Status.SUCCESS, attribute_def.base_type.ID, value)
  })

  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(read_response_body.ID)
  })
  local addrh = messages.AddressHeader(
      device:get_short_address(),
      device:get_endpoint(attribute_def._cluster.ID),
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      zb_const.HA_PROFILE_ID,
      attribute_def._cluster.ID
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = read_response_body
  })
  return messages.ZigbeeMessageRx({
    address_header = addrh,
    body = message_body
  })

end

--- Helper method for reading a cluster attribute
---
--- @param device st.Device the device to send the command to
--- @param cluster_id st.zigbee.data_types.ClusterId the cluster id of the cluster the attribute is a part of
--- @param attr_id st.zigbee.data_types.AttributeId the attribute id to read
--- @return st.zigbee.ZigbeeMessageTx the ReadAttribute command
function cluster_base_index.read_attribute(device, cluster_id, attr_id)
  local read_body = read_attribute.ReadAttribute({ attr_id })
  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(read_attribute.ReadAttribute.ID)
  })
  local addrh = messages.AddressHeader(
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      device:get_short_address(),
      device:get_endpoint(cluster_id.value),
      zb_const.HA_PROFILE_ID,
      cluster_id.value
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = read_body
  })
  return messages.ZigbeeMessageTx({
    address_header = addrh,
    body = message_body
  })
end

--- Method for creating a manufacturer-specific read
---
--- @param device st.Device the device to send the command to
--- @param cluster_id number the id of the cluster the attribute is a part of
--- @param attr_id number the id of the attribute to be read
--- @param mfg_specific_code number the manufacturer-specific code
--- @return st.zigbee.ZigbeeMessageTx the ReadAttribute command
function cluster_base_index.read_manufacturer_specific_attribute(device, cluster_id, attr_id, mfg_specific_code)
  local message = cluster_base_index.read_attribute(device, data_types.ClusterId(cluster_id), data_types.AttributeId(attr_id))
  message.body.zcl_header.frame_ctrl:set_mfg_specific()
  message.body.zcl_header.mfg_code = data_types.validate_or_build_type(mfg_specific_code, data_types.Uint16, "mfg_code")

  return message
end


--- Method for creating a manufacturer-specific write
---
--- @param device st.Device the device to send the command to
--- @param cluster_id number the id of the cluster the attribute is a part of
--- @param attr_id number the id of the attribute to be read
--- @param mfg_specific_code number the manufacturer-specific code
--- @param data_type st.zigbee.data_types.ZigbeeDataType the data type of the attribute
--- @param payload number the data for attribute
function cluster_base_index.write_manufacturer_specific_attribute(device, cluster_id, attr_id, mfg_specific_code, data_type, payload)
  local value = data_types.validate_or_build_type(payload, data_type, "payload")
  local message = cluster_base_index.write_attribute(device, data_types.ClusterId(cluster_id), data_types.AttributeId(attr_id), value)
  message.body.zcl_header.frame_ctrl:set_mfg_specific()
  message.body.zcl_header.mfg_code = data_types.validate_or_build_type(mfg_specific_code, data_types.Uint16, "mfg_code")
  return message
end


--- Helper method for writing a cluster attribute
---
--- @param device st.Device the device to send the command to
--- @param cluster_id st.zigbee.data_types.ClusterId the cluster id of the cluster the attribute is a part of
--- @param attr_id st.zigbee.data_types.AttributeId the attribute id to write
--- @param data st.zigbee.data_types.DataType the value to write to this attribute
--- @return st.zigbee.ZigbeeMessageTx the WriteAttribute command
function cluster_base_index.write_attribute(device, cluster_id, attr_id, data)
  local write_body = write_attribute.WriteAttribute({
    write_attribute.WriteAttribute.AttributeRecord(attr_id, data_types.ZigbeeDataType(data.ID), data)
  })
  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(write_attribute.WriteAttribute.ID)
  })
  local addrh = messages.AddressHeader(
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      device:get_short_address(),
      device:get_endpoint(cluster_id.value),
      zb_const.HA_PROFILE_ID,
      cluster_id.value
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = write_body
  })
  return messages.ZigbeeMessageTx({
    address_header = addrh,
    body = message_body
  })
end

--- Helper method for configuring a cluster attribute
---
--- @param device st.Device the device to send the command to
--- @param cluster_id st.zigbee.data_types.ClusterId the cluster id of the cluster the attribute is a part of
--- @param attr_id st.zigbee.data_types.AttributeId the attribute id being configured
--- @param data_type st.zigbee.data_types.ZigbeeDataType the data type of the attribute being configured
--- @param min_reporting_interval st.zigbee.data_types.Uint16 the minimum reporting interval for this configuration
--- @param max_reporting_interval st.zigbee.data_types.Uint16 the maximum reporting interval for this configuration
--- @param reportable_change st.zigbee.data_types.DataType the change necessary to trigger a report, only present if data_type is not discrete
--- @return st.zigbee.ZigbeeMessageTx the ConfigureReporting command
function cluster_base_index.configure_reporting(device, cluster_id, attr_id, data_type, min_reporting_interval, max_reporting_interval, reportable_change)
  local config_rec = config_rep.ConfigureReporting.AttributeReportingConfiguration({
    direction = data_types.Uint8(0x00),
    attr_id = attr_id,
    data_type = data_type,
    minimum_reporting_interval=min_reporting_interval,
    maximum_reporting_interval=max_reporting_interval,
    reportable_change=reportable_change
  })

  local config_body = config_rep.ConfigureReporting({config_rec})
  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(config_rep.ConfigureReporting.ID)
  })
  local addrh = messages.AddressHeader(
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      device:get_short_address(),
      device:get_endpoint(cluster_id.value),
      zb_const.HA_PROFILE_ID,
      cluster_id.value
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = config_body
  })
  return messages.ZigbeeMessageTx({
    address_header = addrh,
    body = message_body
  })
end

function cluster_base_index.build_cluster_specific_command(self, device, command_body, direction)
  local frame_ctrl = FrameCtrl(0x00)
  if direction ~= "server" then
    frame_ctrl:set_direction()
  end
  frame_ctrl:set_cluster_specific()
  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(command_body.ID),
    frame_ctrl = frame_ctrl
  })
  local addrh = messages.AddressHeader(
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      device:get_short_address(),
      device:get_endpoint(self.ID),
      zb_const.HA_PROFILE_ID,
      self.ID
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = command_body
  })
  return messages.ZigbeeMessageTx({
    address_header = addrh,
    body = message_body
  })
end

function cluster_base_index.build_test_rx_cluster_specific_command(self, device, command_body, direction)
  local frame_ctrl = FrameCtrl(0x00)
  frame_ctrl:set_cluster_specific()
  if direction ~= "server" then
    frame_ctrl:set_direction()
  end
  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(command_body.ID),
    frame_ctrl = frame_ctrl
  })
  local addrh = messages.AddressHeader(
      device:get_short_address(),
      device:get_endpoint(self.ID),
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      zb_const.HA_PROFILE_ID,
      self.ID
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = command_body
  })

  return messages.ZigbeeMessageRx({
    address_header = addrh,
    body = message_body
  })
end

function cluster_base_index.build_cluster_attribute(cluster, attribute_id, attribute_name, base_type, writable, is_complex)
  local attr = {}
  attr.ID = attribute_id
  attr.NAME = attribute_name
  attr.cluster = cluster
  attr.base_type = base_type
  attr.new_value = function(self, ...)
    local o = self.base_type(table.unpack({...}))
    o.field_name = self.NAME
    return o
  end
  attr.build_test_attr_report = cluster_base_index.build_test_attr_report
  attr.build_test_read_attr_response = cluster_base_index.build_test_read_attr_response
  attr.read = function(self, device)
    return self.cluster.read_attribute(device, data_types.ClusterId(self.cluster.ID), data_types.AttributeId(self.ID))
  end
  if base_type.is_discrete then
    attr.configure_reporting = function(self, device, min_rep_int, max_rep_int)
      local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
      local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
      return self.cluster.configure_reporting(device, data_types.ClusterId(self.cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(base_type.ID), min, max, nil)
    end
  elseif is_complex then
    attr.configure_reporting = function(self, device, min_rep_int, max_rep_int, rep_change)
      local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
      local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
      if type(rep_change) ~= "table" or rep_change.ID ~= self.base_type.ID then
        error(string.format("%s is of complex type %s and should be built before passing in.", self.NAME,self.base_type.NAME), 2)
      end
      return self.cluster.configure_reporting(device, data_types.ClusterId(self.cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(base_type.ID), min, max, rep_change)
    end
  else
    attr.configure_reporting = function(self, device, min_rep_int, max_rep_int, rep_change)
      local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
      local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
      local rep_change_val = data_types.validate_or_build_type(rep_change, self.base_type, "reportable_change")
      return self.cluster.configure_reporting(device, data_types.ClusterId(self.cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(base_type.ID), min, max, rep_change_val)
    end
  end
  if writable then
    if is_complex then
      attr.write = function(self, device, value)
        if type(value) ~= "table" or value.ID ~= self.base_type.ID then
          error(string.format("%s is of complex type %s and should be built before passing in.", self.NAME, self.base_type.NAME), 2)
        end
        return self.cluster.write_attribute(device, data_types.ClusterId(self.cluster.ID), data_types.AttributeId(self.ID), value)
      end
    else
      attr.write = function(self, device, value)
        local data = self.base_type(value)
        return self.cluster.write_attribute(device, data_types.ClusterId(self.cluster.ID), data_types.AttributeId(self.ID), data)
      end
    end
  else
    attr.write = function(self, device, value)
      error(string.format("Attribute %s is not writable.", self.NAME), 2)
    end
  end

  setmetatable(attr, {__call = attr.new_value})

  return attr
end


function cluster_base_index.build_manufacturer_specific_command(device, cluster_id, cmd_id, mfg_code, payload)
  local zclh = zcl_messages.ZclHeader({
    cmd = data_types.ZCLCommandId(cmd_id)
  })
  zclh.frame_ctrl:set_mfg_specific()
  zclh.frame_ctrl:set_cluster_specific()
  zclh.mfg_code = data_types.validate_or_build_type(mfg_code, data_types.Uint16, "mfg_code")
  local addrh = messages.AddressHeader(
      zb_const.HUB.ADDR,
      zb_const.HUB.ENDPOINT,
      device:get_short_address(),
      device:get_endpoint(cluster_id),
      zb_const.HA_PROFILE_ID,
      cluster_id
  )
  local message_body = zcl_messages.ZclMessageBody({
    zcl_header = zclh,
    zcl_body = generic_body.GenericBody(payload)
  })
  return messages.ZigbeeMessageTx({
    address_header = addrh,
    body = message_body
  })
end

--- @function ZigbeeCluster:parse_cluster_specific_command
---
--- @param self ZigbeeCluster
--- @param command ZCLCommandId the command ID of this message (From ZCL header)
--- @param direction number the direction of this message (From ZCL header frame ctrl)
--- @param buf Reader the buf with the message body that represents the command to be parsed
--- @return ZclMessageBody the parsed message body of this cluster specific command
function cluster_base_index.parse_cluster_specific_command(self, command, direction, buf)
  if direction == 0x00 then
    local cmd = self:get_server_command_by_id(command.value)
    if cmd ~= nil then
      return cmd.deserialize(buf)
    end
  elseif direction == 0x01 then
    local cmd = self:get_client_command_by_id(command.value)
    if cmd ~= nil then
      return cmd.deserialize(buf)
    end
  end
  return nil
end

local function get_thing_by_id(id, id_map, things)
  local name = id_map[id]
  if name ~= nil then
    return things[name]
  end
  return nil
end

--- Find an attribute by id
---
--- @param self ZigbeeCluster
--- @param attr_id number
function cluster_base_index.get_attribute_by_id(self, attr_id)
  return get_thing_by_id(attr_id, self.attr_id_map(), self.attributes)
end

--- Find a server command by id
---
--- @param self ZigbeeCluster
--- @param command_id number
function cluster_base_index.get_server_command_by_id(self, command_id)
  return get_thing_by_id(command_id, self.server_id_map(), self.server.commands)
end

--- Find a client command by id
---
--- @param self ZigbeeCluster
--- @param command_id number
function cluster_base_index.get_client_command_by_id(self, command_id)
  return get_thing_by_id(command_id, self.client_id_map(), self.client.commands)
end

function cluster_base_index.init_attributes_table(self)
  local attribute_helper_mt = {}
  local cluster = self
  attribute_helper_mt.__index = function(self, key)
    local direction = cluster.attribute_direction_map[key]
    if direction == nil then
      error(string.format("Referenced unknown attribute %s on cluster %s", key, cluster.NAME))
    end
    return cluster[direction].attributes[key]
  end
  cluster.attributes = {}
  setmetatable(cluster.attributes, attribute_helper_mt)
end

function cluster_base_index.init_commands_table(self)
  local command_helper_mt = {}
  local cluster = self
  command_helper_mt.__index = function(self, key)
    local direction = cluster.command_direction_map[key]
    if direction == nil then
      error(string.format("Referenced unknown command %s on cluster %s", key, cluster.NAME))
    end
    return cluster[direction].commands[key]
  end
  cluster.commands = {}
  setmetatable(cluster.commands, command_helper_mt)
end

--- attribute helper functions
function cluster_base_index.attribute_write(attribute, device, value)
  local data = data_types.validate_or_build_type(value, attribute.base_type)
  attribute:augment_type(data)
  return cluster_base_index.write_attribute(device, data_types.ClusterId(attribute._cluster.ID), data_types.AttributeId(attribute.ID), data)
end

function cluster_base_index.attribute_write_complex(attribute, device, value)
  if type(value) ~= "table" or value.ID ~= attribute.base_type.ID then
      error(attribute.NAME .. " is of complex type " .. attribute.base_type.NAME .. " and should be built before passing in.")
  end
  attribute:augment_type(value)
  return cluster_base_index.write_attribute(device, data_types.ClusterId(attribute._cluster.ID), data_types.AttributeId(attribute.ID), value)
end

function cluster_base_index.attribute_augment_type_enum(attribute, base_type_obj)
  for value, key in pairs(attribute.enum_fields) do
      base_type_obj[key] = value
  end
  base_type_obj.field_name = attribute.NAME
  base_type_obj.pretty_print = attribute.pretty_print
end

function cluster_base_index.attribute_augment_type_bitmap(attribute, base_type_obj)
  for k, v in pairs(attribute.mask_fields) do
      base_type_obj[k] = v
  end
  for k, v in pairs(attribute.mask_methods) do
      base_type_obj[k] = v
  end

  base_type_obj.field_name = attribute.NAME
  base_type_obj.pretty_print = attribute.pretty_print
end

function cluster_base_index.attribute_augment_type_default(attribute, base_type_obj)
  -- Is there a better way to handle this?
  if base_type_obj.NAME ~= attribute.base_type.NAME then
      setmetatable(base_type_obj, getmetatable(attribute.base_type))
  end
  base_type_obj.field_name = attribute.NAME
end

--- command helpers
function cluster_base_index.command_get_fields(command)
    local fields = {}
    for _, v in ipairs(command.args_def) do
      if v.is_array then
        if v.array_length_size ~= 0 then
          fields[#fields + 1] = command[v.name .. "_length"]
        end
        if command[v.name .. "_list"] ~= nil then
          for _, entry in ipairs(command[v.name .. "_list"]) do
            fields[#fields + 1] = entry
          end
        end
      else
        if command[v.name] ~= nil then
          fields[#fields + 1] = command[v.name]
        end
      end
    end
    return fields
end

function cluster_base_index.command_deserialize(command, buf)
    local out = {}
    for _, v in ipairs(command.args_def) do
      if buf:remain() > 0 then
        if v.is_array then
          if v.array_length_size ~= 0 then
            local entry_name = v.name .. "_length"
            local len = v.array_length_size or 1
            -- Start a 1 byte lenght at Uint8 and increment from there
            local len_data_type_id = 0x1F + len
            out[entry_name] = data_types.parse_data_type(len_data_type_id, buf, entry_name)
          end
          local entry_name = v.name .. "_list"
          out[entry_name] = {}
          while buf:remain() > 0 do
            out[entry_name][#out[entry_name] + 1] = v.data_type.deserialize(buf)
          end
        else
          out[v.name] = v.data_type.deserialize(buf)
        end
      elseif not v.optional then
        log.debug_with({ hub_logs = true }, "Missing command arg " .. v.name .. " for deserializing " .. command.NAME)
      end
    end
    setmetatable(out, {__index = command})
    out:set_field_names()
    return out
end

function cluster_base_index.command_set_fields(command)
    for _, v in ipairs(command.args_def) do
        if command[v.name] ~= nil then
            command[v.name].field_name = v.name
        end
    end
end

function cluster_base_index.command_build_test_rx(command, device, args, direction)
    local out = {}
    for i,v in ipairs(command.args_def) do
      if v.optional and args[i] == nil then
        out[v.name] = nil
      elseif not v.optional and args[i] == nil then
        out[v.name] = data_types.validate_or_build_type(v.default, v.data_type, v.name)   
      elseif v.is_array then
        local validated_list = {}
        for j, entry in ipairs(args[i]) do
          validated_list[j] = data_types.validate_or_build_type(entry, v.data_type, v.name .. tostring(j))
        end
        if v.array_length_size ~= 0 then
          local len_name =  v.name .. "_length"
          local len = v.array_length_size or 1
          -- Start a 1 byte lenght at Uint8 and increment from there
          local len_data_type = data_types.get_data_type_by_id(0x1F + len)
          out[len_name] = data_types.validate_or_build_type(#validated_list, len_data_type, len_name)
        end
        out[v.name .. "_list"] = validated_list
      else
        out[v.name] = data_types.validate_or_build_type(args[i], v.data_type, v.name)
      end
    end
    setmetatable(out, {__index = command})
    out:set_field_names()
    return command._cluster:build_test_rx_cluster_specific_command(device, out, direction)
end

function cluster_base_index.command_init(command, device, args, direction)
    local out = {}
    if #args > #command.args_def then
      error(command.NAME .. " received too many arguments")
    end
    for i,v in ipairs(command.args_def) do
      if v.optional and args[i] == nil then
        out[v.name] = nil
      elseif not v.optional and args[i] == nil then
        out[v.name] = data_types.validate_or_build_type(v.default, v.data_type, v.name)   
      elseif v.is_array then
        local validated_list = {}
        for j, entry in ipairs(args[i]) do
          validated_list[j] = data_types.validate_or_build_type(entry, v.data_type, v.name .. tostring(j))
        end
        if v.array_length_size ~= 0 then
          local len_name =  v.name .. "_length"
          local len = v.array_length_size or 1
          -- Start a 1 byte lenght at Uint8 and increment from there
          local len_data_type = data_types.get_data_type_by_id(0x1F + len)
          out[len_name] = data_types.validate_or_build_type(#validated_list, len_data_type, len_name)
        end
        out[v.name .. "_list"] = validated_list
      else
        out[v.name] = data_types.validate_or_build_type(args[i], v.data_type, v.name)
      end
    end
    setmetatable(out, {
      __index = command,
      __tostring = command.pretty_print
    })
    out:set_field_names()
    return command._cluster:build_cluster_specific_command(device, out, direction)
end


return  cluster_base_index
