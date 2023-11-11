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

--- @class st.zigbee.zcl.clusters.DehumidificationControl.RelativeHumidityDisplay
--- @alias RelativeHumidityDisplay
---
--- @field public ID number 0x0015 the ID of this attribute
--- @field public NAME string "RelativeHumidityDisplay" the name of this attribute
--- @field public data_type st.zigbee.data_types.Enum8 the data type of this attribute
--- @field public NOT_DISPLAYED number 0
--- @field public DISPLAYED number 1
local RelativeHumidityDisplay = {
  ID = 0x0015,
  NAME = "RelativeHumidityDisplay",
  base_type = data_types.Enum8,
}

RelativeHumidityDisplay.NOT_DISPLAYED = 0x00
RelativeHumidityDisplay.DISPLAYED     = 0x01


RelativeHumidityDisplay.enum_fields = {
    [RelativeHumidityDisplay.NOT_DISPLAYED] = "NOT_DISPLAYED",
    [RelativeHumidityDisplay.DISPLAYED]     = "DISPLAYED",
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Enum8 the base data type object to add functionality to
function RelativeHumidityDisplay:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_enum(self, base_type_obj)
end

function RelativeHumidityDisplay.pretty_print(value_obj)
  return string.format("%s: %s[%s]", value_obj.field_name or value_obj.NAME, RelativeHumidityDisplay.NAME, RelativeHumidityDisplay.enum_fields[value_obj.value])
end

--- @function RelativeHumidityDisplay:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
RelativeHumidityDisplay.build_test_attr_report = cluster_base.build_test_attr_report

--- @function RelativeHumidityDisplay:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
RelativeHumidityDisplay.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Enum8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the RelativeHumidityDisplay(...) syntax
---
--- @vararg vararg the values needed to construct a Enum8
--- @return st.zigbee.data_types.Enum8
function RelativeHumidityDisplay:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function RelativeHumidityDisplay:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function RelativeHumidityDisplay:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Enum8 the value to write
function RelativeHumidityDisplay:write(device, value)
  return cluster_base.attribute_write(self, device, value)
end

function RelativeHumidityDisplay:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(RelativeHumidityDisplay, {__call = RelativeHumidityDisplay.new_value})
return RelativeHumidityDisplay
