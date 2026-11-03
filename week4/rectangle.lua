#!/usr/bin/env lua

local rect = {}
rect.__index = rect

function rect:new(w, h)
	local obj = {
		width = w or 0,
		height = h or 0,
	}
	setmetatable(obj, self)
	return obj
end

function rect:area()
	return self.width * self.height
end

function rect:perimeter()
	return 2 * (self.width + self.height)
end
local w, h = io.read():match("(%d+) (%d+)")
w = tonumber(w)
h = tonumber(h)
local a = rect:new(w, h)

print(string.format("%d %d", a:area(), a:perimeter()))
