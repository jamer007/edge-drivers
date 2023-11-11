local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local EffectIdentifierType = require "st.zigbee.generated.zcl_clusters.OnOff.types.EffectIdentifier"

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
-- OnOff command OffWithEffect
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.OnOff.OffWithEffect
--- @alias OffWithEffect
---
--- @field public ID number 0x40 the ID of this command
--- @field public NAME string "OffWithEffect" the name of this command
--- @field public effect_identifier st.zigbee.zcl.clusters.OnOff.types.EffectIdentifier
--- @field public effect_variant st.zigbee.data_types.Uint8
local OffWithEffect = {}
OffWithEffect.NAME = "OffWithEffect"
OffWithEffect.ID = 0x40
OffWithEffect.args_def = {
  {
    name = "effect_identifier",
    optional = false,
    data_type = EffectIdentifierType,
    is_complex = false,
    is_array = false,
  },
  {
    name = "effect_variant",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function OffWithEffect:get_fields()
  return cluster_base.command_get_fields(self)
end

OffWithEffect.get_length = utils.length_from_fields
OffWithEffect._serialize = utils.serialize_from_fields
OffWithEffect.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return OffWithEffect
function OffWithEffect.deserialize(buf)
  return cluster_base.command_deserialize(OffWithEffect, buf)
end

function OffWithEffect:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param effect_identifier st.zigbee.zcl.clusters.OnOff.types.EffectIdentifier
--- @param effect_variant st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function OffWithEffect.build_test_rx(device, effect_identifier, effect_variant)
  local args = {effect_identifier, effect_variant}

  return cluster_base.command_build_test_rx(OffWithEffect, device, args, "server")
end

--- Initialize the OffWithEffect command
---
--- @param self OffWithEffect the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param effect_identifier st.zigbee.zcl.clusters.OnOff.types.EffectIdentifier
--- @param effect_variant st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function OffWithEffect:init(device, effect_identifier, effect_variant)
  local args = {effect_identifier, effect_variant}

  return cluster_base.command_init(self, device, args, "server")
end

function OffWithEffect:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(OffWithEffect, {__call = OffWithEffect.init})

return OffWithEffect
