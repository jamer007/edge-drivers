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
local log = require "log"
local TLVParser = require "st.matter.TLV.TLVParser"
local DlStatusType = require "st.matter.generated.zap_clusters.DoorLock.types.DlStatus"
local DlDaysMaskMapType = require "st.matter.generated.zap_clusters.DoorLock.types.DlDaysMaskMap"

-----------------------------------------------------------
-- DoorLock command GetWeekDayScheduleResponse
-----------------------------------------------------------

--- @class st.matter.clusters.DoorLock.GetWeekDayScheduleResponse
--- @alias GetWeekDayScheduleResponse
---
--- @field public ID number 0x000C the ID of this command
--- @field public NAME string "GetWeekDayScheduleResponse" the name of this command
--- @field public week_day_index data_types.Uint8
--- @field public user_index data_types.Uint16
--- @field public status st.matter.clusters.DoorLock.types.DlStatus
--- @field public days_mask st.matter.clusters.DoorLock.types.DlDaysMaskMap
--- @field public start_hour data_types.Uint8
--- @field public start_minute data_types.Uint8
--- @field public end_hour data_types.Uint8
--- @field public end_minute data_types.Uint8
local GetWeekDayScheduleResponse = {}

GetWeekDayScheduleResponse.NAME = "GetWeekDayScheduleResponse"
GetWeekDayScheduleResponse.ID = 0x000C
GetWeekDayScheduleResponse.field_defs = {
  {
    name = "week_day_index",
    field_id = 0,
    optional = false,
    is_nullable = false,
    data_type = data_types.Uint8,
  },
  {
    name = "user_index",
    field_id = 1,
    optional = false,
    is_nullable = false,
    data_type = data_types.Uint16,
  },
  {
    name = "status",
    field_id = 2,
    optional = false,
    is_nullable = false,
    data_type = DlStatusType,
  },
  {
    name = "days_mask",
    field_id = 3,
    optional = true,
    is_nullable = false,
    data_type = DlDaysMaskMapType,
  },
  {
    name = "start_hour",
    field_id = 4,
    optional = true,
    is_nullable = false,
    data_type = data_types.Uint8,
  },
  {
    name = "start_minute",
    field_id = 5,
    optional = true,
    is_nullable = false,
    data_type = data_types.Uint8,
  },
  {
    name = "end_hour",
    field_id = 6,
    optional = true,
    is_nullable = false,
    data_type = data_types.Uint8,
  },
  {
    name = "end_minute",
    field_id = 7,
    optional = true,
    is_nullable = false,
    data_type = data_types.Uint8,
  },
}

--- Add field names to each command field
---
--- @param base_type_obj st.matter.data_types.Structure
function GetWeekDayScheduleResponse:augment_type(base_type_obj)
  local elems = {}
  for _, v in ipairs(base_type_obj.elements) do
    for _, field_def in ipairs(self.field_defs) do
      if field_def.field_id == v.field_id and
         field_def.is_nullable and
         (v.value == nil and v.elements == nil) then
        elems[field_def.name] = data_types.validate_or_build_type(v, data_types.Null, field_def.field_name)
      elseif field_def.field_id == v.field_id and not
        (field_def.is_optional and v.value == nil) then
        elems[field_def.name] = data_types.validate_or_build_type(v, field_def.data_type, field_def.field_name)
        if field_def.array_type ~= nil then
          for i, e in ipairs(elems[field_def.name].elements) do
            elems[field_def.name].elements[i] = data_types.validate_or_build_type(e, field_def.array_type)
          end
        end
      end
    end
  end
  base_type_obj.elements = elems
end

--- Builds an GetWeekDayScheduleResponse test command reponse for the driver integration testing framework
---
--- @param device st.matter.Device the device to build this message to
--- @param endpoint_id number|nil
--- @param week_day_index data_types.Uint8
--- @param user_index data_types.Uint16
--- @param status st.matter.clusters.DoorLock.types.DlStatus
--- @param days_mask st.matter.clusters.DoorLock.types.DlDaysMaskMap
--- @param start_hour data_types.Uint8
--- @param start_minute data_types.Uint8
--- @param end_hour data_types.Uint8
--- @param end_minute data_types.Uint8
--- @return st.matter.st.matter.interaction_model.InteractionResponse of type COMMAND_RESPONSE
function GetWeekDayScheduleResponse:build_test_command_response(device, endpoint_id, week_day_index, user_index, status, days_mask, start_hour, start_minute, end_hour, end_minute, interaction_status)
  local function init(self, device, endpoint_id, week_day_index, user_index, status, days_mask, start_hour, start_minute, end_hour, end_minute)
    local out = {}
    local args = {week_day_index, user_index, status, days_mask, start_hour, start_minute, end_hour, end_minute}
    if #args > #self.field_defs then
      error(self.NAME .. " received too many arguments")
    end
    for i,v in ipairs(self.field_defs) do
      if v.optional and args[i] == nil then
        out[v.name] = nil
      elseif v.is_nullable and args[i] == nil then
        out[v.name] = data_types.validate_or_build_type(args[i], data_types.Null, v.name)
        out[v.name].field_id = v.field_id
      elseif not v.optional and args[i] == nil then
        out[v.name] = data_types.validate_or_build_type(v.default, v.data_type, v.name)
        out[v.name].field_id = v.field_id
      else
        out[v.name] = data_types.validate_or_build_type(args[i], v.data_type, v.name)
        out[v.name].field_id = v.field_id
      end
    end
    setmetatable(out, {
      __index = GetWeekDayScheduleResponse,
      __tostring = GetWeekDayScheduleResponse.pretty_print
    })
    return self._cluster:build_cluster_command(
      device,
      out,
      endpoint_id,
      self._cluster.ID,
      self.ID
    )
  end
  local self_request =  init(self, device, endpoint_id, week_day_index, user_index, status, days_mask, start_hour, start_minute, end_hour, end_minute)
  return self._cluster:build_test_command_response(
    device,
    endpoint_id,
    self._cluster.ID,
    self.ID,
    self_request.info_blocks[1].tlv,
    interaction_status
  )
end

--- Initialize the GetWeekDayScheduleResponse command
---
--- @return nil
function GetWeekDayScheduleResponse:init()
  return nil
end

function GetWeekDayScheduleResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

function GetWeekDayScheduleResponse:deserialize(tlv_buf)
  local data = TLVParser.decode_tlv(tlv_buf)
  self:augment_type(data)
  return data
end

setmetatable(GetWeekDayScheduleResponse, {__call = GetWeekDayScheduleResponse.init})

return GetWeekDayScheduleResponse
