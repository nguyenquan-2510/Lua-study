#!/usr/bin/env lua

local mutils = require("modules.mathUtils")

local base = io.read("*n")
local exp = io.read("*n")
local c = io.read("*n")
print(string.format("%.2f", mutils.pow(base, exp)))
print(string.format("%.2f", mutils.sqrt(c)))
