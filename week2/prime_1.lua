#!/usr/bin/env lua

local n = io.read("*n")

if n < 2 then
	print("NO")
	os.exit()
end
if n == 2 then
	print("YES")

	os.exit()
end

if n > 2 then
	for i = 2, math.floor(math.sqrt(n)) do
		if n % i == 0 then
			print("NO")
			os.exit()
		end
	end
end

print("YES")
