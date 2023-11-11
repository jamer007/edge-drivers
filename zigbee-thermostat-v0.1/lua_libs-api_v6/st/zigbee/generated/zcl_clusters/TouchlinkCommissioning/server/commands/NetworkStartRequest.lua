local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local TlRangeBeginEndType = require "st.zigbee.generated.zcl_clusters.TouchlinkCommissioning.types.TlRangeBeginEnd"
local TlKeyIndexType = require "st.zigbee.generated.zcl_clusters.TouchlinkCommissioning.types.TlKeyIndex"

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
-- TouchlinkCommissioning command NetworkStartRequest
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.TouchlinkCommissioning.NetworkStartRequest
--- @alias NetworkStartRequest
---
--- @field public ID number 0x10 the ID of this command
--- @field public NAME string "NetworkStartRequest" the name of this command
--- @field public inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @field public extended_pan_identifier st.zigbee.data_types.IeeeAddress
--- @field public key_index st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlKeyIndex
--- @field public encrypted_network_key st.zigbee.data_types.Seckey128
--- @field public logical_channel st.zigbee.data_types.Uint8
--- @field public pan_identifier st.zigbee.data_types.Uint16
--- @field public network_address st.zigbee.data_types.Uint16
--- @field public group_identifiers_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @field public group_identifiers_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @field public free_network_address_range_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @field public free_network_address_range_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @field public free_group_identifier_range_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @field public free_group_identifier_range_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @field public initiator_ieee_address st.zigbee.data_types.IeeeAddress
--- @field public initiator_network_address st.zigbee.data_types.Uint16
local NetworkStartRequest = {}
NetworkStartRequest.NAME = "NetworkStartRequest"
NetworkStartRequest.ID = 0x10
NetworkStartRequest.args_def = {
  {
    name = "inter_pan_transaction_identifier",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "extended_pan_identifier",
    optional = false,
    data_type = data_types.IeeeAddress,
    is_complex = false,
    is_array = false,
  },
  {
    name = "key_index",
    optional = false,
    data_type = TlKeyIndexType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "encrypted_network_key",
    optional = false,
    data_type = data_types.Seckey128,
    is_complex = false,
    is_array = false,
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
  {
    name = "network_address",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "group_identifiers_begin",
    optional = false,
    data_type = TlRangeBeginEndType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "group_identifiers_end",
    optional = false,
    data_type = TlRangeBeginEndType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "free_network_address_range_begin",
    optional = false,
    data_type = TlRangeBeginEndType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "free_network_address_range_end",
    optional = false,
    data_type = TlRangeBeginEndType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "free_group_identifier_range_begin",
    optional = false,
    data_type = TlRangeBeginEndType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "free_group_identifier_range_end",
    optional = false,
    data_type = TlRangeBeginEndType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "initiator_ieee_address",
    optional = false,
    data_type = data_types.IeeeAddress,
    is_complex = false,
    is_array = false,
  },
  {
    name = "initiator_network_address",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
}

function NetworkStartRequest:get_fields()
  return cluster_base.command_get_fields(self)
end

NetworkStartRequest.get_length = utils.length_from_fields
NetworkStartRequest._serialize = utils.serialize_from_fields
NetworkStartRequest.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return NetworkStartRequest
function NetworkStartRequest.deserialize(buf)
  return cluster_base.command_deserialize(NetworkStartRequest, buf)
end

function NetworkStartRequest:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param extended_pan_identifier st.zigbee.data_types.IeeeAddress
--- @param key_index st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlKeyIndex
--- @param encrypted_network_key st.zigbee.data_types.Seckey128
--- @param logical_channel st.zigbee.data_types.Uint8
--- @param pan_identifier st.zigbee.data_types.Uint16
--- @param network_address st.zigbee.data_types.Uint16
--- @param group_identifiers_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param group_identifiers_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_network_address_range_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_network_address_range_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_group_identifier_range_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_group_identifier_range_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param initiator_ieee_address st.zigbee.data_types.IeeeAddress
--- @param initiator_network_address st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function NetworkStartRequest.build_test_rx(device, inter_pan_transaction_identifier, extended_pan_identifier, key_index, encrypted_network_key, logical_channel, pan_identifier, network_address, group_identifiers_begin, group_identifiers_end, free_network_address_range_begin, free_network_address_range_end, free_group_identifier_range_begin, free_group_identifier_range_end, initiator_ieee_address, initiator_network_address)
  local args = {inter_pan_transaction_identifier, extended_pan_identifier, key_index, encrypted_network_key, logical_channel, pan_identifier, network_address, group_identifiers_begin, group_identifiers_end, free_network_address_range_begin, free_network_address_range_end, free_group_identifier_range_begin, free_group_identifier_range_end, initiator_ieee_address, initiator_network_address}

  return cluster_base.command_build_test_rx(NetworkStartRequest, device, args, "server")
end

--- Initialize the NetworkStartRequest command
---
--- @param self NetworkStartRequest the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param extended_pan_identifier st.zigbee.data_types.IeeeAddress
--- @param key_index st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlKeyIndex
--- @param encrypted_network_key st.zigbee.data_types.Seckey128
--- @param logical_channel st.zigbee.data_types.Uint8
--- @param pan_identifier st.zigbee.data_types.Uint16
--- @param network_address st.zigbee.data_types.Uint16
--- @param group_identifiers_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param group_identifiers_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_network_address_range_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_network_address_range_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_group_identifier_range_begin st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param free_group_identifier_range_end st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlRangeBeginEnd
--- @param initiator_ieee_address st.zigbee.data_types.IeeeAddress
--- @param initiator_network_address st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function NetworkStartRequest:init(device, inter_pan_transaction_identifier, extended_pan_identifier, key_index, encrypted_network_key, logical_channel, pan_identifier, network_address, group_identifiers_begin, group_identifiers_end, free_network_address_range_begin, free_network_address_range_end, free_group_identifier_range_begin, free_group_identifier_range_end, initiator_ieee_address, initiator_network_address)
  local args = {inter_pan_transaction_identifier, extended_pan_identifier, key_index, encrypted_network_key, logical_channel, pan_identifier, network_address, group_identifiers_begin, group_identifiers_end, free_network_address_range_begin, free_network_address_range_end, free_group_identifier_range_begin, free_group_identifier_range_end, initiator_ieee_address, initiator_network_address}

  return cluster_base.command_init(self, device, args, "server")
end

function NetworkStartRequest:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(NetworkStartRequest, {__call = NetworkStartRequest.init})

return NetworkStartRequest
