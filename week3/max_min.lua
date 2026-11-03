#!/usr/bin/env lua
local _ = io.read()
local a = io.read()

local arr = {}

for i in string.gmatch(a, "%S+") do
	table.insert(arr, tonumber(i))
end

local max_val = -math.huge
local min_val = math.huge

for _, i in pairs(arr) do
	if i > max_val then
		max_val = i
	end
	if i < min_val then
		min_val = i
	end
end
print(string.format("%d %d", max_val, min_val))
