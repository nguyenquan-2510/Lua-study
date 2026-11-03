#!/usr/bin/env lua

local Car = {}
Car.__index = Car

function Car:new(hang, model, nam)
	local obj = {
		hang = hang or nil,
		model = model or nil,
		nam = nam or nil,
	}
	setmetatable(obj, self)
	return obj
end

function Car:__tostring()
	return string.format("%s %s %d", self.hang, self.model, self.nam)
end

setmetatable(Car, {
	__call = function(obj, ...)
		return obj:new(...)
	end,
})

local hang = io.read("*l")
local model = io.read("*l")
local nam = io.read("*n")
local car = Car(hang, model, nam)
print(car)
