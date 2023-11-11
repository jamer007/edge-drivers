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
-- Groups command AddGroupIfIdentifying
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Groups.AddGroupIfIdentifying
--- @alias AddGroupIfIdentifying
---
--- @field public ID number 0x05 the ID of this command
--- @field public NAME string "AddGroupIfIdentifying" the name of this command
--- @field public group_id st.zigbee.data_types.Uint16
--- @field public group_name st.zigbee.data_types.CharString
local AddGroupIfIdentifying = {}
AddGroupIfIdentifying.NAME = "AddGroupIfIdentifying"
AddGroupIfIdentifying.ID = 0x05
AddGroupIfIdentifying.args_def = {
  {
    name = "group_id",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "group_name",
    optional = false,
    data_type = data_types.CharString,
    is_complex = false,
    is_array = false,
    default = "",
  },
}

function AddGroupIfIdentifying:get_fields()
  return cluster_base.command_get_fields(self)
end

AddGroupIfIdentifying.get_length = utils.length_from_fields
AddGroupIfIdentifying._serialize = utils.serialize_from_fields
AddGroupIfIdentifying.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return AddGroupIfIdentifying
function AddGroupIfIdentifying.deserialize(buf)
  return cluster_base.command_deserialize(AddGroupIfIdentifying, buf)
end

function AddGroupIfIdentifying:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param group_id st.zigbee.data_types.Uint16
--- @param group_name st.zigbee.data_types.CharString
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function AddGroupIfIdentifying.build_test_rx(device, group_id, group_name)
  local args = {group_id, group_name}

  return cluster_base.command_build_test_rx(AddGroupIfIdentifying, device, args, "server")
end

--- Initialize the AddGroupIfIdentifying command
---
--- @param self AddGroupIfIdentifying the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param group_id st.zigbee.data_types.Uint16
--- @param group_name st.zigbee.data_types.CharString
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function AddGroupIfIdentifying:init(device, group_id, group_name)
  local args = {group_id, group_name}

  return cluster_base.command_init(self, device, args, "server")
end

function AddGroupIfIdentifying:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(AddGroupIfIdentifying, {__call = AddGroupIfIdentifying.init})

return AddGroupIfIdentifying
