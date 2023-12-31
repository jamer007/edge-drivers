--[[
  Copyright 2023 Jeremy VIEL

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
  except in compliance with the License. You may obtain a copy of the License at:

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software distributed under the
  License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
  either express or implied. See the License for the specific language governing permissions
  and limitations under the License.


  DESCRIPTION
  
  SmartThings Sinope Thermostat Driver - Common code

--]]

-- Validate format of proxy IP:port address
local function validate_address(lanAddress)

  local valid = true

  local hostaddr = lanAddress:match('://(.+)$')
  if hostaddr == nil then; return false; end

  local ip = hostaddr:match('^(%d.+):')
  local port = tonumber(hostaddr:match(':(%d+)$'))

  if ip then
    local chunks = {ip:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")}
    if #chunks == 4 then
      for _, v in pairs(chunks) do
        if tonumber(v) > 255 then
          valid = false
          break
        end
      end
    else
      valid = false
    end
  else
    valid = false
  end

  if port then
    if type(port) == 'number' then
      if (port < 1) or (port > 65535) then
        valid = false
      end
    else
      valid = false
    end
  else
    valid = false
  end

  if valid then
    return ip, port
  else
    return nil
  end

end

return {
  validate_address = validate_address,
}
