#!/usr/bin/env lua

local n = io.read("*n")

local function prime_check(n)
	if n < 2 then
		return false
	elseif n == 2 then
		return true
	end

	for i = 2, math.floor(math.sqrt(n)) do
		if n % i == 0 then
			return false
		end
	end
	return true
end

if prime_check(n) then
	print("YES")
else
	print("NO")
end
