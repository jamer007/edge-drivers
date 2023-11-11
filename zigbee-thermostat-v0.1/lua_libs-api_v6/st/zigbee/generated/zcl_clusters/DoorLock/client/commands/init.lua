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

local command_mt = {}
command_mt.__command_cache = {}
command_mt.__index = function(self, key)
  if command_mt.__command_cache[key] == nil then
    local req_loc = string.format("st.zigbee.generated.zcl_clusters.DoorLock.client.commands.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    command_mt.__command_cache[key] = raw_def:set_parent_cluster(cluster)
  end
  return command_mt.__command_cache[key]
end
--- @class st.zigbee.zcl.clusters.DoorLockClientCommands
---
--- @field public LockDoorResponse st.zigbee.zcl.clusters.DoorLock.LockDoorResponse
--- @field public UnlockDoorResponse st.zigbee.zcl.clusters.DoorLock.UnlockDoorResponse
--- @field public ToggleResponse st.zigbee.zcl.clusters.DoorLock.ToggleResponse
--- @field public UnlockWithTimeoutResponse st.zigbee.zcl.clusters.DoorLock.UnlockWithTimeoutResponse
--- @field public GetLogRecordResponse st.zigbee.zcl.clusters.DoorLock.GetLogRecordResponse
--- @field public SetPINCodeResponse st.zigbee.zcl.clusters.DoorLock.SetPINCodeResponse
--- @field public GetPINCodeResponse st.zigbee.zcl.clusters.DoorLock.GetPINCodeResponse
--- @field public ClearPINCodeResponse st.zigbee.zcl.clusters.DoorLock.ClearPINCodeResponse
--- @field public ClearAllPINCodesResponse st.zigbee.zcl.clusters.DoorLock.ClearAllPINCodesResponse
--- @field public SetUserStatusResponse st.zigbee.zcl.clusters.DoorLock.SetUserStatusResponse
--- @field public GetUserStatusResponse st.zigbee.zcl.clusters.DoorLock.GetUserStatusResponse
--- @field public SetWeekdayScheduleResponse st.zigbee.zcl.clusters.DoorLock.SetWeekdayScheduleResponse
--- @field public GetWeekdayScheduleResponse st.zigbee.zcl.clusters.DoorLock.GetWeekdayScheduleResponse
--- @field public ClearWeekdayScheduleResponse st.zigbee.zcl.clusters.DoorLock.ClearWeekdayScheduleResponse
--- @field public SetYearDayScheduleResponse st.zigbee.zcl.clusters.DoorLock.SetYearDayScheduleResponse
--- @field public GetYearDayScheduleResponse st.zigbee.zcl.clusters.DoorLock.GetYearDayScheduleResponse
--- @field public ClearYearDayScheduleResponse st.zigbee.zcl.clusters.DoorLock.ClearYearDayScheduleResponse
--- @field public SetHolidayScheduleResponse st.zigbee.zcl.clusters.DoorLock.SetHolidayScheduleResponse
--- @field public GetHolidayScheduleResponse st.zigbee.zcl.clusters.DoorLock.GetHolidayScheduleResponse
--- @field public ClearHolidayScheduleResponse st.zigbee.zcl.clusters.DoorLock.ClearHolidayScheduleResponse
--- @field public SetUserTypeResponse st.zigbee.zcl.clusters.DoorLock.SetUserTypeResponse
--- @field public GetUserTypeResponse st.zigbee.zcl.clusters.DoorLock.GetUserTypeResponse
--- @field public SetRFIDCodeResponse st.zigbee.zcl.clusters.DoorLock.SetRFIDCodeResponse
--- @field public GetRFIDCodeResponse st.zigbee.zcl.clusters.DoorLock.GetRFIDCodeResponse
--- @field public ClearRFIDCodeResponse st.zigbee.zcl.clusters.DoorLock.ClearRFIDCodeResponse
--- @field public ClearAllRFIDCodesResponse st.zigbee.zcl.clusters.DoorLock.ClearAllRFIDCodesResponse
--- @field public OperatingEventNotification st.zigbee.zcl.clusters.DoorLock.OperatingEventNotification
--- @field public ProgrammingEventNotification st.zigbee.zcl.clusters.DoorLock.ProgrammingEventNotification
local DoorLockClientCommands = {}

function DoorLockClientCommands:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(DoorLockClientCommands, command_mt)

return DoorLockClientCommands