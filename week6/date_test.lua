#!/usr/bin/env lua

---@diagnostic disable:empty-block

local dateUtils = require("modules.dateUtils")

local inp = io.read()
local data = dateUtils.parseEuropean(inp)
print(dateUtils.format("iso", data))
