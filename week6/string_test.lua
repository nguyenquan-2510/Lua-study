#!/usr/bin/env lua

local str = io.read()

local reversed = {}

for i = #str, 1, -1 do
	table.insert(reversed, string.sub(str, i, i))
end
local rev = table.concat(reversed)
print(rev)
