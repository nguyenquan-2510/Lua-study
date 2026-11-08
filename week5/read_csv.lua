#!/usr/bin/env lua

local data, err = io.open("data.csv", "r")
if not data then
	print(err)
	os.exit(1)
end

local lines = {}

for i in data:lines() do
	local line = {}
	for j in i:gmatch("([^,]+)") do
		local clean_data = string.gsub(j, "^%s*(.-)%s*$", "%1")
		table.insert(line, clean_data)
	end

	table.insert(lines, line)
end

for _, line in ipairs(lines) do
	print(string.format(" %25s | %6s | %15s | %4s | %7s", line[1], line[2], line[3], line[4], line[5]))
end
