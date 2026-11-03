#!/usr/bin/env lua

local dict = {
	apple = "tao",
	book = "sach",
	cat = "meo",
	dog = "cho",
	house = "nha",
}

local query = io.read()

if not dict[query] then
	print("Khong tim thay")
	os.exit(0)
end

print(dict[query])
