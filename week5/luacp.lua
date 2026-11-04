#!/usr/bin/env lua

local source, destination = arg[1], arg[2]

if not source then
	print("No source file provided!")
	os.exit(1)
end

if not destination then
	print("No destination file provided!")
	os.exit(1)
end

local function copy(src, dest)
	local F_src, src_err = io.open(src, "rb")

	if not F_src then
		print("Cannot open source file. Err: " .. src_err)
		return false
	end

	local F_dest, dest_err = io.open(dest, "wb")

	if not F_dest then
		print("Cannot open destination file. Err: " .. dest_err)
		return false
	end

	while true do
		local chunk = F_src:read(4096)
		if not chunk then
			break
		end
		F_dest:write(chunk)
		F_dest:flush()
	end

	F_src:close()
	F_dest:close()
	return true
end

copy(source, destination)
