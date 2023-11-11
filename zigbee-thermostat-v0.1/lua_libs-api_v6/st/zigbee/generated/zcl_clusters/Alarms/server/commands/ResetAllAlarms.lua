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
-- Alarms command ResetAllAlarms
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Alarms.ResetAllAlarms
--- @alias ResetAllAlarms
---
--- @field public ID number 0x01 the ID of this command
--- @field public NAME string "ResetAllAlarms" the name of this command
local ResetAllAlarms = {}
ResetAllAlarms.NAME = "ResetAllAlarms"
ResetAllAlarms.ID = 0x01
ResetAllAlarms.args_def = {}

function ResetAllAlarms:get_fields()
  return cluster_base.command_get_fields(self)
end

ResetAllAlarms.get_length = utils.length_from_fields
ResetAllAlarms._serialize = utils.serialize_from_fields
ResetAllAlarms.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return ResetAllAlarms
function ResetAllAlarms.deserialize(buf)
  return cluster_base.command_deserialize(ResetAllAlarms, buf)
end

function ResetAllAlarms:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function ResetAllAlarms.build_test_rx(device)
  local args = {}

  return cluster_base.command_build_test_rx(ResetAllAlarms, device, args, "server")
end

--- Initialize the ResetAllAlarms command
---
--- @param self ResetAllAlarms the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function ResetAllAlarms:init(device)
  local args = {}

  return cluster_base.command_init(self, device, args, "server")
end

function ResetAllAlarms:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ResetAllAlarms, {__call = ResetAllAlarms.init})

return ResetAllAlarms
