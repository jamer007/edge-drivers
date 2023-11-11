local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local DrlkSettableUserStatusType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkSettableUserStatus"
local DrlkTotalUserIdType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkTotalUserId"

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
-- DoorLock command SetUserStatus
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.DoorLock.SetUserStatus
--- @alias SetUserStatus
---
--- @field public ID number 0x09 the ID of this command
--- @field public NAME string "SetUserStatus" the name of this command
--- @field public user_id st.zigbee.zcl.clusters.DoorLock.types.DrlkTotalUserId
--- @field public user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkSettableUserStatus
local SetUserStatus = {}
SetUserStatus.NAME = "SetUserStatus"
SetUserStatus.ID = 0x09
SetUserStatus.args_def = {
  {
    name = "user_id",
    optional = false,
    data_type = DrlkTotalUserIdType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "user_status",
    optional = false,
    data_type = DrlkSettableUserStatusType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function SetUserStatus:get_fields()
  return cluster_base.command_get_fields(self)
end

SetUserStatus.get_length = utils.length_from_fields
SetUserStatus._serialize = utils.serialize_from_fields
SetUserStatus.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return SetUserStatus
function SetUserStatus.deserialize(buf)
  return cluster_base.command_deserialize(SetUserStatus, buf)
end

function SetUserStatus:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param user_id st.zigbee.zcl.clusters.DoorLock.types.DrlkTotalUserId
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkSettableUserStatus
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function SetUserStatus.build_test_rx(device, user_id, user_status)
  local args = {user_id, user_status}

  return cluster_base.command_build_test_rx(SetUserStatus, device, args, "server")
end

--- Initialize the SetUserStatus command
---
--- @param self SetUserStatus the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param user_id st.zigbee.zcl.clusters.DoorLock.types.DrlkTotalUserId
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkSettableUserStatus
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function SetUserStatus:init(device, user_id, user_status)
  local args = {user_id, user_status}

  return cluster_base.command_init(self, device, args, "server")
end

function SetUserStatus:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(SetUserStatus, {__call = SetUserStatus.init})

return SetUserStatus
