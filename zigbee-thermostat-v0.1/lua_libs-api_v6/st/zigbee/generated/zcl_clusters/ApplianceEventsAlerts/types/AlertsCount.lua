local data_types = require "st.zigbee.data_types"
local UintABC = require "st.zigbee.data_types.base_defs.UintABC"

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

--- @class st.zigbee.zcl.clusters.ApplianceEventsAlerts.types.AlertsCount: st.zigbee.data_types.Uint8
--- @alias AlertsCount
---
--- @field public byte_length number 1
--- @field public NUM_ALERTS number 15
--- @field public ALERT_TYPE number 240
local AlertsCount = {}
local new_mt = UintABC.new_mt({NAME = "AlertsCount", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.BASE_MASK  = 0xFF
new_mt.__index.NUM_ALERTS = 0x0F
new_mt.__index.ALERT_TYPE = 0xF0

--- @function AlertsCount:is_num_alerts_set
--- @return boolean True if the value of NUM_ALERTS is non-zero
new_mt.__index.is_num_alerts_set = function(self)
  return (self.value & self.NUM_ALERTS) ~= 0
end
 
--- @function AlertsCount:set_num_alerts
--- Set the value of the bits in the NUM_ALERTS field
--- @param fieldVal number the value to set the bitfield to
new_mt.__index.set_num_alerts = function(self, fieldVal)
  if ((fieldVal & ~(self.NUM_ALERTS >> 0)) ~= 0) then
    error("value too large for NUM_ALERTS")
  end
  self.value = self.value | (fieldVal << 0)
end

--- @function AlertsCount:get_num_alerts
--- Get the value of the bits in the NUM_ALERTS field
new_mt.__index.get_num_alerts = function(self)
  return ((self.value & self.NUM_ALERTS)) >> 0
end

--- @function AlertsCount:unset_num_alerts
--- Set the value of the bits in the NUM_ALERTS field to 0
new_mt.__index.unset_num_alerts = function(self)
  self.value = self.value & (~self.NUM_ALERTS & self.BASE_MASK)
end

--- @function AlertsCount:is_alert_type_set
--- @return boolean True if the value of ALERT_TYPE is non-zero
new_mt.__index.is_alert_type_set = function(self)
  return (self.value & self.ALERT_TYPE) ~= 0
end
 
--- @function AlertsCount:set_alert_type
--- Set the value of the bits in the ALERT_TYPE field
--- @param fieldVal number the value to set the bitfield to
new_mt.__index.set_alert_type = function(self, fieldVal)
  if ((fieldVal & ~(self.ALERT_TYPE >> 4)) ~= 0) then
    error("value too large for ALERT_TYPE")
  end
  self.value = self.value | (fieldVal << 4)
end

--- @function AlertsCount:get_alert_type
--- Get the value of the bits in the ALERT_TYPE field
new_mt.__index.get_alert_type = function(self)
  return ((self.value & self.ALERT_TYPE)) >> 4
end

--- @function AlertsCount:unset_alert_type
--- Set the value of the bits in the ALERT_TYPE field to 0
new_mt.__index.unset_alert_type = function(self)
  self.value = self.value & (~self.ALERT_TYPE & self.BASE_MASK)
end

setmetatable(AlertsCount, new_mt)
return AlertsCount
