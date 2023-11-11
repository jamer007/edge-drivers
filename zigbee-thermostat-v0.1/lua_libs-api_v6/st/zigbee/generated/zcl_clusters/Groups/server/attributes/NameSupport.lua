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

--- @class st.zigbee.zcl.clusters.Groups.NameSupport
--- @alias NameSupport
---
--- @field public ID number 0x0000 the ID of this attribute
--- @field public NAME string "NameSupport" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public SUPPORTED number 128
local NameSupport = {
  ID = 0x0000,
  NAME = "NameSupport",
  base_type = data_types.Bitmap8,
}

NameSupport.BASE_MASK = 0xFF
NameSupport.SUPPORTED = 0x80


NameSupport.mask_fields = {
  BASE_MASK = 0xFF,
  SUPPORTED = 0x80,
}


--- @function NameSupport:is_supported_set
--- @return boolean True if the value of SUPPORTED is non-zero
NameSupport.is_supported_set = function(self)
  return (self.value & self.SUPPORTED) ~= 0
end
 
--- @function NameSupport:set_supported
--- Set the value of the bit in the SUPPORTED field to 1
NameSupport.set_supported = function(self)
  self.value = self.value | self.SUPPORTED
end

--- @function NameSupport:unset_supported
--- Set the value of the bits in the SUPPORTED field to 0
NameSupport.unset_supported = function(self)
  self.value = self.value & (~self.SUPPORTED & self.BASE_MASK)
end


NameSupport.mask_methods = {
  is_supported_set = NameSupport.is_supported_set,
  set_supported = NameSupport.set_supported,
  unset_supported = NameSupport.unset_supported,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function NameSupport:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_bitmap(self, base_type_obj)
end

function NameSupport.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils"
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x%s]", value_obj.field_name or value_obj.NAME, NameSupport.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function NameSupport:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
NameSupport.build_test_attr_report = cluster_base.build_test_attr_report

--- @function NameSupport:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
NameSupport.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the NameSupport(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function NameSupport:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function NameSupport:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function NameSupport:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function NameSupport:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(NameSupport, {__call = NameSupport.new_value})
return NameSupport
