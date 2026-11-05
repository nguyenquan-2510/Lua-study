#!/usr/bin/env lua

-- A utility used for copying single file written in Lua

-- Haven't got the documentation or dealing with flags yet.
-- You must know

local source, destination = arg[1], arg[2]

if not source then
	print("Luacp: No source file provided.")
	os.exit(1)
end

if not destination then
	print("Luacp: No destination file provided.")
	os.exit(1)
end

local function copy(src, dest)
	local F_src, src_err = io.open(src, "rb")

	if not F_src then
		print("Luacp: Cannot open source file. Err: " .. src_err)
		return false
	end

	local F_dest, dest_err = io.open(dest, "wb")

	if not F_dest then
		print("Luacp: Cannot open destination file. Err: " .. dest_err)
		F_src:close()
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
	print("Luacp: Successfully copied " .. src .. " to " .. dest .. ".")
	return true
end

copy(source, destination)
