local socket = require("socket")
local cjson = require("cjson.safe")

local host = "localhost"
local port = 8080

function readJSONFile(filename)
    local file = io.open(filename, "r")
    if file then
        local content = file:read("*a")
        file:close()
        return cjson.decode(content)
    end
    return nil
end

function handleRequest(client)
    local request = client:receive()
    local response

    if request:find("GET /query") then
        local data = readJSONFile("db.json")
        if data then
            response = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n" .. cjson.encode(data)
        else
            response = "HTTP/1.1 500 Internal Server Error\r\nContent-Type: text/plain\r\n\r\nError reading JSON file"
        end
    else
        response = "HTTP/1.1 404 Not Found\r\nContent-Type: text/plain\r\n\r\nPage not found!"
    end

    client:send(response)
    client:close()
end

local server = assert(socket.bind(host, port))

print("Web server running: http://" .. host .. ":" .. port .. "/")

while true do
    local client = server:accept()
    handleRequest(client)
end
