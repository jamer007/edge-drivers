

local test = require "integration_test"
local t_utils = require "integration_test.utils"
local zigbee_test_utils = require "integration_test.zigbee_test_utils"

local comms = require "comms"
local log = require "log"


local mock_device = test.mock_device.build_test_zigbee_device(
        {
            profile = t_utils.get_profile_definition("thermostat-sinope.yml"),
            zigbee_endpoints = {
                [1] = {
                    id = 1,
                    manufacturer = "Sinope Technologies",
                    model = "TH1123ZB",
                    server_clusters = {0x0201, 0x0402, 0x0B04}
                }
            }
        }
)

zigbee_test_utils.prepare_zigbee_env_info()
local function test_init()
    test.mock_device.add_test_device(mock_device)
    zigbee_test_utils.init_noop_health_check_timer()
end

test.set_test_init_function(test_init)

local test_decode_cw = function()
    request_url = "http://127.0.0.1:5001/accuweather/dddd"
    status, weatherdata = comms.issue_request(mock_device, "GET", request_url)
    if 2 == 2 then
        error('FAILED')
    end
    log.info('test')
end


test.register_coroutine_test(
        "Configure should configure all necessary attributes",
        test_decode_cw
)

test.run_registered_tests()