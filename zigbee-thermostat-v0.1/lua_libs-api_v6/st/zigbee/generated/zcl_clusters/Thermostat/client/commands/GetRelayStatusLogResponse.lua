local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"

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
-- Thermostat command GetRelayStatusLogResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Thermostat.GetRelayStatusLogResponse
--- @alias GetRelayStatusLogResponse
---
--- @field public ID number 0x01 the ID of this command
--- @field public NAME string "GetRelayStatusLogResponse" the name of this command
--- @field public time_of_day st.zigbee.data_types.Uint16
--- @field public relay_status st.zigbee.data_types.Bitmap8
--- @field public local_temperature st.zigbee.data_types.Int16
--- @field public humidity_percentage st.zigbee.data_types.Uint8
--- @field public set_point st.zigbee.data_types.Int16
--- @field public unread_entries st.zigbee.data_types.Uint16
local GetRelayStatusLogResponse = {}
GetRelayStatusLogResponse.NAME = "GetRelayStatusLogResponse"
GetRelayStatusLogResponse.ID = 0x01
GetRelayStatusLogResponse.args_def = {
  {
    name = "time_of_day",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "relay_status",
    optional = false,
    data_type = data_types.Bitmap8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "local_temperature",
    optional = false,
    data_type = data_types.Int16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "humidity_percentage",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "set_point",
    optional = false,
    data_type = data_types.Int16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "unread_entries",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
}

function GetRelayStatusLogResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

GetRelayStatusLogResponse.get_length = utils.length_from_fields
GetRelayStatusLogResponse._serialize = utils.serialize_from_fields
GetRelayStatusLogResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GetRelayStatusLogResponse
function GetRelayStatusLogResponse.deserialize(buf)
  return cluster_base.command_deserialize(GetRelayStatusLogResponse, buf)
end

function GetRelayStatusLogResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param time_of_day st.zigbee.data_types.Uint16
--- @param relay_status st.zigbee.data_types.Bitmap8
--- @param local_temperature st.zigbee.data_types.Int16
--- @param humidity_percentage st.zigbee.data_types.Uint8
--- @param set_point st.zigbee.data_types.Int16
--- @param unread_entries st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GetRelayStatusLogResponse.build_test_rx(device, time_of_day, relay_status, local_temperature, humidity_percentage, set_point, unread_entries)
  local args = {time_of_day, relay_status, local_temperature, humidity_percentage, set_point, unread_entries}

  return cluster_base.command_build_test_rx(GetRelayStatusLogResponse, device, args, "client")
end

--- Initialize the GetRelayStatusLogResponse command
---
--- @param self GetRelayStatusLogResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param time_of_day st.zigbee.data_types.Uint16
--- @param relay_status st.zigbee.data_types.Bitmap8
--- @param local_temperature st.zigbee.data_types.Int16
--- @param humidity_percentage st.zigbee.data_types.Uint8
--- @param set_point st.zigbee.data_types.Int16
--- @param unread_entries st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GetRelayStatusLogResponse:init(device, time_of_day, relay_status, local_temperature, humidity_percentage, set_point, unread_entries)
  local args = {time_of_day, relay_status, local_temperature, humidity_percentage, set_point, unread_entries}

  return cluster_base.command_init(self, device, args, "client")
end

function GetRelayStatusLogResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GetRelayStatusLogResponse, {__call = GetRelayStatusLogResponse.init})

return GetRelayStatusLogResponse
