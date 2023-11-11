-- Copyright 2022 SmartThings
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

local device_management                    = require "st.zigbee.device_management"
local clusters                             = require "st.zigbee.zcl.clusters"
local cluster_base                         = require "st.zigbee.cluster_base"
local data_types                           = require "st.zigbee.data_types"
local log                                  = require "log"
local Thermostat                           = clusters.Thermostat
local ThermostatUserInterfaceConfiguration = clusters.ThermostatUserInterfaceConfiguration
local ElectricalMeasurement                = clusters.ElectricalMeasurement

local capabilities              = require "st.capabilities"
local ThermostatMode            = capabilities.thermostatMode
local ThermostatOperatingState  = capabilities.thermostatOperatingState
local ThermostatHeatingSetpoint = capabilities.thermostatHeatingSetpoint
local TemperatureMeasurement    = capabilities.temperatureMeasurement
local PowerMeter                = capabilities.powerMeter

-- Driver modules
local common = require "common"
local comms = require "comms"                   -- HTTP requests to fetch weather data
-- Weather source modules
local _usgov = require "providers.usgov"
local _cw_jamer007 = require "providers.cw_jamer007"
local _accuweather = require "providers.accuweather"

local wmodule = {
  ['usgov'] = _usgov,
  ['cw_jamer007'] = _cw_jamer007,
  ['accuweather'] = _accuweather,
}

local write = require "writeAttribute"

local SINOPE_TECHNOLOGIES_MFR_STRING = "Sinope Technologies"

local SINOPE_CUSTOM_CLUSTER = 0xFF01
local MFR_TIME_FORMAT_ATTRIBUTE = 0x0114
local MFR_AIR_FLOOR_MODE_ATTRIBUTE = 0x0105
local MFR_AMBIENT_LIMIT_ATTRIBUTE = 0x0108
local MFR_FLOOR_LOW_LIMIT_ATTRIBUTE = 0x0109
local MFR_FLOOR_SENSOR_TYPE_ATTRIBUTE = 0x010B
local MFR_FLOOR_HIGH_LIMIT_ATTRIBUTE = 0x010A
local MFR_BACKLIGHT_MODE_ATTRIBUTE = 0x0402
local MFR_AUXILIARY_CYCLE_LENGTH_ATTRIBUTE = 0x0404

local PREFERENCE_TABLES = {
  keypadLock = {
    clusterId = ThermostatUserInterfaceConfiguration.ID,
    attributeId = ThermostatUserInterfaceConfiguration.attributes.KeypadLockout.ID,
    dataType = data_types.Enum8
  },
  backlightSetting = {
    clusterId = Thermostat.ID,
    attributeId = MFR_BACKLIGHT_MODE_ATTRIBUTE,
    dataType = data_types.Enum8
  },
  timeFormat = {
    clusterId = SINOPE_CUSTOM_CLUSTER,
    attributeId = MFR_TIME_FORMAT_ATTRIBUTE,
    dataType = data_types.Enum8
  },
  airFloorMode = {
    clusterId = SINOPE_CUSTOM_CLUSTER,
    attributeId = MFR_AIR_FLOOR_MODE_ATTRIBUTE,
    dataType = data_types.Enum8
  },
  floorSensorType = {
    clusterId = SINOPE_CUSTOM_CLUSTER,
    attributeId = MFR_FLOOR_SENSOR_TYPE_ATTRIBUTE,
    dataType = data_types.Enum8
  },
  ambientLimit = {
    clusterId = SINOPE_CUSTOM_CLUSTER,
    attributeId = MFR_AMBIENT_LIMIT_ATTRIBUTE,
    dataType = data_types.Int16
  },
  floorLowLimit = {
    clusterId = SINOPE_CUSTOM_CLUSTER,
    attributeId = MFR_FLOOR_LOW_LIMIT_ATTRIBUTE,
    dataType = data_types.Int16
  },
  floorHighLimit = {
    clusterId = SINOPE_CUSTOM_CLUSTER,
    attributeId = MFR_FLOOR_HIGH_LIMIT_ATTRIBUTE,
    dataType = data_types.Int16
  },
  auxiliaryCycleLength = {
    clusterId = Thermostat.ID,
    attributeId = MFR_AUXILIARY_CYCLE_LENGTH_ATTRIBUTE,
    dataType = data_types.Uint16
  }
}

local is_sinope_thermostat = function(opts, driver, device)
  if device:get_manufacturer() == SINOPE_TECHNOLOGIES_MFR_STRING then
    return true
  else
    return false
  end
end


local do_refresh = function(self, device)
  local attributes = {
    Thermostat.attributes.LocalTemperature,
    Thermostat.attributes.OccupiedHeatingSetpoint,
    Thermostat.attributes.PIHeatingDemand,
    Thermostat.attributes.SystemMode,
    ElectricalMeasurement.attributes.ActivePower,
  }
  for _, attribute in pairs(attributes) do
    device:send(attribute:read(device))
  end
end

local do_configure = function(self, device)
  device:send(device_management.build_bind_request(device, Thermostat.ID, self.environment_info.hub_zigbee_eui))
  device:send(device_management.build_bind_request(device, ElectricalMeasurement.ID, self.environment_info.hub_zigbee_eui))
  device:send(Thermostat.attributes.LocalTemperature:configure_reporting(device, 19, 300, 25)) -- report temperature changes over 0.25°C
  device:send(Thermostat.attributes.OccupiedHeatingSetpoint:configure_reporting(device, 8, 302, 40))
  device:send(Thermostat.attributes.PIHeatingDemand:configure_reporting(device, 11, 301, 10))
  device:send(Thermostat.attributes.SystemMode:configure_reporting(device, 10, 305))
end


local outdoor_temperature_handler = function(driver, device, outdoorTemp)
  local celc_temp = outdoorTemp
  local temp_scale = "C"

  if device.preferences.wtempunit then
    temp_scale = device.preferences.wtempunit.upper()
  end

  if outdoorTemp then
    device.profile.components["outdoorTemperature"]:emit_event(capabilities.temperatureMeasurement.temperature({value = celc_temp, unit = temp_scale}))
  end

end


local function send_outside_temperature(driver, device)
  local status, weatherdata
  local baseurl = device.preferences.proxyaddr .. '/api/forward?url='
  local temp_to_set = nil

  if device.preferences.url ~= 'xxxxx' then
    local request_url
    
    if device.preferences.proxytype ~= 'none' then
      request_url = wmodule[device.preferences.wsource].modify_current_url(device.preferences.url)

      if device.preferences.proxytype == 'edge' and (common.validate_address(device.preferences.proxyaddr)) then
        request_url = baseurl .. request_url
      end
    else
      request_url = device.preferences.url
    end

    status, weatherdata = comms.issue_request(device, "GET", request_url)

    if status == true then
      weathertable = wmodule[device.preferences.wsource].update_current(device, weatherdata)

      if device.preferences.wtempunit == "c" then
        if device.preferences.displayfeelslike == "real" and weathertable.current.temperature_c then
          temp_to_set = weathertable.current.temperature_c
        elseif device.preferences.displayfeelslike == "feelslike" then
          if weathertable.current.feelslike_c then
            temp_to_set = weathertable.current.feelslike_c
          elseif weathertable.current.temperature_c then
            temp_to_set = weathertable.current.temperature_c
          end
        end
      elseif device.preferences.wtempunit == "f" then
        if device.preferences.displayfeelslike == "real" and weathertable.current.temperature_f then
          temp_to_set = weathertable.current.temperature_f
        elseif device.preferences.displayfeelslike == "feelslike" then
          if weathertable.current.feelslike_f then
            temp_to_set = weathertable.current.feelslike_f
          elseif weathertable.current.temperature_c then
            temp_to_set = weathertable.current.temperature_f
          end
        end
      end

      if temp_to_set then
        local half_round_temp_to_set = (math.floor(temp_to_set*2+0.5)/2)*100

        outdoor_temperature_handler(driver, device, half_round_temp_to_set/100)

        if device.preferences.secondarydisplay == 'outdoor' then
          -- set the outdoor temperature timeout to 3 hours
          device:send(write.custom_write_attribute(device, SINOPE_CUSTOM_CLUSTER, 0x0011, data_types.Uint16, 10800))
          -- set outdoor temp value
          device:send(write.custom_write_attribute(device, SINOPE_CUSTOM_CLUSTER, 0x0010, data_types.Int16, half_round_temp_to_set, 0x119C))
        end
      end
    else
      log.warn(string.format('Current data fetch failed for device %s', device.label))
    end
  else
    log.warn('Configuration required')
  end
end

local thermostat_heating_demand_handler = function(driver, device, heatingDemand)
  if (heatingDemand.value < 10) then
    device:emit_event(ThermostatOperatingState.thermostatOperatingState.idle())
  else
    device:emit_event(ThermostatOperatingState.thermostatOperatingState.heating())
  end
end

local function energy_meter_handler(driver, device, value)
  device:emit_event(capabilities.powerMeter.power({value = value.value, unit = "W" })) -- the unit of these values should be 'Wh'
end

-- Start automatic periodic refresh timer
local function restart_timer(driver, device)

  if device:get_field('periodictimer') then                                          -- just in case
    driver:cancel_timer(device:get_field('periodictimer'))
  end
  local periodic_timer = driver:call_on_schedule(
    device.preferences.refreshrate * 60,
    function ()
      return send_outside_temperature(driver, device)
    end,
    'Update outside temp schedule')
  device:set_field('periodictimer', periodic_timer)
  send_outside_temperature(driver, device)

end

local function info_changed(driver, device, event, args)
  for name, info in pairs(PREFERENCE_TABLES) do
    if (device.preferences[name] ~= nil and args.old_st_store.preferences[name] ~= device.preferences[name]) then
      local input = tonumber(device.preferences[name])
      if type(input) == "number" then
        if (info.dataType.ID == data_types.Int16.ID) then
          input = input * 100
        end
        device:send(cluster_base.write_attribute(device,
          data_types.ClusterId(info.clusterId),
          data_types.AttributeId(info.attributeId),
          data_types.validate_or_build_type(input, info.dataType, "payload")
        ))
      else
        log.error("Unable to set preference " .. name .. " to " .. device.preferences[name])
      end
    end
  end

  if device.preferences.secondarydisplay == 'set' then
    -- to erase it rapidly, the external temperature timeout must be set to the minimal value (30sec)
    device:send(write.custom_write_attribute(device, SINOPE_CUSTOM_CLUSTER, 0x0011, data_types.Uint16, 30))
  end

  local restarttimer = false

  if device.preferences.autorefresh == 'disabled' and device:get_field('periodictimer') then
    driver:cancel_timer(device:get_field('periodictimer'))
    device:set_field('periodictimer', nil)
  elseif device.preferences.autorefresh == 'enabled' then
    restarttimer = true
  end

  if restarttimer then; restart_timer(driver, device); end

end


local function device_init(driver, device)
  if device.preferences.autorefresh == 'enabled' then
    restart_timer(driver, device)
  end
end

local sinope_thermostat = {
  NAME = "Sinope Thermostat Handler",
  supported_capabilities = {
    capabilities.refresh,
    PowerMeter,
    TemperatureMeasurement,
    ThermostatHeatingSetpoint,
    ThermostatMode,
    ThermostatOperatingState,
  },
  zigbee_handlers = {
    attr = {
      [Thermostat.ID] = {
        [Thermostat.attributes.PIHeatingDemand.ID] = thermostat_heating_demand_handler,
        [Thermostat.attributes.OutdoorTemperature.ID] = outdoor_temperature_handler
      },
      [ElectricalMeasurement.ID] = {
        [ElectricalMeasurement.attributes.ActivePower.ID] = energy_meter_handler
      },
    }
  },
  capability_handlers = {
    [capabilities.refresh.ID] = {
      [capabilities.refresh.commands.refresh.NAME] = do_refresh,
    },
  },
  lifecycle_handlers = {
    init = device_init,
    doConfigure = do_configure,
    infoChanged = info_changed
  },
  can_handle = is_sinope_thermostat
}

return sinope_thermostat
