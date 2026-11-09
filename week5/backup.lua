#!/usr/bin/env lua

-- A program used to create a backup folder for your folder ?
-- Yeah bcuz this is made by a noob so u can just copy folder with files included in them.
-- This program does not support nested folders ok?

--

-- On windows the command will be "dir /b" instead of "ls -1" on Linux (Or Unix)

-- Lua 5.1 btw, if u run this script on newer version (5.2+) the os.execute command may return 3 values

local selected_folder = arg[1]

local command = "ls -1 " .. selected_folder

local code = os.execute(command)

local seperator = package.config:sub(1, 1)

if code ~= 0 then
	print("Error occured when trying to execute " .. command)
	os.exit(1)
end

if not arg[1] then
	print("No folder specified.")
	os.exit(1)
end

local catch_file_output = io.popen(command, "r")

if not catch_file_output then
	print([[Error when trying to process ]] .. command)
	os.exit(1)
end

local timestamp = os.date("%Y-%m-%d-%H-%M-%S")
local backup_folder = timestamp .. "." .. selected_folder

os.execute("mkdir " .. backup_folder)

for i in catch_file_output:lines() do
	local exec = "luacp " .. selected_folder .. seperator .. i .. " " .. backup_folder .. seperator .. i
	os.execute(exec)
end

print("OK?")
