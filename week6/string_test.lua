#!/usr/bin/env lua

local stringUtils = require("modules.stringUtils")

local str = io.read()

-- Reverse the string
-- print(stringUtils.reverse(str))

-- Find text pattern
-- local pattern = io.read()
-- print(stringUtils.find(str, pattern))
-- print(stringUtils.contain(str, pattern))

-- Replace with another pattern (pure text)
-- local replace = io.read()
-- print((stringUtils.replace(str, pattern, replace)))

-- Split string
-- local split = stringUtils.split(str, ",")
-- for _, v in ipairs(split) do
-- 	print(string.format("[%s]", v))
-- end

-- Removing whitespaces
print(string.format("[%s]", str))
print(string.format("[%s]", stringUtils.trim(str)))
