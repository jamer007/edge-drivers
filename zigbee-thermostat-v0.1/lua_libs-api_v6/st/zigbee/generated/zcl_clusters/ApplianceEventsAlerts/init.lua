local cluster_base = require "st.zigbee.cluster_base"
local ApplianceEventsAlertsClientAttributes = require "st.zigbee.generated.zcl_clusters.ApplianceEventsAlerts.client.attributes"
local ApplianceEventsAlertsServerAttributes = require "st.zigbee.generated.zcl_clusters.ApplianceEventsAlerts.server.attributes"
local ApplianceEventsAlertsClientCommands = require "st.zigbee.generated.zcl_clusters.ApplianceEventsAlerts.client.commands"
local ApplianceEventsAlertsServerCommands = require "st.zigbee.generated.zcl_clusters.ApplianceEventsAlerts.server.commands"
local ApplianceEventsAlertsTypes = require "st.zigbee.generated.zcl_clusters.ApplianceEventsAlerts.types"

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

--- @class st.zigbee.zcl.clusters.ApplianceEventsAlerts
--- @alias ApplianceEventsAlerts
---
--- @field public ID number 0x0B02 the ID of this cluster
--- @field public NAME string "ApplianceEventsAlerts" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.ApplianceEventsAlertsServerAttributes | st.zigbee.zcl.clusters.ApplianceEventsAlertsClientAttributes
--- @field public commands st.zigbee.zcl.clusters.ApplianceEventsAlertsServerCommands | st.zigbee.zcl.clusters.ApplianceEventsAlertsClientCommands
--- @field public types st.zigbee.zcl.clusters.ApplianceEventsAlertsTypes
local ApplianceEventsAlerts = {}

ApplianceEventsAlerts.ID = 0x0B02
ApplianceEventsAlerts.NAME = "ApplianceEventsAlerts"
ApplianceEventsAlerts.server = {}
ApplianceEventsAlerts.client = {}
ApplianceEventsAlerts.server.attributes = ApplianceEventsAlertsServerAttributes:set_parent_cluster(ApplianceEventsAlerts)
ApplianceEventsAlerts.client.attributes = ApplianceEventsAlertsClientAttributes:set_parent_cluster(ApplianceEventsAlerts)
ApplianceEventsAlerts.server.commands = ApplianceEventsAlertsServerCommands:set_parent_cluster(ApplianceEventsAlerts)
ApplianceEventsAlerts.client.commands = ApplianceEventsAlertsClientCommands:set_parent_cluster(ApplianceEventsAlerts)
ApplianceEventsAlerts.types = ApplianceEventsAlertsTypes

function ApplianceEventsAlerts.attr_id_map()
    return {
  }
end

function ApplianceEventsAlerts.server_id_map()
    return {
  }
end

function ApplianceEventsAlerts.client_id_map()
    return {
    [0x00] = "GetAlertsResponse",
    [0x01] = "AlertsNotification",
    [0x02] = "EventNotification",
  }
end

ApplianceEventsAlerts.attribute_direction_map = {}
ApplianceEventsAlerts.command_direction_map = {
  ["GetAlertsResponse"] = "client",
  ["AlertsNotification"] = "client",
  ["EventNotification"] = "client",
}

setmetatable(ApplianceEventsAlerts, {__index = cluster_base})

ApplianceEventsAlerts:init_attributes_table()
ApplianceEventsAlerts:init_commands_table()

return ApplianceEventsAlerts