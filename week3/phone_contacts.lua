#!/usr/bin/env lua

local n = io.read()
n = tonumber(n)

local contact_arr = {}

for _ = 1, n do
	local name, phone = io.read("*l"):match("(%S+) (%S+)")
	local contact = { name = string.lower(name), phone = phone }
	table.insert(contact_arr, contact)
end

local q = io.read()
local qq = string.lower(q)

for _, v in ipairs(contact_arr) do
	if qq == v.name then
		print(v.phone)
		os.exit(0)
	end
end
print("Khong tim thay")
