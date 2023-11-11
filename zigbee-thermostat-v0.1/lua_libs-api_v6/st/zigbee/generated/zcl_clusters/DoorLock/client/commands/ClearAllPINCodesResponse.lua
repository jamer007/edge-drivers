local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local DrlkPassFailStatusType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkPassFailStatus"

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
-- DoorLock command ClearAllPINCodesResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.DoorLock.ClearAllPINCodesResponse
--- @alias ClearAllPINCodesResponse
---
--- @field public ID number 0x08 the ID of this command
--- @field public NAME string "ClearAllPINCodesResponse" the name of this command
--- @field public status st.zigbee.zcl.clusters.DoorLock.types.DrlkPassFailStatus
local ClearAllPINCodesResponse = {}
ClearAllPINCodesResponse.NAME = "ClearAllPINCodesResponse"
ClearAllPINCodesResponse.ID = 0x08
ClearAllPINCodesResponse.args_def = {
  {
    name = "status",
    optional = false,
    data_type = DrlkPassFailStatusType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function ClearAllPINCodesResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

ClearAllPINCodesResponse.get_length = utils.length_from_fields
ClearAllPINCodesResponse._serialize = utils.serialize_from_fields
ClearAllPINCodesResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return ClearAllPINCodesResponse
function ClearAllPINCodesResponse.deserialize(buf)
  return cluster_base.command_deserialize(ClearAllPINCodesResponse, buf)
end

function ClearAllPINCodesResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param status st.zigbee.zcl.clusters.DoorLock.types.DrlkPassFailStatus
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function ClearAllPINCodesResponse.build_test_rx(device, status)
  local args = {status}

  return cluster_base.command_build_test_rx(ClearAllPINCodesResponse, device, args, "client")
end

--- Initialize the ClearAllPINCodesResponse command
---
--- @param self ClearAllPINCodesResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param status st.zigbee.zcl.clusters.DoorLock.types.DrlkPassFailStatus
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function ClearAllPINCodesResponse:init(device, status)
  local args = {status}

  return cluster_base.command_init(self, device, args, "client")
end

function ClearAllPINCodesResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ClearAllPINCodesResponse, {__call = ClearAllPINCodesResponse.init})

return ClearAllPINCodesResponse
