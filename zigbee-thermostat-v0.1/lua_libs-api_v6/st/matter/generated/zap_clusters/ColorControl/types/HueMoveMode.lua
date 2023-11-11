-- Copyright 2022 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- DO NOT EDIT: this code is automatically generated by ZCL Advanced Platform generator.

local data_types = require "st.matter.data_types"
local UintABC = require "st.matter.data_types.base_defs.UintABC"

--- @class st.matter.clusters.ColorControl.types.HueMoveMode: st.matter.data_types.Uint8
--- @alias HueMoveMode
---
--- @field public byte_length number 1
--- @field public STOP number 0
--- @field public UP number 1
--- @field public DOWN number 3

local HueMoveMode = {}
local new_mt = UintABC.new_mt({NAME = "HueMoveMode", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.STOP] = "STOP",
    [self.UP] = "UP",
    [self.DOWN] = "DOWN",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.STOP  = 0x00
new_mt.__index.UP  = 0x01
new_mt.__index.DOWN  = 0x03

HueMoveMode.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(HueMoveMode, new_mt)

return HueMoveMode

