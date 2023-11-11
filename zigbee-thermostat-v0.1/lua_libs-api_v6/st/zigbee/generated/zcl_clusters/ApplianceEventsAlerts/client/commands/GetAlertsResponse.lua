local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local AlertStructureType = require "st.zigbee.generated.zcl_clusters.ApplianceEventsAlerts.types.AlertStructure"
local AlertsCountType = require "st.zigbee.generated.zcl_clusters.ApplianceEventsAlerts.types.AlertsCount"

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
-- ApplianceEventsAlerts command GetAlertsResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.ApplianceEventsAlerts.GetAlertsResponse
--- @alias GetAlertsResponse
---
--- @field public ID number 0x00 the ID of this command
--- @field public NAME string "GetAlertsResponse" the name of this command
--- @field public alerts_count st.zigbee.zcl.clusters.ApplianceEventsAlerts.types.AlertsCount
--- @field public alert_structure_list st.zigbee.zcl.clusters.ApplianceEventsAlerts.types.AlertStructure[]
local GetAlertsResponse = {}
GetAlertsResponse.NAME = "GetAlertsResponse"
GetAlertsResponse.ID = 0x00
GetAlertsResponse.args_def = {
  {
    name = "alerts_count",
    optional = false,
    data_type = AlertsCountType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "alert_structure",
    optional = false,
    data_type = AlertStructureType,
    is_complex = false,
    is_array = true,
    array_length_size = 0,
    default = 0x000000,
  },
}

function GetAlertsResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

GetAlertsResponse.get_length = utils.length_from_fields
GetAlertsResponse._serialize = utils.serialize_from_fields
GetAlertsResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GetAlertsResponse
function GetAlertsResponse.deserialize(buf)
  return cluster_base.command_deserialize(GetAlertsResponse, buf)
end

function GetAlertsResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param alerts_count st.zigbee.zcl.clusters.ApplianceEventsAlerts.types.AlertsCount
--- @param alert_structure st.zigbee.zcl.clusters.ApplianceEventsAlerts.types.AlertStructure[]
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GetAlertsResponse.build_test_rx(device, alerts_count, alert_structure)
  local args = {alerts_count, alert_structure}

  return cluster_base.command_build_test_rx(GetAlertsResponse, device, args, "client")
end

--- Initialize the GetAlertsResponse command
---
--- @param self GetAlertsResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param alerts_count st.zigbee.zcl.clusters.ApplianceEventsAlerts.types.AlertsCount
--- @param alert_structure st.zigbee.zcl.clusters.ApplianceEventsAlerts.types.AlertStructure[]
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GetAlertsResponse:init(device, alerts_count, alert_structure)
  local args = {alerts_count, alert_structure}

  return cluster_base.command_init(self, device, args, "client")
end

function GetAlertsResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GetAlertsResponse, {__call = GetAlertsResponse.init})

return GetAlertsResponse
