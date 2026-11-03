#!/usr/bin/env lua

local str = io.read()

local word_count = {}

for i in str:gmatch("%a+") do
	local skibidi = string.lower(i)
	word_count[skibidi] = (word_count[skibidi] or 0) + 1
end

for k, v in pairs(word_count) do
	print(string.format("%s %d", k, v))
end
