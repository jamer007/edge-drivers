local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local OptionsType = require "st.zigbee.generated.zcl_clusters.Commissioning.types.Options"

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
-- Commissioning command ResetStartupParameters
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Commissioning.ResetStartupParameters
--- @alias ResetStartupParameters
---
--- @field public ID number 0x03 the ID of this command
--- @field public NAME string "ResetStartupParameters" the name of this command
--- @field public options st.zigbee.zcl.clusters.Commissioning.types.Options
--- @field public index st.zigbee.data_types.Uint8
local ResetStartupParameters = {}
ResetStartupParameters.NAME = "ResetStartupParameters"
ResetStartupParameters.ID = 0x03
ResetStartupParameters.args_def = {
  {
    name = "options",
    optional = false,
    data_type = OptionsType,
    is_complex = false,
    is_array = false,
  },
  {
    name = "index",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function ResetStartupParameters:get_fields()
  return cluster_base.command_get_fields(self)
end

ResetStartupParameters.get_length = utils.length_from_fields
ResetStartupParameters._serialize = utils.serialize_from_fields
ResetStartupParameters.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return ResetStartupParameters
function ResetStartupParameters.deserialize(buf)
  return cluster_base.command_deserialize(ResetStartupParameters, buf)
end

function ResetStartupParameters:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param options st.zigbee.zcl.clusters.Commissioning.types.Options
--- @param index st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function ResetStartupParameters.build_test_rx(device, options, index)
  local args = {options, index}

  return cluster_base.command_build_test_rx(ResetStartupParameters, device, args, "server")
end

--- Initialize the ResetStartupParameters command
---
--- @param self ResetStartupParameters the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param options st.zigbee.zcl.clusters.Commissioning.types.Options
--- @param index st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function ResetStartupParameters:init(device, options, index)
  local args = {options, index}

  return cluster_base.command_init(self, device, args, "server")
end

function ResetStartupParameters:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ResetStartupParameters, {__call = ResetStartupParameters.init})

return ResetStartupParameters