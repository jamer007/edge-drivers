local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local SGroupIdType = require "st.zigbee.generated.zcl_clusters.Scenes.types.SGroupId"
local ZclStatus = require "st.zigbee.generated.types.ZclStatus"

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
-- Scenes command EnhancedAddSceneResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Scenes.EnhancedAddSceneResponse
--- @alias EnhancedAddSceneResponse
---
--- @field public ID number 0x40 the ID of this command
--- @field public NAME string "EnhancedAddSceneResponse" the name of this command
--- @field public status st.zigbee.data_types.ZclStatus
--- @field public group_id st.zigbee.zcl.clusters.Scenes.types.SGroupId
--- @field public scene_id st.zigbee.data_types.Uint8
local EnhancedAddSceneResponse = {}
EnhancedAddSceneResponse.NAME = "EnhancedAddSceneResponse"
EnhancedAddSceneResponse.ID = 0x40
EnhancedAddSceneResponse.args_def = {
  {
    name = "status",
    optional = false,
    data_type = ZclStatus,
    is_complex = false,
    is_array = false,
  },
  {
    name = "group_id",
    optional = false,
    data_type = SGroupIdType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "scene_id",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function EnhancedAddSceneResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

EnhancedAddSceneResponse.get_length = utils.length_from_fields
EnhancedAddSceneResponse._serialize = utils.serialize_from_fields
EnhancedAddSceneResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return EnhancedAddSceneResponse
function EnhancedAddSceneResponse.deserialize(buf)
  return cluster_base.command_deserialize(EnhancedAddSceneResponse, buf)
end

function EnhancedAddSceneResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param status st.zigbee.data_types.ZclStatus
--- @param group_id st.zigbee.zcl.clusters.Scenes.types.SGroupId
--- @param scene_id st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function EnhancedAddSceneResponse.build_test_rx(device, status, group_id, scene_id)
  local args = {status, group_id, scene_id}

  return cluster_base.command_build_test_rx(EnhancedAddSceneResponse, device, args, "client")
end

--- Initialize the EnhancedAddSceneResponse command
---
--- @param self EnhancedAddSceneResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param status st.zigbee.data_types.ZclStatus
--- @param group_id st.zigbee.zcl.clusters.Scenes.types.SGroupId
--- @param scene_id st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function EnhancedAddSceneResponse:init(device, status, group_id, scene_id)
  local args = {status, group_id, scene_id}

  return cluster_base.command_init(self, device, args, "client")
end

function EnhancedAddSceneResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(EnhancedAddSceneResponse, {__call = EnhancedAddSceneResponse.init})

return EnhancedAddSceneResponse
