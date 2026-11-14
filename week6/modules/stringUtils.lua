local Str = {}

---@param s string
---@return string
function Str.reverse(s)
	local rev = {}
	for i = #s, 1, -1 do
		table.insert(rev, string.sub(s, i, i))
	end
	local rev_s = table.concat(rev)
	return rev_s
end

---@param string string
---@param substring string
---@return number
function Str.find(string, substring)
	local start_id = string.find(string, substring, 1, true)
	if not start_id then
		return 0
	end
	return start_id
end

---@param string string
---@param substring string
---@return boolean
function Str.contain(string, substring)
	return Str.find(string, substring) ~= nil
end

---@param str string
---@return string
function Str.ProcessEscapePattern(str)
	local escaped_string = string.gsub(str, "([%.%(%)%%%+%-%*%?%[%]%^%$])", "%%%1")
	return escaped_string
end

---@param org_str string
---@param pattern string
---@param replace string
---@return string
function Str.replace(org_str, pattern, replace)
	local safe_replace = string.gsub(replace, "%%", "%%%%")
	local safe_pattern = Str.ProcessEscapePattern(pattern)
	return (string.gsub(org_str, safe_pattern, safe_replace))
end

---@param s string
---@param seperator string?
---@return table
function Str.split(s, seperator)
	local sep = seperator or " "
	local split_string = {}
	for i in string.gmatch(s, "([^" .. sep .. "]+)") do
		table.insert(split_string, i)
	end
	return split_string
end

---@param s string
---@return string
function Str.trim(s)
	local result = string.gsub(s, "^%s*(.-)%s*$", "%1")
	return result
end

return Str
