local env = require('env')
local http = require("http")

print("Starting server to listen at "..env.get("OPENSHIFT_INTERNAL_IP")..":"..env.get("OPENSHIFT_INTERNAL_PORT"))
http.createServer(function (req, res)
  local body = "Hello world\n"
  res:writeHead(200, {
    ["Content-Type"] = "text/plain",
    ["Content-Length"] = #body
  })
  res:finish(body)
end):listen(tonumber(env.get("OPENSHIFT_INTERNAL_PORT")), env.get("OPENSHIFT_INTERNAL_IP"))

print("Server listening at http://"..env.get("OPENSHIFT_INTERNAL_IP")..":"..env.get("OPENSHIFT_INTERNAL_PORT").."/")