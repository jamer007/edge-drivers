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
local cluster_base = require "st.matter.cluster_base"
local TLVParser = require "st.matter.TLV.TLVParser"
local StructureABC = require "st.matter.data_types.base_defs.StructureABC"
local DlLockOperationType = require "st.matter.generated.zap_clusters.DoorLock.types.DlLockOperationType"
local DlOperationSource = require "st.matter.generated.zap_clusters.DoorLock.types.DlOperationSource"
local DlOperationError = require "st.matter.generated.zap_clusters.DoorLock.types.DlOperationError"
local DlCredential = require "st.matter.generated.zap_clusters.DoorLock.types.DlCredential"

--- @class st.matter.clusters.DoorLock.LockOperationError
--- @alias LockOperationError
---
--- @field public ID number 0x0003 the ID of this event
--- @field public NAME string "LockOperationError" the name of this event
--- @field public lock_operation_type st.matter.clusters.DoorLock.types.DlLockOperationType
--- @field public operation_source st.matter.clusters.DoorLock.types.DlOperationSource
--- @field public operation_error st.matter.clusters.DoorLock.types.DlOperationError
--- @field public user_index data_types.Uint16
--- @field public fabric_index data_types.Uint8
--- @field public source_node data_types.Uint64
--- @field public credentials data_types.Array
local LockOperationError = {
  ID = 0x0003,
  NAME = "LockOperationError",
  base_type = data_types.Structure,
}

LockOperationError.field_defs = {
  {
    data_type = DlLockOperationType,
    field_id = 0,
    is_array = false,
    name = "lock_operation_type",
    is_nullable = false,
    is_optional = false,
  },
  {
    data_type = DlOperationSource,
    field_id = 1,
    is_array = false,
    name = "operation_source",
    is_nullable = false,
    is_optional = false,
  },
  {
    data_type = DlOperationError,
    field_id = 2,
    is_array = false,
    name = "operation_error",
    is_nullable = false,
    is_optional = false,
  },
  {
    data_type = data_types.Uint16,
    field_id = 3,
    is_array = false,
    name = "user_index",
    is_nullable = true,
    is_optional = true,
  },
  {
    data_type = data_types.Uint8,
    field_id = 4,
    is_array = false,
    name = "fabric_index",
    is_nullable = true,
    is_optional = true,
  },
  {
    data_type = data_types.Uint64,
    field_id = 5,
    is_array = false,
    name = "source_node",
    is_nullable = true,
    is_optional = true,
  },
  {
    data_type = DlCredential,
    field_id = 6,
    is_array = true,
    name = "credentials",
    is_nullable = true,
    is_optional = true,
  },
}
--- Add field names to each event field
---
--- @param base_type_obj st.matter.data_types.Structure
function LockOperationError:augment_type(base_type_obj)
  local elems = {}
  for _, v in ipairs(base_type_obj.elements) do
    for _, field_def in ipairs(self.field_defs) do
      if field_def.field_id == v.field_id and not
        ((field_def.is_nullable or field_def.is_optional) and v.value == nil) then
        elems[field_def.name] = data_types.validate_or_build_type(v, field_def.data_type, field_def.field_name)
        elems[field_def.name].field_name = field_def.name
      end
    end
  end
  base_type_obj.elements = elems
end

--- Constructs a read InteractionRequest for the Event
---
--- @param device st.matter.Device
--- @param endpoint_id number|nil
--- @return st.matter.interaction_model.InteractionRequest
function LockOperationError:read(device, endpoint_id)
  return cluster_base.read(
    device,
    endpoint_id,
    self._cluster.ID,
    nil, --attribute_id
    self.ID
  )
end

--- Constructs a subscribe InteractionRequest for the Event
---
--- @param device any
--- @param endpoint_id number|nil
--- @return st.matter.interaction_model.InteractionRequest
function LockOperationError:subscribe(device, endpoint_id)
  return cluster_base.subscribe(
    device,
    endpoint_id,
    self._cluster.ID,
    nil, --attribute_id
    self.ID
  )
end

--- Builds an LockOperationError test event report reponse to be used by
--- the driver integration testing framework.
---
--- @param device st.matter.Device the device to build this message for
--- @param endpoint_id number|nil
--- @param fields table containing the event fields
--- @param status string Interaction status associated with the path
--- @return st.matter.interaction_model.InteractionResponse of type REPORT_DATA
function LockOperationError:build_test_event_report(
  device,
  endpoint_id,
  fields,
  status
)
  local data = {}
  data.elements = {}
  data.num_elements = 0
  setmetatable(data, StructureABC.new_mt({NAME = "LockOperationErrorEventData", ID = 0x15}))
  for idx, field_def in ipairs(self.field_defs) do --Note: idx is 1 when field_id is 0
    if (not field_def.is_optional or not field_def.is_nullable) and not fields[field_def.name] then
      error("Missing non optional or non_nullable field: " .. field_def.name)
    elseif fields[field_def.name] then
      data.elements[field_def.name] = data_types.validate_or_build_type(fields[field_def.name], field_def.data_type, field_def.name)
      data.elements[field_def.name].field_id = field_def.field_id
      data.num_elements = data.num_elements + 1
    end
  end
  return cluster_base.build_test_event_report(
    device,
    endpoint_id,
    self._cluster.ID,
    self.ID,
    data,
    status
  )
end

function LockOperationError:deserialize(tlv_buf)
  local data = TLVParser.decode_tlv(tlv_buf)
  self:augment_type(data)
  return data
end

function LockOperationError:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

return LockOperationError

