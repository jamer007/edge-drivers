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

return [[{"name": "Water Pressure Measurement", "id": "waterPressureMeasurement", "version": 1, "status": "proposed", "ephemeral": false, "attributes": {"pressure": {"schema": {"type": "object", "properties": {"value": {"type": "number", "minimum": 0}, "unit": {"type": "string", "enum": ["psi", "kPa", "bar"], "default": "psi"}}, "additionalProperties": false, "required": ["value"]}, "enumCommands": []}, "pressureAlarm": {"schema": {"type": "object", "properties": {"value": {"type": "string", "enum": ["normal", "low", "high"]}}, "additionalProperties": false, "required": ["value"]}}}, "commands": {}}]]
