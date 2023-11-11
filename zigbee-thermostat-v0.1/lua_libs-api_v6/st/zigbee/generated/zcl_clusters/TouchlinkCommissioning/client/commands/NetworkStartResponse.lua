local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local TlStatusType = require "st.zigbee.generated.zcl_clusters.TouchlinkCommissioning.types.TlStatus"

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
-- TouchlinkCommissioning command NetworkStartResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.TouchlinkCommissioning.NetworkStartResponse
--- @alias NetworkStartResponse
---
--- @field public ID number 0x11 the ID of this command
--- @field public NAME string "NetworkStartResponse" the name of this command
--- @field public inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @field public status st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlStatus
--- @field public extended_pan_identifier st.zigbee.data_types.IeeeAddress
--- @field public network_update_identifier st.zigbee.data_types.Uint8
--- @field public logical_channel st.zigbee.data_types.Uint8
--- @field public pan_identifier st.zigbee.data_types.Uint16
local NetworkStartResponse = {}
NetworkStartResponse.NAME = "NetworkStartResponse"
NetworkStartResponse.ID = 0x11
NetworkStartResponse.args_def = {
  {
    name = "inter_pan_transaction_identifier",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "status",
    optional = false,
    data_type = TlStatusType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "extended_pan_identifier",
    optional = false,
    data_type = data_types.IeeeAddress,
    is_complex = false,
    is_array = false,
  },
  {
    name = "network_update_identifier",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "logical_channel",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "pan_identifier",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
}

function NetworkStartResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

NetworkStartResponse.get_length = utils.length_from_fields
NetworkStartResponse._serialize = utils.serialize_from_fields
NetworkStartResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return NetworkStartResponse
function NetworkStartResponse.deserialize(buf)
  return cluster_base.command_deserialize(NetworkStartResponse, buf)
end

function NetworkStartResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param status st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlStatus
--- @param extended_pan_identifier st.zigbee.data_types.IeeeAddress
--- @param network_update_identifier st.zigbee.data_types.Uint8
--- @param logical_channel st.zigbee.data_types.Uint8
--- @param pan_identifier st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function NetworkStartResponse.build_test_rx(device, inter_pan_transaction_identifier, status, extended_pan_identifier, network_update_identifier, logical_channel, pan_identifier)
  local args = {inter_pan_transaction_identifier, status, extended_pan_identifier, network_update_identifier, logical_channel, pan_identifier}

  return cluster_base.command_build_test_rx(NetworkStartResponse, device, args, "client")
end

--- Initialize the NetworkStartResponse command
---
--- @param self NetworkStartResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param status st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlStatus
--- @param extended_pan_identifier st.zigbee.data_types.IeeeAddress
--- @param network_update_identifier st.zigbee.data_types.Uint8
--- @param logical_channel st.zigbee.data_types.Uint8
--- @param pan_identifier st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function NetworkStartResponse:init(device, inter_pan_transaction_identifier, status, extended_pan_identifier, network_update_identifier, logical_channel, pan_identifier)
  local args = {inter_pan_transaction_identifier, status, extended_pan_identifier, network_update_identifier, logical_channel, pan_identifier}

  return cluster_base.command_init(self, device, args, "client")
end

function NetworkStartResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(NetworkStartResponse, {__call = NetworkStartResponse.init})

return NetworkStartResponse
