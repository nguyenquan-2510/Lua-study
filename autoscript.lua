#!/usr/bin/env lua
---@diagnostic disable:unused-local

local msg = arg[1]

if not msg then
	print("autoscript.lua: [WARNING] No message specified.")
	msg = "/// Commit message added by autoscript.lua [" .. os.date("%Y-%m-%d") .. "] ///"
end

print("[INFO] Commit with message: " .. msg .. ".")

local commands = {
	"git status",
	"git add .",
	"git status",
	'git commit -m "' .. msg .. '"',
	"git push origin main",
}

for _, cmd in ipairs(commands) do
	print("[INFO] Executing: " .. cmd .. ".")
	local suc = os.execute(cmd)
	if not suc then
		print("[ERROR] Failed to execute: " .. cmd .. ".")
		print("[ERROR] End the script early.")
		os.exit(1)
	end
	print("[INFO] Done: " .. cmd .. ".")
end

print("[INFO] OK!")
