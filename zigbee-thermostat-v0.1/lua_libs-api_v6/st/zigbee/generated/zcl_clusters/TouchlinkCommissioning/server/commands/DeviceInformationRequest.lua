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
-- TouchlinkCommissioning command DeviceInformationRequest
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.TouchlinkCommissioning.DeviceInformationRequest
--- @alias DeviceInformationRequest
---
--- @field public ID number 0x02 the ID of this command
--- @field public NAME string "DeviceInformationRequest" the name of this command
--- @field public inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @field public start_index st.zigbee.data_types.Uint8
local DeviceInformationRequest = {}
DeviceInformationRequest.NAME = "DeviceInformationRequest"
DeviceInformationRequest.ID = 0x02
DeviceInformationRequest.args_def = {
  {
    name = "inter_pan_transaction_identifier",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "start_index",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function DeviceInformationRequest:get_fields()
  return cluster_base.command_get_fields(self)
end

DeviceInformationRequest.get_length = utils.length_from_fields
DeviceInformationRequest._serialize = utils.serialize_from_fields
DeviceInformationRequest.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return DeviceInformationRequest
function DeviceInformationRequest.deserialize(buf)
  return cluster_base.command_deserialize(DeviceInformationRequest, buf)
end

function DeviceInformationRequest:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param start_index st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function DeviceInformationRequest.build_test_rx(device, inter_pan_transaction_identifier, start_index)
  local args = {inter_pan_transaction_identifier, start_index}

  return cluster_base.command_build_test_rx(DeviceInformationRequest, device, args, "server")
end

--- Initialize the DeviceInformationRequest command
---
--- @param self DeviceInformationRequest the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param start_index st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function DeviceInformationRequest:init(device, inter_pan_transaction_identifier, start_index)
  local args = {inter_pan_transaction_identifier, start_index}

  return cluster_base.command_init(self, device, args, "server")
end

function DeviceInformationRequest:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(DeviceInformationRequest, {__call = DeviceInformationRequest.init})

return DeviceInformationRequest
