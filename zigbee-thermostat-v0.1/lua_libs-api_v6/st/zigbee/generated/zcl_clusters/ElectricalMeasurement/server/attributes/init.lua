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

local attr_mt = {}
attr_mt.__attr_cache = {}
attr_mt.__index = function(self, key)
  if attr_mt.__attr_cache[key] == nil then
    local req_loc = string.format("st.zigbee.generated.zcl_clusters.ElectricalMeasurement.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def
  end
  return attr_mt.__attr_cache[key]
end


--- @class st.zigbee.zcl.clusters.ElectricalMeasurementServerAttributes
---
--- @field public MeasurementType st.zigbee.zcl.clusters.ElectricalMeasurement.MeasurementType
--- @field public DCVoltage st.zigbee.zcl.clusters.ElectricalMeasurement.DCVoltage
--- @field public DCVoltageMin st.zigbee.zcl.clusters.ElectricalMeasurement.DCVoltageMin
--- @field public DCVoltageMax st.zigbee.zcl.clusters.ElectricalMeasurement.DCVoltageMax
--- @field public DCCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.DCCurrent
--- @field public DCCurrentMin st.zigbee.zcl.clusters.ElectricalMeasurement.DCCurrentMin
--- @field public DCCurrentMax st.zigbee.zcl.clusters.ElectricalMeasurement.DCCurrentMax
--- @field public DCPower st.zigbee.zcl.clusters.ElectricalMeasurement.DCPower
--- @field public DCPowerMin st.zigbee.zcl.clusters.ElectricalMeasurement.DCPowerMin
--- @field public DCPowerMax st.zigbee.zcl.clusters.ElectricalMeasurement.DCPowerMax
--- @field public DCVoltageMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.DCVoltageMultiplier
--- @field public DCVoltageDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.DCVoltageDivisor
--- @field public DCCurrentMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.DCCurrentMultiplier
--- @field public DCCurrentDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.DCCurrentDivisor
--- @field public DCPowerMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.DCPowerMultiplier
--- @field public DCPowerDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.DCPowerDivisor
--- @field public ACFrequency st.zigbee.zcl.clusters.ElectricalMeasurement.ACFrequency
--- @field public ACFrequencyMin st.zigbee.zcl.clusters.ElectricalMeasurement.ACFrequencyMin
--- @field public ACFrequencyMax st.zigbee.zcl.clusters.ElectricalMeasurement.ACFrequencyMax
--- @field public NeutralCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.NeutralCurrent
--- @field public TotalActivePower st.zigbee.zcl.clusters.ElectricalMeasurement.TotalActivePower
--- @field public TotalReactivePower st.zigbee.zcl.clusters.ElectricalMeasurement.TotalReactivePower
--- @field public TotalApparentPower st.zigbee.zcl.clusters.ElectricalMeasurement.TotalApparentPower
--- @field public Measured1stHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.Measured1stHarmonicCurrent
--- @field public Measured3rdHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.Measured3rdHarmonicCurrent
--- @field public Measured5thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.Measured5thHarmonicCurrent
--- @field public Measured7thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.Measured7thHarmonicCurrent
--- @field public Measured9thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.Measured9thHarmonicCurrent
--- @field public Measured11thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.Measured11thHarmonicCurrent
--- @field public MeasuredPhase1stHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.MeasuredPhase1stHarmonicCurrent
--- @field public MeasuredPhase3rdHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.MeasuredPhase3rdHarmonicCurrent
--- @field public MeasuredPhase5thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.MeasuredPhase5thHarmonicCurrent
--- @field public MeasuredPhase7thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.MeasuredPhase7thHarmonicCurrent
--- @field public MeasuredPhase9thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.MeasuredPhase9thHarmonicCurrent
--- @field public MeasuredPhase11thHarmonicCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.MeasuredPhase11thHarmonicCurrent
--- @field public ACFrequencyMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.ACFrequencyMultiplier
--- @field public ACFrequencyDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.ACFrequencyDivisor
--- @field public PowerMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.PowerMultiplier
--- @field public PowerDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.PowerDivisor
--- @field public HarmonicCurrentMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.HarmonicCurrentMultiplier
--- @field public PhaseHarmonicCurrentMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.PhaseHarmonicCurrentMultiplier
--- @field public LineCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.LineCurrent
--- @field public ActiveCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.ActiveCurrent
--- @field public ReactiveCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.ReactiveCurrent
--- @field public RMSVoltage st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltage
--- @field public RMSVoltageMin st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageMin
--- @field public RMSVoltageMax st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageMax
--- @field public RMSCurrent st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrent
--- @field public RMSCurrentMin st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentMin
--- @field public RMSCurrentMax st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentMax
--- @field public ActivePower st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePower
--- @field public ActivePowerMin st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerMin
--- @field public ActivePowerMax st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerMax
--- @field public ReactivePower st.zigbee.zcl.clusters.ElectricalMeasurement.ReactivePower
--- @field public ApparentPower st.zigbee.zcl.clusters.ElectricalMeasurement.ApparentPower
--- @field public PowerFactor st.zigbee.zcl.clusters.ElectricalMeasurement.PowerFactor
--- @field public AverageRMSVoltageMeasurementPeriod st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSVoltageMeasurementPeriod
--- @field public AverageRMSOverVoltageCounter st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSOverVoltageCounter
--- @field public AverageRMSUnderVoltageCounter st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSUnderVoltageCounter
--- @field public RMSExtremeOverVoltagePeriod st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeOverVoltagePeriod
--- @field public RMSExtremeUnderVoltagePeriod st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeUnderVoltagePeriod
--- @field public RMSVoltageSagPeriod st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSagPeriod
--- @field public RMSVoltageSwellPeriod st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSwellPeriod
--- @field public ACVoltageMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.ACVoltageMultiplier
--- @field public ACVoltageDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.ACVoltageDivisor
--- @field public ACCurrentMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.ACCurrentMultiplier
--- @field public ACCurrentDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.ACCurrentDivisor
--- @field public ACPowerMultiplier st.zigbee.zcl.clusters.ElectricalMeasurement.ACPowerMultiplier
--- @field public ACPowerDivisor st.zigbee.zcl.clusters.ElectricalMeasurement.ACPowerDivisor
--- @field public DCOverloadAlarmsMask st.zigbee.zcl.clusters.ElectricalMeasurement.DCOverloadAlarmsMask
--- @field public DCVoltageOverload st.zigbee.zcl.clusters.ElectricalMeasurement.DCVoltageOverload
--- @field public DCCurrentOverload st.zigbee.zcl.clusters.ElectricalMeasurement.DCCurrentOverload
--- @field public ACAlarmsMask st.zigbee.zcl.clusters.ElectricalMeasurement.ACAlarmsMask
--- @field public ACVoltageOverload st.zigbee.zcl.clusters.ElectricalMeasurement.ACVoltageOverload
--- @field public ACCurrentOverload st.zigbee.zcl.clusters.ElectricalMeasurement.ACCurrentOverload
--- @field public ACActivePowerOverload st.zigbee.zcl.clusters.ElectricalMeasurement.ACActivePowerOverload
--- @field public ACReactivePowerOverload st.zigbee.zcl.clusters.ElectricalMeasurement.ACReactivePowerOverload
--- @field public AverageRMSOverVoltage st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSOverVoltage
--- @field public AverageRMSUnderVoltage st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSUnderVoltage
--- @field public RMSExtremeOverVoltage st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeOverVoltage
--- @field public RMSExtremeUnderVoltage st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeUnderVoltage
--- @field public RMSVoltageSag st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSag
--- @field public RMSVoltageSwell st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSwell
--- @field public LineCurrentPhB st.zigbee.zcl.clusters.ElectricalMeasurement.LineCurrentPhB
--- @field public ActiveCurrentPhB st.zigbee.zcl.clusters.ElectricalMeasurement.ActiveCurrentPhB
--- @field public ReactiveCurrentPhB st.zigbee.zcl.clusters.ElectricalMeasurement.ReactiveCurrentPhB
--- @field public RMSVoltagePhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltagePhB
--- @field public RMSVoltageMinPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageMinPhB
--- @field public RMSVoltageMaxPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageMaxPhB
--- @field public RMSCurrentPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentPhB
--- @field public RMSCurrentMinPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentMinPhB
--- @field public RMSCurrentMaxPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentMaxPhB
--- @field public ActivePowerPhB st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerPhB
--- @field public ActivePowerMinPhB st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerMinPhB
--- @field public ActivePowerMaxPhB st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerMaxPhB
--- @field public ReactivePowerPhB st.zigbee.zcl.clusters.ElectricalMeasurement.ReactivePowerPhB
--- @field public ApparentPowerPhB st.zigbee.zcl.clusters.ElectricalMeasurement.ApparentPowerPhB
--- @field public PowerFactorPhB st.zigbee.zcl.clusters.ElectricalMeasurement.PowerFactorPhB
--- @field public AverageRMSVoltageMeasurementPeriodPhB st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSVoltageMeasurementPeriodPhB
--- @field public AverageRMSOverVoltageCounterPhB st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSOverVoltageCounterPhB
--- @field public AverageRMSUnderVoltageCounterPhB st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSUnderVoltageCounterPhB
--- @field public RMSExtremeOverVoltagePeriodPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeOverVoltagePeriodPhB
--- @field public RMSExtremeUnderVoltagePeriodPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeUnderVoltagePeriodPhB
--- @field public RMSVoltageSagPeriodPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSagPeriodPhB
--- @field public RMSVoltageSwellPeriodPhB st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSwellPeriodPhB
--- @field public LineCurrentPhC st.zigbee.zcl.clusters.ElectricalMeasurement.LineCurrentPhC
--- @field public ActiveCurrentPhC st.zigbee.zcl.clusters.ElectricalMeasurement.ActiveCurrentPhC
--- @field public ReactiveCurrentPhC st.zigbee.zcl.clusters.ElectricalMeasurement.ReactiveCurrentPhC
--- @field public RMSVoltagePhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltagePhC
--- @field public RMSVoltageMinPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageMinPhC
--- @field public RMSVoltageMaxPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageMaxPhC
--- @field public RMSCurrentPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentPhC
--- @field public RMSCurrentMinPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentMinPhC
--- @field public RMSCurrentMaxPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSCurrentMaxPhC
--- @field public ActivePowerPhC st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerPhC
--- @field public ActivePowerMinPhC st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerMinPhC
--- @field public ActivePowerMaxPhC st.zigbee.zcl.clusters.ElectricalMeasurement.ActivePowerMaxPhC
--- @field public ReactivePowerPhC st.zigbee.zcl.clusters.ElectricalMeasurement.ReactivePowerPhC
--- @field public ApparentPowerPhC st.zigbee.zcl.clusters.ElectricalMeasurement.ApparentPowerPhC
--- @field public PowerFactorPhC st.zigbee.zcl.clusters.ElectricalMeasurement.PowerFactorPhC
--- @field public AverageRMSVoltageMeasurementPeriodPhC st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSVoltageMeasurementPeriodPhC
--- @field public AverageRMSOverVoltageCounterPhC st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSOverVoltageCounterPhC
--- @field public AverageRMSUnderVoltageCounterPhC st.zigbee.zcl.clusters.ElectricalMeasurement.AverageRMSUnderVoltageCounterPhC
--- @field public RMSExtremeOverVoltagePeriodPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeOverVoltagePeriodPhC
--- @field public RMSExtremeUnderVoltagePeriodPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSExtremeUnderVoltagePeriodPhC
--- @field public RMSVoltageSagPeriodPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSagPeriodPhC
--- @field public RMSVoltageSwellPeriodPhC st.zigbee.zcl.clusters.ElectricalMeasurement.RMSVoltageSwellPeriodPhC

local ElectricalMeasurementServerAttributes = {}

function ElectricalMeasurementServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ElectricalMeasurementServerAttributes, attr_mt)

return ElectricalMeasurementServerAttributes
