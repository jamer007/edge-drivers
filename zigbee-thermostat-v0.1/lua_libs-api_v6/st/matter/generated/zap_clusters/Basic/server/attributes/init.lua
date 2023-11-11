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

local attr_mt = {}
attr_mt.__attr_cache = {}
attr_mt.__index = function(self, key)
  if attr_mt.__attr_cache[key] == nil then
    local req_loc = string.format("st.matter.generated.zap_clusters.Basic.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def
  end
  return attr_mt.__attr_cache[key]
end

--- @class st.matter.generated.zap_clusters.BasicServerAttributes
---
--- @field public DataModelRevision st.matter.generated.zap_clusters.Basic.server.attributes.DataModelRevision
--- @field public VendorName st.matter.generated.zap_clusters.Basic.server.attributes.VendorName
--- @field public VendorID st.matter.generated.zap_clusters.Basic.server.attributes.VendorID
--- @field public ProductName st.matter.generated.zap_clusters.Basic.server.attributes.ProductName
--- @field public ProductID st.matter.generated.zap_clusters.Basic.server.attributes.ProductID
--- @field public NodeLabel st.matter.generated.zap_clusters.Basic.server.attributes.NodeLabel
--- @field public Location st.matter.generated.zap_clusters.Basic.server.attributes.Location
--- @field public HardwareVersion st.matter.generated.zap_clusters.Basic.server.attributes.HardwareVersion
--- @field public HardwareVersionString st.matter.generated.zap_clusters.Basic.server.attributes.HardwareVersionString
--- @field public SoftwareVersion st.matter.generated.zap_clusters.Basic.server.attributes.SoftwareVersion
--- @field public SoftwareVersionString st.matter.generated.zap_clusters.Basic.server.attributes.SoftwareVersionString
--- @field public ManufacturingDate st.matter.generated.zap_clusters.Basic.server.attributes.ManufacturingDate
--- @field public PartNumber st.matter.generated.zap_clusters.Basic.server.attributes.PartNumber
--- @field public ProductURL st.matter.generated.zap_clusters.Basic.server.attributes.ProductURL
--- @field public ProductLabel st.matter.generated.zap_clusters.Basic.server.attributes.ProductLabel
--- @field public SerialNumber st.matter.generated.zap_clusters.Basic.server.attributes.SerialNumber
--- @field public LocalConfigDisabled st.matter.generated.zap_clusters.Basic.server.attributes.LocalConfigDisabled
--- @field public Reachable st.matter.generated.zap_clusters.Basic.server.attributes.Reachable
--- @field public UniqueID st.matter.generated.zap_clusters.Basic.server.attributes.UniqueID
--- @field public CapabilityMinima st.matter.generated.zap_clusters.Basic.server.attributes.CapabilityMinima
--- @field public AcceptedCommandList st.matter.generated.zap_clusters.Basic.server.attributes.AcceptedCommandList
--- @field public AttributeList st.matter.generated.zap_clusters.Basic.server.attributes.AttributeList
local BasicServerAttributes = {}

function BasicServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(BasicServerAttributes, attr_mt)

return BasicServerAttributes

