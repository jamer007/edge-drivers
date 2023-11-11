local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local IasaceZoneStatusRecordType = require "st.zigbee.generated.zcl_clusters.IASACE.types.IasaceZoneStatusRecord"

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
-- IASACE command GetZoneStatusResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.IASACE.GetZoneStatusResponse
--- @alias GetZoneStatusResponse
---
--- @field public ID number 0x08 the ID of this command
--- @field public NAME string "GetZoneStatusResponse" the name of this command
--- @field public zone_status_complete st.zigbee.data_types.Boolean
--- @field public zone_status_record_list st.zigbee.zcl.clusters.IASACE.types.IasaceZoneStatusRecord[]
local GetZoneStatusResponse = {}
GetZoneStatusResponse.NAME = "GetZoneStatusResponse"
GetZoneStatusResponse.ID = 0x08
GetZoneStatusResponse.args_def = {
  {
    name = "zone_status_complete",
    optional = false,
    data_type = data_types.Boolean,
    is_complex = false,
    is_array = false,
  },
  {
    name = "zone_status_record",
    optional = false,
    data_type = IasaceZoneStatusRecordType,
    is_complex = false,
    is_array = true,
  },
}

function GetZoneStatusResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

GetZoneStatusResponse.get_length = utils.length_from_fields
GetZoneStatusResponse._serialize = utils.serialize_from_fields
GetZoneStatusResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GetZoneStatusResponse
function GetZoneStatusResponse.deserialize(buf)
  return cluster_base.command_deserialize(GetZoneStatusResponse, buf)
end

function GetZoneStatusResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param zone_status_complete st.zigbee.data_types.Boolean
--- @param zone_status_record st.zigbee.zcl.clusters.IASACE.types.IasaceZoneStatusRecord[]
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GetZoneStatusResponse.build_test_rx(device, zone_status_complete, zone_status_record)
  local args = {zone_status_complete, zone_status_record}

  return cluster_base.command_build_test_rx(GetZoneStatusResponse, device, args, "client")
end

--- Initialize the GetZoneStatusResponse command
---
--- @param self GetZoneStatusResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param zone_status_complete st.zigbee.data_types.Boolean
--- @param zone_status_record st.zigbee.zcl.clusters.IASACE.types.IasaceZoneStatusRecord[]
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GetZoneStatusResponse:init(device, zone_status_complete, zone_status_record)
  local args = {zone_status_complete, zone_status_record}

  return cluster_base.command_init(self, device, args, "client")
end

function GetZoneStatusResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GetZoneStatusResponse, {__call = GetZoneStatusResponse.init})

return GetZoneStatusResponse
