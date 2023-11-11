local cluster_base = require "st.zigbee.cluster_base"
local TimeClientAttributes = require "st.zigbee.generated.zcl_clusters.Time.client.attributes"
local TimeServerAttributes = require "st.zigbee.generated.zcl_clusters.Time.server.attributes"
local TimeClientCommands = require "st.zigbee.generated.zcl_clusters.Time.client.commands"
local TimeServerCommands = require "st.zigbee.generated.zcl_clusters.Time.server.commands"
local TimeTypes = require "st.zigbee.generated.zcl_clusters.Time.types"

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

--- @class st.zigbee.zcl.clusters.Time
--- @alias Time
---
--- @field public ID number 0x000A the ID of this cluster
--- @field public NAME string "Time" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.TimeServerAttributes | st.zigbee.zcl.clusters.TimeClientAttributes
--- @field public commands st.zigbee.zcl.clusters.TimeServerCommands | st.zigbee.zcl.clusters.TimeClientCommands
--- @field public types st.zigbee.zcl.clusters.TimeTypes
local Time = {}

Time.ID = 0x000A
Time.NAME = "Time"
Time.server = {}
Time.client = {}
Time.server.attributes = TimeServerAttributes:set_parent_cluster(Time)
Time.client.attributes = TimeClientAttributes:set_parent_cluster(Time)
Time.server.commands = TimeServerCommands:set_parent_cluster(Time)
Time.client.commands = TimeClientCommands:set_parent_cluster(Time)
Time.types = TimeTypes

function Time.attr_id_map()
    return {
    [0x0000] = "Time",
    [0x0001] = "TimeStatus",
    [0x0002] = "TimeZone",
    [0x0003] = "DstStart",
    [0x0004] = "DstEnd",
    [0x0005] = "DstShift",
    [0x0006] = "StandardTime",
    [0x0007] = "LocalTime",
    [0x0008] = "LastSetTime",
    [0x0009] = "ValidUntilTime",
  }
end

function Time.server_id_map()
    return {
  }
end

function Time.client_id_map()
    return {
  }
end

Time.attribute_direction_map = {
  ["Time"] = "server",
  ["TimeStatus"] = "server",
  ["TimeZone"] = "server",
  ["DstStart"] = "server",
  ["DstEnd"] = "server",
  ["DstShift"] = "server",
  ["StandardTime"] = "server",
  ["LocalTime"] = "server",
  ["LastSetTime"] = "server",
  ["ValidUntilTime"] = "server",
}
Time.command_direction_map = {}

setmetatable(Time, {__index = cluster_base})

Time:init_attributes_table()
Time:init_commands_table()

return Time