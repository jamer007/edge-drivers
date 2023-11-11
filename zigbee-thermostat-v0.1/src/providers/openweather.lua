--[[
  Copyright 2022 Todd Austin

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
  except in compliance with the License. You may obtain a copy of the License at:

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software distributed under the
  License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
  either express or implied. See the License for the specific language governing permissions
  and limitations under the License.


  DESCRIPTION
  
  SmartThings Edge Weather Driver - parse OpenWeather data

--]]

local capabilities = require "st.capabilities"
local json = require "dkjson"
local log = require "log"


local function modify_current_url(current_url)

  return current_url

end


local function getnumvalue(data, keystr)
  local check = data

  for str in string.gmatch(keystr, "([^.]+)") do
    check = check[str]
    if not check then
      return 0
    end
  end
  
  return check

end


local function update_current(device, weatherdata)

  local weathertable = {
    current = {
      temperature_c = nil,
      feels_like_c = nil,
      temperature_f = nil,
      feels_like_f = nil,
    }
  }

  local data, _, _ = json.decode (weatherdata, 1, nil)

  if data[1] then
    weathertable.current.temperature_c = getnumvalue(data, 'main.temp')-273.15
    weathertable.current.feelslike_c = getnumvalue(data, 'main.feels_like_c')-273.15
  end

  return weathertable
  
end

return {
  modify_current_url = modify_current_url,
  update_current = update_current,
}
