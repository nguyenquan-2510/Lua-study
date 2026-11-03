#!/usr/bin/env lua

local score_arr = {}

for i = 1, 5 do
	local subj, result = io.read():match("(%S+) (%S+)")
	result = tonumber(result)
	table.insert(score_arr, result)
end

local avg = 0

for i = 1, 5, 1 do
	avg = avg + score_arr[i]
end
print(string.format("Diem trung binh: %.2f", avg / 5))
