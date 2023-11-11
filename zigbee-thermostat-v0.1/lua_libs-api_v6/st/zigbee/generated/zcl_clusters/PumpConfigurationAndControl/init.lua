local cluster_base = require "st.zigbee.cluster_base"
local PumpConfigurationAndControlClientAttributes = require "st.zigbee.generated.zcl_clusters.PumpConfigurationAndControl.client.attributes"
local PumpConfigurationAndControlServerAttributes = require "st.zigbee.generated.zcl_clusters.PumpConfigurationAndControl.server.attributes"
local PumpConfigurationAndControlClientCommands = require "st.zigbee.generated.zcl_clusters.PumpConfigurationAndControl.client.commands"
local PumpConfigurationAndControlServerCommands = require "st.zigbee.generated.zcl_clusters.PumpConfigurationAndControl.server.commands"
local PumpConfigurationAndControlTypes = require "st.zigbee.generated.zcl_clusters.PumpConfigurationAndControl.types"

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

--- @class st.zigbee.zcl.clusters.PumpConfigurationAndControl
--- @alias PumpConfigurationAndControl
---
--- @field public ID number 0x0200 the ID of this cluster
--- @field public NAME string "PumpConfigurationAndControl" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.PumpConfigurationAndControlServerAttributes | st.zigbee.zcl.clusters.PumpConfigurationAndControlClientAttributes
--- @field public commands st.zigbee.zcl.clusters.PumpConfigurationAndControlServerCommands | st.zigbee.zcl.clusters.PumpConfigurationAndControlClientCommands
--- @field public types st.zigbee.zcl.clusters.PumpConfigurationAndControlTypes
local PumpConfigurationAndControl = {}

PumpConfigurationAndControl.ID = 0x0200
PumpConfigurationAndControl.NAME = "PumpConfigurationAndControl"
PumpConfigurationAndControl.server = {}
PumpConfigurationAndControl.client = {}
PumpConfigurationAndControl.server.attributes = PumpConfigurationAndControlServerAttributes:set_parent_cluster(PumpConfigurationAndControl)
PumpConfigurationAndControl.client.attributes = PumpConfigurationAndControlClientAttributes:set_parent_cluster(PumpConfigurationAndControl)
PumpConfigurationAndControl.server.commands = PumpConfigurationAndControlServerCommands:set_parent_cluster(PumpConfigurationAndControl)
PumpConfigurationAndControl.client.commands = PumpConfigurationAndControlClientCommands:set_parent_cluster(PumpConfigurationAndControl)
PumpConfigurationAndControl.types = PumpConfigurationAndControlTypes

function PumpConfigurationAndControl.attr_id_map()
    return {
    [0x0000] = "MaxPressure",
    [0x0001] = "MaxSpeed",
    [0x0002] = "MaxFlow",
    [0x0003] = "MinConstPressure",
    [0x0004] = "MaxConstPressure",
    [0x0005] = "MinCompPressure",
    [0x0006] = "MaxCompPressure",
    [0x0007] = "MinConstSpeed",
    [0x0008] = "MaxConstSpeed",
    [0x0009] = "MinConstFlow",
    [0x000A] = "MaxConstFlow",
    [0x000B] = "MinConstTemp",
    [0x000C] = "MaxConstTemp",
    [0x0010] = "PumpStatus",
    [0x0011] = "EffectiveOperationMode",
    [0x0012] = "EffectiveControlMode",
    [0x0013] = "Capacity",
    [0x0014] = "Speed",
    [0x0015] = "LifetimeRunningHours",
    [0x0016] = "Power",
    [0x0017] = "LifetimeEnergyConsumed",
    [0x0020] = "OperationMode",
    [0x0021] = "ControlMode",
    [0x0022] = "AlarmMask",
  }
end

function PumpConfigurationAndControl.server_id_map()
    return {
  }
end

function PumpConfigurationAndControl.client_id_map()
    return {
  }
end

PumpConfigurationAndControl.attribute_direction_map = {
  ["MaxPressure"] = "server",
  ["MaxSpeed"] = "server",
  ["MaxFlow"] = "server",
  ["MinConstPressure"] = "server",
  ["MaxConstPressure"] = "server",
  ["MinCompPressure"] = "server",
  ["MaxCompPressure"] = "server",
  ["MinConstSpeed"] = "server",
  ["MaxConstSpeed"] = "server",
  ["MinConstFlow"] = "server",
  ["MaxConstFlow"] = "server",
  ["MinConstTemp"] = "server",
  ["MaxConstTemp"] = "server",
  ["PumpStatus"] = "server",
  ["EffectiveOperationMode"] = "server",
  ["EffectiveControlMode"] = "server",
  ["Capacity"] = "server",
  ["Speed"] = "server",
  ["LifetimeRunningHours"] = "server",
  ["Power"] = "server",
  ["LifetimeEnergyConsumed"] = "server",
  ["OperationMode"] = "server",
  ["ControlMode"] = "server",
  ["AlarmMask"] = "server",
}
PumpConfigurationAndControl.command_direction_map = {}

setmetatable(PumpConfigurationAndControl, {__index = cluster_base})

PumpConfigurationAndControl:init_attributes_table()
PumpConfigurationAndControl:init_commands_table()

return PumpConfigurationAndControl
