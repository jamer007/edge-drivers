local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local CcColorOptionsType = require "st.zigbee.generated.zcl_clusters.ColorControl.types.CcColorOptions"

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
-- ColorControl command MoveToColorTemperature
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.ColorControl.MoveToColorTemperature
--- @alias MoveToColorTemperature
---
--- @field public ID number 0x0A the ID of this command
--- @field public NAME string "MoveToColorTemperature" the name of this command
--- @field public color_temperature_mireds st.zigbee.data_types.Uint16
--- @field public transition_time st.zigbee.data_types.Uint16
--- @field public options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @field public options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
local MoveToColorTemperature = {}
MoveToColorTemperature.NAME = "MoveToColorTemperature"
MoveToColorTemperature.ID = 0x0A
MoveToColorTemperature.args_def = {
  {
    name = "color_temperature_mireds",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "transition_time",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "options_mask",
    optional = false,
    data_type = CcColorOptionsType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "options_override",
    optional = false,
    data_type = CcColorOptionsType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function MoveToColorTemperature:get_fields()
  return cluster_base.command_get_fields(self)
end

MoveToColorTemperature.get_length = utils.length_from_fields
MoveToColorTemperature._serialize = utils.serialize_from_fields
MoveToColorTemperature.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return MoveToColorTemperature
function MoveToColorTemperature.deserialize(buf)
  return cluster_base.command_deserialize(MoveToColorTemperature, buf)
end

function MoveToColorTemperature:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param color_temperature_mireds st.zigbee.data_types.Uint16
--- @param transition_time st.zigbee.data_types.Uint16
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function MoveToColorTemperature.build_test_rx(device, color_temperature_mireds, transition_time, options_mask, options_override)
  local args = {color_temperature_mireds, transition_time, options_mask, options_override}

  return cluster_base.command_build_test_rx(MoveToColorTemperature, device, args, "server")
end

--- Initialize the MoveToColorTemperature command
---
--- @param self MoveToColorTemperature the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param color_temperature_mireds st.zigbee.data_types.Uint16
--- @param transition_time st.zigbee.data_types.Uint16
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function MoveToColorTemperature:init(device, color_temperature_mireds, transition_time, options_mask, options_override)
  local args = {color_temperature_mireds, transition_time, options_mask, options_override}

  return cluster_base.command_init(self, device, args, "server")
end

function MoveToColorTemperature:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(MoveToColorTemperature, {__call = MoveToColorTemperature.init})

return MoveToColorTemperature
