local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local EffectVariantType = require "st.zigbee.generated.zcl_clusters.Identify.types.EffectVariant"
local EffectIdentifierType = require "st.zigbee.generated.zcl_clusters.Identify.types.EffectIdentifier"

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
-- Identify command TriggerEffect
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Identify.TriggerEffect
--- @alias TriggerEffect
---
--- @field public ID number 0x40 the ID of this command
--- @field public NAME string "TriggerEffect" the name of this command
--- @field public effect_identifier st.zigbee.zcl.clusters.Identify.types.EffectIdentifier
--- @field public effect_variant st.zigbee.zcl.clusters.Identify.types.EffectVariant
local TriggerEffect = {}
TriggerEffect.NAME = "TriggerEffect"
TriggerEffect.ID = 0x40
TriggerEffect.args_def = {
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
    data_type = EffectVariantType,
    is_complex = false,
    is_array = false,
  },
}

function TriggerEffect:get_fields()
  return cluster_base.command_get_fields(self)
end

TriggerEffect.get_length = utils.length_from_fields
TriggerEffect._serialize = utils.serialize_from_fields
TriggerEffect.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return TriggerEffect
function TriggerEffect.deserialize(buf)
  return cluster_base.command_deserialize(TriggerEffect, buf)
end

function TriggerEffect:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param effect_identifier st.zigbee.zcl.clusters.Identify.types.EffectIdentifier
--- @param effect_variant st.zigbee.zcl.clusters.Identify.types.EffectVariant
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function TriggerEffect.build_test_rx(device, effect_identifier, effect_variant)
  local args = {effect_identifier, effect_variant}

  return cluster_base.command_build_test_rx(TriggerEffect, device, args, "server")
end

--- Initialize the TriggerEffect command
---
--- @param self TriggerEffect the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param effect_identifier st.zigbee.zcl.clusters.Identify.types.EffectIdentifier
--- @param effect_variant st.zigbee.zcl.clusters.Identify.types.EffectVariant
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function TriggerEffect:init(device, effect_identifier, effect_variant)
  local args = {effect_identifier, effect_variant}

  return cluster_base.command_init(self, device, args, "server")
end

function TriggerEffect:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(TriggerEffect, {__call = TriggerEffect.init})

return TriggerEffect
