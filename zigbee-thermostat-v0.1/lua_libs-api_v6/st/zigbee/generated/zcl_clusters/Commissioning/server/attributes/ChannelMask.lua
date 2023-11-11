local cluster_base = require "st.zigbee.cluster_base"
local data_types = require "st.zigbee.data_types"

-- Copyright 2023 SmartThings
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

-- DO NOT EDIT: this code is automatically generated by tools/zigbee-lib_generator/generate_clusters_from_xml.py
-- Script version: b'aab104a27ce2f5279180e69ba93ef579673eddc5'
-- ZCL XML version: 7.2

--- @class st.zigbee.zcl.clusters.Commissioning.ChannelMask
--- @alias ChannelMask
---
--- @field public ID number 0x0003 the ID of this attribute
--- @field public NAME string "ChannelMask" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap32 the data type of this attribute
local ChannelMask = {
  ID = 0x0003,
  NAME = "ChannelMask",
  base_type = data_types.Bitmap32,
}

ChannelMask.BASE_MASK = 0xFFFFFFFF


ChannelMask.mask_fields = {
  BASE_MASK = 0xFFFFFFFF,
}



ChannelMask.mask_methods = {
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap32 the base data type object to add functionality to
function ChannelMask:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_bitmap(self, base_type_obj)
end

function ChannelMask.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils"
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x%s]", value_obj.field_name or value_obj.NAME, ChannelMask.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function ChannelMask:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap32 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
ChannelMask.build_test_attr_report = cluster_base.build_test_attr_report

--- @function ChannelMask:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap32 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
ChannelMask.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap32 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the ChannelMask(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap32
--- @return st.zigbee.data_types.Bitmap32
function ChannelMask:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function ChannelMask:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function ChannelMask:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Bitmap32 the value to write
function ChannelMask:write(device, value)
  return cluster_base.attribute_write(self, device, value)
end

function ChannelMask:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ChannelMask, {__call = ChannelMask.new_value})
return ChannelMask