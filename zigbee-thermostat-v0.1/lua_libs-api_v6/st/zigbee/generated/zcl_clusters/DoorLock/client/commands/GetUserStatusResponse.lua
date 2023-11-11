local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local DrlkUserStatusType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkUserStatus"

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
-- DoorLock command GetUserStatusResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.DoorLock.GetUserStatusResponse
--- @alias GetUserStatusResponse
---
--- @field public ID number 0x0A the ID of this command
--- @field public NAME string "GetUserStatusResponse" the name of this command
--- @field public user_id st.zigbee.data_types.Uint16
--- @field public user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
local GetUserStatusResponse = {}
GetUserStatusResponse.NAME = "GetUserStatusResponse"
GetUserStatusResponse.ID = 0x0A
GetUserStatusResponse.args_def = {
  {
    name = "user_id",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "user_status",
    optional = false,
    data_type = DrlkUserStatusType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function GetUserStatusResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

GetUserStatusResponse.get_length = utils.length_from_fields
GetUserStatusResponse._serialize = utils.serialize_from_fields
GetUserStatusResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GetUserStatusResponse
function GetUserStatusResponse.deserialize(buf)
  return cluster_base.command_deserialize(GetUserStatusResponse, buf)
end

function GetUserStatusResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param user_id st.zigbee.data_types.Uint16
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GetUserStatusResponse.build_test_rx(device, user_id, user_status)
  local args = {user_id, user_status}

  return cluster_base.command_build_test_rx(GetUserStatusResponse, device, args, "client")
end

--- Initialize the GetUserStatusResponse command
---
--- @param self GetUserStatusResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param user_id st.zigbee.data_types.Uint16
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GetUserStatusResponse:init(device, user_id, user_status)
  local args = {user_id, user_status}

  return cluster_base.command_init(self, device, args, "client")
end

function GetUserStatusResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GetUserStatusResponse, {__call = GetUserStatusResponse.init})

return GetUserStatusResponse
