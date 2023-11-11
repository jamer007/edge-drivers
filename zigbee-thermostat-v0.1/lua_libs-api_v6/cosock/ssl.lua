-- Copyright 2021 SmartThings
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
local luasec = require "ssl"
local internals = require "cosock.socket.internals"

local m = {}

local recvmethods = {
  receive = { wantread = true, timeout = true },
}

local sendmethods = {
  dohandshake = { wantwrite = true, wantread = true, timeout = true },
  send = { wantwrite = true, timeout = true },
}

local passthrough = internals.passthroughbuilder(recvmethods, sendmethods)

m.class = function(self)
  return self.inner_sock.class()
end

m.close = passthrough("close")

m.config = passthrough("config")

m.dirty = passthrough("dirty")

m.dohandshake = passthrough("dohandshake")

m.getalpn = passthrough("getalpn")

m.getfinished = passthrough("getfinished")

m.getpeercertificate = passthrough("getpeercertificate")

m.getpeerchain = passthrough("getpeerchain")

m.getpeerverification = passthrough("getpeerverification")

m.getpeerfinished = passthrough("getpeerfinished")

m.getsniname = passthrough("getsniname")

m.getstats = passthrough("getstats")

m.loadcertificate = passthrough("loadcertificate")

m.newcontext = passthrough("newcontext")

m.receive = passthrough("receive", function()
  local pattern
  -- save partial resuts on timeout
  local parts = {}
  local bytes_remaining
  local function new_part(part)
    if type(part) == "string" and #part > 0 then
      table.insert(parts, part)
      if bytes_remaining then
        bytes_remaining = bytes_remaining - #part
      end
    end
  end

  return {
    -- transform input parameters
    input = function(ipattern, iprefix)
      assert(#parts == 0, "input transformer called more than once")
      -- save these for later
      pattern = ipattern
      if type(pattern) == "number" then bytes_remaining = pattern end
      new_part(iprefix)

      return pattern
    end,
    -- receives results of luasocket call when we need to block, provides parameters to pass when next ready
    blocked = function(_, _, partial)
      new_part(partial)
      if bytes_remaining then
        assert(bytes_remaining > 0, "somehow about to block despite being done")
        return bytes_remaining
      else
        return pattern
      end
    end,
    -- transform output after final success or (non-block) error
    output = function(recv, err, partial)
      assert(not (recv and partial), "socket recieve returned both data and partial data")
      if err == "timeout" then
        err = "wantread"
      end
      if #parts == 0 then
        return recv, err, partial
      end

      new_part(recv or partial)
      local data = table.concat(parts)

      if err then
        return nil, err, data
      else
        return data
      end
    end,
  }
end)

m.send = passthrough("send", {
  output = function(success, err, ...)
    if err == "timeout" then
      err = "wantwrite"
    end
    return success, err, ...
  end
})

m.setdane = passthrough("setdane")

m.setstats = passthrough("setstats")

m.settlsa = passthrough("settlsa")

m.sni = passthrough("sni")

m.want = passthrough("want")

m.wrap = function(tcp_socket, config)
  assert(tcp_socket.inner_sock, "tcp inner_sock is null")
  local inner_sock, err = luasec.wrap(tcp_socket.inner_sock, config)
  if not inner_sock then
    return inner_sock, err
  end
  inner_sock:settimeout(0)
  return setmetatable({ inner_sock = inner_sock, class = "tls{}", timeout = tcp_socket.timeout }, { __index = m })
end

function m:settimeout(timeout)
  self.timeout = timeout
end

internals.setuprealsocketwaker(m)

return m
