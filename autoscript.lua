#!/usr/bin/env lua

---@diagnostic disable:unused-local
---@diagnostic disable:empty-block

local msg = arg[1]

if not msg then
	print("autoscript.lua: \27[33;1m[WARNING] No message specified.\27[0m")
	msg = "/// [" .. os.date("%Y-%m-%d  %Hh %Mm %Ss") .. "] Commit message added by autoscript.lua ///"
end

print("\27[32;1m[INFO] Commit with message: \27[0m\27[3m" .. msg .. ".\27[0m")

print("Proceed ? (Y/n)")
local opt = io.read()
if string.lower(opt) == "n" then
	print("\27[32;1m[INFO] Aborted. Exiting the script\27[0m")
elseif string.lower(opt) == "y" or opt == "" then
	do
		local commands = {
			"git status",
			"git add .",
			"git status",
			'git commit -m "' .. msg .. '"',
			"git push origin main",
		}

		for id, cmd in ipairs(commands) do
			print("\27[32;1m[INFO] Executing: " .. id .. "> " .. cmd .. "\27[0m")
			local suc = os.execute(cmd)
			if suc ~= 0 then
				print("\27[31;1m[ERROR] Failed to execute: " .. cmd .. ".\27[0m")
				print("\27[31;1m[ERROR] End the script early.\27[0m")
				os.exit(1)
			end
			print("\27[32;1m[INFO] Done: " .. cmd .. "\n\27[0m******\n")
		end

		print("\27[32;1m[INFO] OK!\27[0m")
	end
end
