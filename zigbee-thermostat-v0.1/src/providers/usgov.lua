--[[
  Copyright 2023 Jeremy Viel

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
  except in compliance with the License. You may obtain a copy of the License at:

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software distributed under the
  License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
  either express or implied. See the License for the specific language governing permissions
  and limitations under the License.


  DESCRIPTION

  SmartThings Sinope Zigbee Thermostat Driver - parse US Gov data

--]]

local json = require "dkjson"

local function modify_current_url(current_url)

    return current_url

end


local function nodata(ftype)

    if ftype == 'temp' then
        return -999
    else
        return 0
    end
end

local function getnumvalue(data, keystr, ftype)

    local check = data

    for str in string.gmatch(keystr, "([^.]+)") do
        check = check[str]
        if not check then
            return nodata(ftype)
        end
    end

    if type(check.value) == 'number' then
        return check.value
    else
        return nodata(ftype)
    end

end


local function update_current(device, weatherdata)

    local weathertable = {
        current = {
            temperature_c = nil
        }
    }

    local data, _, _ = json.decode(weatherdata, 1, nil)
    local root = data.properties

    weathertable.current.temperature_c = getnumvalue(root, 'temperature', 'temp')

    return weathertable

end

return {
    modify_current_url = modify_current_url,
    update_current = update_current,
}