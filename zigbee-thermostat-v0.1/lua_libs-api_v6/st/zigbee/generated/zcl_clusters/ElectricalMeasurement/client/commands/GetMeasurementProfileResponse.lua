local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local ProfileIntervalPeriod = require "st.zigbee.generated.types.ProfileIntervalPeriod"
local StatusType = require "st.zigbee.generated.zcl_clusters.ElectricalMeasurement.types.Status"

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
-- ElectricalMeasurement command GetMeasurementProfileResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.ElectricalMeasurement.GetMeasurementProfileResponse
--- @alias GetMeasurementProfileResponse
---
--- @field public ID number 0x01 the ID of this command
--- @field public NAME string "GetMeasurementProfileResponse" the name of this command
--- @field public start_time st.zigbee.data_types.UtcTime
--- @field public status st.zigbee.zcl.clusters.ElectricalMeasurement.types.Status
--- @field public profile_interval_period st.zigbee.data_types.ProfileIntervalPeriod
--- @field public number_of_intervals_delivered st.zigbee.data_types.Uint8
--- @field public attribute_id st.zigbee.data_types.AttributeId
--- @field public intervals_list st.zigbee.data_types.Unk[]
local GetMeasurementProfileResponse = {}
GetMeasurementProfileResponse.NAME = "GetMeasurementProfileResponse"
GetMeasurementProfileResponse.ID = 0x01
GetMeasurementProfileResponse.args_def = {
  {
    name = "start_time",
    optional = false,
    data_type = data_types.UtcTime,
    is_complex = false,
    is_array = false,
  },
  {
    name = "status",
    optional = false,
    data_type = StatusType,
    is_complex = false,
    is_array = false,
  },
  {
    name = "profile_interval_period",
    optional = false,
    data_type = ProfileIntervalPeriod,
    is_complex = false,
    is_array = false,
  },
  {
    name = "number_of_intervals_delivered",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "attribute_id",
    optional = false,
    data_type = data_types.AttributeId,
    is_complex = false,
    is_array = false,
  },
  {
    name = "intervals",
    optional = false,
    data_type = data_types.Unk,
    is_complex = false,
    is_array = true,
    array_length_size = 0,
  },
}

function GetMeasurementProfileResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

GetMeasurementProfileResponse.get_length = utils.length_from_fields
GetMeasurementProfileResponse._serialize = utils.serialize_from_fields
GetMeasurementProfileResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GetMeasurementProfileResponse
function GetMeasurementProfileResponse.deserialize(buf)
  return cluster_base.command_deserialize(GetMeasurementProfileResponse, buf)
end

function GetMeasurementProfileResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param start_time st.zigbee.data_types.UtcTime
--- @param status st.zigbee.zcl.clusters.ElectricalMeasurement.types.Status
--- @param profile_interval_period st.zigbee.data_types.ProfileIntervalPeriod
--- @param number_of_intervals_delivered st.zigbee.data_types.Uint8
--- @param attribute_id st.zigbee.data_types.AttributeId
--- @param intervals st.zigbee.data_types.Unk[]
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GetMeasurementProfileResponse.build_test_rx(device, start_time, status, profile_interval_period, number_of_intervals_delivered, attribute_id, intervals)
  local args = {start_time, status, profile_interval_period, number_of_intervals_delivered, attribute_id, intervals}

  return cluster_base.command_build_test_rx(GetMeasurementProfileResponse, device, args, "client")
end

--- Initialize the GetMeasurementProfileResponse command
---
--- @param self GetMeasurementProfileResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param start_time st.zigbee.data_types.UtcTime
--- @param status st.zigbee.zcl.clusters.ElectricalMeasurement.types.Status
--- @param profile_interval_period st.zigbee.data_types.ProfileIntervalPeriod
--- @param number_of_intervals_delivered st.zigbee.data_types.Uint8
--- @param attribute_id st.zigbee.data_types.AttributeId
--- @param intervals st.zigbee.data_types.Unk[]
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GetMeasurementProfileResponse:init(device, start_time, status, profile_interval_period, number_of_intervals_delivered, attribute_id, intervals)
  local args = {start_time, status, profile_interval_period, number_of_intervals_delivered, attribute_id, intervals}

  return cluster_base.command_init(self, device, args, "client")
end

function GetMeasurementProfileResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GetMeasurementProfileResponse, {__call = GetMeasurementProfileResponse.init})

return GetMeasurementProfileResponse
