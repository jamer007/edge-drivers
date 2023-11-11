local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local DrlkHolidayScheduleIdType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkHolidayScheduleId"
local DrlkOperatingModeType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkOperatingMode"

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

-----------------------------------------------------------
-- DoorLock command SetHolidaySchedule
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.DoorLock.SetHolidaySchedule
--- @alias SetHolidaySchedule
---
--- @field public ID number 0x11 the ID of this command
--- @field public NAME string "SetHolidaySchedule" the name of this command
--- @field public holiday_schedule_id st.zigbee.zcl.clusters.DoorLock.types.DrlkHolidayScheduleId
--- @field public local_start_time st.zigbee.data_types.Uint32
--- @field public local_end_time st.zigbee.data_types.Uint32
--- @field public operating_mode_during_holiday st.zigbee.zcl.clusters.DoorLock.types.DrlkOperatingMode
local SetHolidaySchedule = {}
SetHolidaySchedule.NAME = "SetHolidaySchedule"
SetHolidaySchedule.ID = 0x11
SetHolidaySchedule.args_def = {
  {
    name = "holiday_schedule_id",
    optional = false,
    data_type = DrlkHolidayScheduleIdType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "local_start_time",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "local_end_time",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "operating_mode_during_holiday",
    optional = false,
    data_type = DrlkOperatingModeType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function SetHolidaySchedule:get_fields()
  return cluster_base.command_get_fields(self)
end

SetHolidaySchedule.get_length = utils.length_from_fields
SetHolidaySchedule._serialize = utils.serialize_from_fields
SetHolidaySchedule.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return SetHolidaySchedule
function SetHolidaySchedule.deserialize(buf)
  return cluster_base.command_deserialize(SetHolidaySchedule, buf)
end

function SetHolidaySchedule:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param holiday_schedule_id st.zigbee.zcl.clusters.DoorLock.types.DrlkHolidayScheduleId
--- @param local_start_time st.zigbee.data_types.Uint32
--- @param local_end_time st.zigbee.data_types.Uint32
--- @param operating_mode_during_holiday st.zigbee.zcl.clusters.DoorLock.types.DrlkOperatingMode
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function SetHolidaySchedule.build_test_rx(device, holiday_schedule_id, local_start_time, local_end_time, operating_mode_during_holiday)
  local args = {holiday_schedule_id, local_start_time, local_end_time, operating_mode_during_holiday}

  return cluster_base.command_build_test_rx(SetHolidaySchedule, device, args, "server")
end

--- Initialize the SetHolidaySchedule command
---
--- @param self SetHolidaySchedule the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param holiday_schedule_id st.zigbee.zcl.clusters.DoorLock.types.DrlkHolidayScheduleId
--- @param local_start_time st.zigbee.data_types.Uint32
--- @param local_end_time st.zigbee.data_types.Uint32
--- @param operating_mode_during_holiday st.zigbee.zcl.clusters.DoorLock.types.DrlkOperatingMode
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function SetHolidaySchedule:init(device, holiday_schedule_id, local_start_time, local_end_time, operating_mode_during_holiday)
  local args = {holiday_schedule_id, local_start_time, local_end_time, operating_mode_during_holiday}

  return cluster_base.command_init(self, device, args, "server")
end

function SetHolidaySchedule:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(SetHolidaySchedule, {__call = SetHolidaySchedule.init})

return SetHolidaySchedule
