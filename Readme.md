# Lua Web Server

This is a sample project to create a simple web server using Lua. The server responds to specific routes and can read a JSON file and return it as a response.

## Requirements

- Lua 5.1 or newer
- `luarocks` package manager

## Installation

1. In the first step, let's install the `lua-socket` module. Run the following command in the terminal:

doas luarocks install luasocket

2. Next, let's install the `lua-cjson` module. Run the following command in the terminal:

doas luarocks install lua-cjson

## Usage

1. To start the example server, run the following command in the terminal:

lua server.lua


2. If the server starts successfully, you will see an output in the terminal saying "Web server is running: http://localhost:8080/".

3. You can visit addresses like "http://localhost:8080/query" in your browser to see the server's responses.

4. For the `/query` route, the server will read the `db.json` file and return its content as a JSON response.

5. For all other routes, the server will return a "Page not found!" message.

## Notes

- Make sure the `db.json` file is in a valid JSON format and located in the directory where the server is running.

- You can terminate the server by pressing `Ctrl + C` in the terminal.

---

I hope these instructions are helpful. If you have any questions, please let me know.

## Build 

-  luac -o compiled.lua server.lua


