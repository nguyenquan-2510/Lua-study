#!/usr/bin/env lua

local q = io.read()
q = tonumber(q)

local todo_list = {}

for i = 1, q do
	local task = io.read("*l")
	table.insert(todo_list, task)
end

for k, v in ipairs(todo_list) do
	print(string.format("%d. %s", k, v))
end
