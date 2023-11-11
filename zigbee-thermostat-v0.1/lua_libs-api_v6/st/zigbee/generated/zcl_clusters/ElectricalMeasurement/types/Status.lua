local data_types = require "st.zigbee.data_types"
local EnumABC = require "st.zigbee.data_types.base_defs.EnumABC"

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

--- @class st.zigbee.zcl.clusters.ElectricalMeasurement.types.Status: st.zigbee.data_types.Enum8
--- @alias Status
---
--- @field public byte_length number 1
--- @field public SUCCESS number 0
--- @field public ATTRIBUTE_PROFILE_NOT_SUPPORTED number 1
--- @field public INVALID_START_TIME number 2
--- @field public MORE_INTERVALS_REQUESTED_THAN_CAN_BE_RETURNED number 3
--- @field public NO_INTERVALS_AVAILABLE_FOR_THE_REQUESTED_TIME number 4
local Status = {}
local new_mt = EnumABC.new_mt({NAME = "Status", ID = data_types.name_to_id_map["Enum8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.SUCCESS]                                       = "SUCCESS",
    [self.ATTRIBUTE_PROFILE_NOT_SUPPORTED]               = "ATTRIBUTE_PROFILE_NOT_SUPPORTED",
    [self.INVALID_START_TIME]                            = "INVALID_START_TIME",
    [self.MORE_INTERVALS_REQUESTED_THAN_CAN_BE_RETURNED] = "MORE_INTERVALS_REQUESTED_THAN_CAN_BE_RETURNED",
    [self.NO_INTERVALS_AVAILABLE_FOR_THE_REQUESTED_TIME] = "NO_INTERVALS_AVAILABLE_FOR_THE_REQUESTED_TIME",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.SUCCESS                                       = 0x00
new_mt.__index.ATTRIBUTE_PROFILE_NOT_SUPPORTED               = 0x01
new_mt.__index.INVALID_START_TIME                            = 0x02
new_mt.__index.MORE_INTERVALS_REQUESTED_THAN_CAN_BE_RETURNED = 0x03
new_mt.__index.NO_INTERVALS_AVAILABLE_FOR_THE_REQUESTED_TIME = 0x04

setmetatable(Status, new_mt)

return Status