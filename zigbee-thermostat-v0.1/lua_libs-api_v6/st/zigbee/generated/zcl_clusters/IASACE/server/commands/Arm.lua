local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local ArmModeType = require "st.zigbee.generated.zcl_clusters.IASACE.types.ArmMode"

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
-- IASACE command Arm
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.IASACE.Arm
--- @alias Arm
---
--- @field public ID number 0x00 the ID of this command
--- @field public NAME string "Arm" the name of this command
--- @field public arm_mode st.zigbee.zcl.clusters.IASACE.types.ArmMode
--- @field public arm_disarm_code st.zigbee.data_types.CharString
--- @field public zone_id st.zigbee.data_types.Uint8
local Arm = {}
Arm.NAME = "Arm"
Arm.ID = 0x00
Arm.args_def = {
  {
    name = "arm_mode",
    optional = false,
    data_type = ArmModeType,
    is_complex = false,
    is_array = false,
  },
  {
    name = "arm_disarm_code",
    optional = false,
    data_type = data_types.CharString,
    is_complex = false,
    is_array = false,
    default = "",
  },
  {
    name = "zone_id",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function Arm:get_fields()
  return cluster_base.command_get_fields(self)
end

Arm.get_length = utils.length_from_fields
Arm._serialize = utils.serialize_from_fields
Arm.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return Arm
function Arm.deserialize(buf)
  return cluster_base.command_deserialize(Arm, buf)
end

function Arm:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param arm_mode st.zigbee.zcl.clusters.IASACE.types.ArmMode
--- @param arm_disarm_code st.zigbee.data_types.CharString
--- @param zone_id st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function Arm.build_test_rx(device, arm_mode, arm_disarm_code, zone_id)
  local args = {arm_mode, arm_disarm_code, zone_id}

  return cluster_base.command_build_test_rx(Arm, device, args, "server")
end

--- Initialize the Arm command
---
--- @param self Arm the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param arm_mode st.zigbee.zcl.clusters.IASACE.types.ArmMode
--- @param arm_disarm_code st.zigbee.data_types.CharString
--- @param zone_id st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function Arm:init(device, arm_mode, arm_disarm_code, zone_id)
  local args = {arm_mode, arm_disarm_code, zone_id}

  return cluster_base.command_init(self, device, args, "server")
end

function Arm:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(Arm, {__call = Arm.init})

return Arm
