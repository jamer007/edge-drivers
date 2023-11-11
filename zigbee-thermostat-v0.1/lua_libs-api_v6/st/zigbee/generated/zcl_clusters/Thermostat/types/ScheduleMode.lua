local data_types = require "st.zigbee.data_types"
local BitmapABC = require "st.zigbee.data_types.base_defs.BitmapABC"

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

--- @class st.zigbee.zcl.clusters.Thermostat.types.ScheduleMode: st.zigbee.data_types.Bitmap8
--- @alias ScheduleMode
---
--- @field public byte_length number 1
--- @field public HEAT number 1
--- @field public COOL number 2
local ScheduleMode = {}
local new_mt = BitmapABC.new_mt({NAME = "ScheduleMode", ID = data_types.name_to_id_map["Bitmap8"]}, 1)
new_mt.__index.BASE_MASK = 0xFF
new_mt.__index.HEAT = 0x01
new_mt.__index.COOL = 0x02

--- @function ScheduleMode:is_heat_set
--- @return boolean True if the value of HEAT is non-zero
new_mt.__index.is_heat_set = function(self)
  return (self.value & self.HEAT) ~= 0
end
 
--- @function ScheduleMode:set_heat
--- Set the value of the bit in the HEAT field to 1
new_mt.__index.set_heat = function(self)
  self.value = self.value | self.HEAT
end

--- @function ScheduleMode:unset_heat
--- Set the value of the bits in the HEAT field to 0
new_mt.__index.unset_heat = function(self)
  self.value = self.value & (~self.HEAT & self.BASE_MASK)
end

--- @function ScheduleMode:is_cool_set
--- @return boolean True if the value of COOL is non-zero
new_mt.__index.is_cool_set = function(self)
  return (self.value & self.COOL) ~= 0
end
 
--- @function ScheduleMode:set_cool
--- Set the value of the bit in the COOL field to 1
new_mt.__index.set_cool = function(self)
  self.value = self.value | self.COOL
end

--- @function ScheduleMode:unset_cool
--- Set the value of the bits in the COOL field to 0
new_mt.__index.unset_cool = function(self)
  self.value = self.value & (~self.COOL & self.BASE_MASK)
end

setmetatable(ScheduleMode, new_mt)
return ScheduleMode
