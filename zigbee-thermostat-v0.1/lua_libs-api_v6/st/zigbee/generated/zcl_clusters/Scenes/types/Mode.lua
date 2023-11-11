local data_types = require "st.zigbee.data_types"
local BitmapABC = require "st.zigbee.data_types.base_defs.BitmapABC"

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

--- @class st.zigbee.zcl.clusters.Scenes.types.Mode: st.zigbee.data_types.Bitmap8
--- @alias Mode
---
--- @field public byte_length number 1
--- @field public COPY_ALL_SCENES number 1
local Mode = {}
local new_mt = BitmapABC.new_mt({NAME = "Mode", ID = data_types.name_to_id_map["Bitmap8"]}, 1)
new_mt.__index.BASE_MASK       = 0xFF
new_mt.__index.COPY_ALL_SCENES = 0x01

--- @function Mode:is_copy_all_scenes_set
--- @return boolean True if the value of COPY_ALL_SCENES is non-zero
new_mt.__index.is_copy_all_scenes_set = function(self)
  return (self.value & self.COPY_ALL_SCENES) ~= 0
end
 
--- @function Mode:set_copy_all_scenes
--- Set the value of the bit in the COPY_ALL_SCENES field to 1
new_mt.__index.set_copy_all_scenes = function(self)
  self.value = self.value | self.COPY_ALL_SCENES
end

--- @function Mode:unset_copy_all_scenes
--- Set the value of the bits in the COPY_ALL_SCENES field to 0
new_mt.__index.unset_copy_all_scenes = function(self)
  self.value = self.value & (~self.COPY_ALL_SCENES & self.BASE_MASK)
end

setmetatable(Mode, new_mt)
return Mode