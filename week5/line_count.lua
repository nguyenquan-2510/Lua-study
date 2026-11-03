#!/usr/bin/env lua

local file, err = io.open("sample.txt", "r")

if not file then
	print("Cannot open file. Error: " .. err)
	os.exit(0)
end

local count = 0

-- Can use io.lines(file) for faster scripting
-- But it may end the program if the file doesn't exist
for i in file:lines() do
	print(i)
	count = count + 1
end

print(string.format("Lines: %d", count))
file:close()
