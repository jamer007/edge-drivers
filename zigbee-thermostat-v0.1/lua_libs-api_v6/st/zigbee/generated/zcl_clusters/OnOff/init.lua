local cluster_base = require "st.zigbee.cluster_base"
local OnOffClientAttributes = require "st.zigbee.generated.zcl_clusters.OnOff.client.attributes"
local OnOffServerAttributes = require "st.zigbee.generated.zcl_clusters.OnOff.server.attributes"
local OnOffClientCommands = require "st.zigbee.generated.zcl_clusters.OnOff.client.commands"
local OnOffServerCommands = require "st.zigbee.generated.zcl_clusters.OnOff.server.commands"
local OnOffTypes = require "st.zigbee.generated.zcl_clusters.OnOff.types"

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

--- @class st.zigbee.zcl.clusters.OnOff
--- @alias OnOff
---
--- @field public ID number 0x0006 the ID of this cluster
--- @field public NAME string "OnOff" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.OnOffServerAttributes | st.zigbee.zcl.clusters.OnOffClientAttributes
--- @field public commands st.zigbee.zcl.clusters.OnOffServerCommands | st.zigbee.zcl.clusters.OnOffClientCommands
--- @field public types st.zigbee.zcl.clusters.OnOffTypes
local OnOff = {}

OnOff.ID = 0x0006
OnOff.NAME = "OnOff"
OnOff.server = {}
OnOff.client = {}
OnOff.server.attributes = OnOffServerAttributes:set_parent_cluster(OnOff)
OnOff.client.attributes = OnOffClientAttributes:set_parent_cluster(OnOff)
OnOff.server.commands = OnOffServerCommands:set_parent_cluster(OnOff)
OnOff.client.commands = OnOffClientCommands:set_parent_cluster(OnOff)
OnOff.types = OnOffTypes

function OnOff.attr_id_map()
    return {
    [0x0000] = "OnOff",
    [0x4000] = "GlobalSceneControl",
    [0x4001] = "OnTime",
    [0x4002] = "OffWaitTime",
    [0x4003] = "StartUpOnOff",
  }
end

function OnOff.server_id_map()
    return {
    [0x00] = "Off",
    [0x01] = "On",
    [0x02] = "Toggle",
    [0x40] = "OffWithEffect",
    [0x41] = "OnWithRecallGlobalScene",
    [0x42] = "OnWithTimedOff",
  }
end

function OnOff.client_id_map()
    return {
  }
end

OnOff.attribute_direction_map = {
  ["OnOff"] = "server",
  ["GlobalSceneControl"] = "server",
  ["OnTime"] = "server",
  ["OffWaitTime"] = "server",
  ["StartUpOnOff"] = "server",
}
OnOff.command_direction_map = {
  ["Off"] = "server",
  ["On"] = "server",
  ["Toggle"] = "server",
  ["OffWithEffect"] = "server",
  ["OnWithRecallGlobalScene"] = "server",
  ["OnWithTimedOff"] = "server",
}

setmetatable(OnOff, {__index = cluster_base})

OnOff:init_attributes_table()
OnOff:init_commands_table()

return OnOff
