#!/usr/bin/env lua

local log_file = "log.txt"
local function write_log(logfile, msg)
	local file, err = io.open(logfile, "a")
	if not file then
		print("Error : " .. err)
		return false
	end

	local time = os.date("[%Y-%m-%d] [%H:%M:%S]")
	msg = msg or "No given messages!"

	file:write(string.format("%s : %s\n", time, msg))
	file:flush()
	file:close()
	return true
end

write_log(log_file, "Hello ae day la test thoi")
