#!/usr/bin/env lua

---@diagnostic disable:unused-local
---@diagnostic disable:empty-block

local msg = arg[1]

if not msg then
	print("autoscript.lua: [WARNING] No message specified.")
	msg = "/// [" .. os.date("%Y-%m-%d  %Hh %Mm %Ss") .. "] Commit message added by autoscript.lua ///"
end

print("[INFO] Commit with message: " .. msg .. ".")

print("Proceed ? (Y/n)")
local opt = io.read()
if string.lower(opt) == "n" then
	print("[INFO] Aborted. Exiting the script")
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
			print("[INFO] Executing: " .. id .. "> " .. cmd .. ".")
			local suc = os.execute(cmd)
			if not suc then
				print("[ERROR] Failed to execute: " .. cmd .. ".")
				print("[ERROR] End the script early.")
				os.exit(1)
			end
			print("[INFO] Done: " .. cmd .. ".\n******")
		end

		print("[INFO] OK!")
	end
end
