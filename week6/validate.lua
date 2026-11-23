#!/usr/bin/env lua

local val = require("modules.validate")

local email = io.read()
local passwd = io.read()
val.validate(email, passwd)
