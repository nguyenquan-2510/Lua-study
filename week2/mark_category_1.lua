#!/usr/bin/env lua

local i = io.read("*n")

if i >= 90 then
	print("A")
elseif i >= 80 then
	print("B")
elseif i >= 70 then
	print("C")
elseif i >= 60 then
	print("D")
else
	print("F")
end
