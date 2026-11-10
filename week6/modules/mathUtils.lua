local M = {}

---@param base integer
---@param exp integer
---@return number
function M.pow(base, exp)
	local result = 1

	if exp == 0 then
		return 1
	end

	for _ = 1, math.abs(exp) do
		result = result * base
	end

	result = exp > 0 and result or 1 / result
	return result
end

---@param n integer
---@return number
function M.sqrt(n)
	return math.sqrt(n)
end

return M
