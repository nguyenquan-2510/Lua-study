#!/usr/bin/env lua

local passwd_file, err = io.open("passwd.txt", "r")

if not passwd_file then
	print(err)
	os.exit(1)
end

local data = {}

for i in passwd_file:lines() do
	local service, username, password = string.match(i, "([^|]+)|([^|]+)|(.+)")
	local e = {
		service = service,
		username = username,
		password = password,
	}
	table.insert(data, e)
end

-- Extract passwd data
io.write("Nhap ten dich vu ban muon kiem mat khau\n> ")
local search = io.read()
search = string.lower(search)

for _, e in ipairs(data) do
	local service = e.service:lower()
	if string.match(service, "(" .. search .. ")") then
		print(e.service, e.username, e.password)
	end
end

-- Convert passwd.txt to passwd.lua
local pass_convert, error = io.open("passwd.lua", "w")
if not pass_convert then
	print(error)
	os.exit(1)
end

pass_convert:write("return {\n")
-- Write data here
for _, e in ipairs(data) do
	pass_convert:write(string.format(
		[[  {
    service = "%s",
    username = "%s",
    password = "%s"
  },
]],
		e.service,
		e.username,
		e.password
	))
end
pass_convert:write("}")
-- ///
