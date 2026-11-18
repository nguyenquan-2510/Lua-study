---@diagnostic disable:unused-local, empty-block

local date = {}

--- This function is used to parse date with ISO format yyyy-mm-dd
---@param str_date string
---@return table table_date  The date returned
---@return string message # Message
---@return boolean success # If the function runs correctly
function date.parseISOdate(str_date)
	---@type {d:string, m:string, y:string} Haizzzz
	local table_date = {}
	table_date.y, table_date.m, table_date.d = string.match(str_date, "^(%d%d%d%d)-(%d%d)-(%d%d)$")
	if not table_date.y then
		table_date = { d = "-1", m = "-1", y = "-1" }
		return table_date, "Maybe input error. Date must be yyyy-mm-dd.", false
	end
	return table_date, "Ok nothing here hahah!", true
end

--- This function is used to parse date with European format dd/mm/yyyy
---@param str_date string
---@return table table_date The date returned
---@return string msg Message error check?
---@return boolean success
function date.parseEuropean(str_date)
	---@type {d:string, m:string, y:string} Haizzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
	local table_date = {}
	table_date.d, table_date.m, table_date.y = string.match(str_date, "^(%d%d)/(%d%d)/(%d%d%d%d)$")
	if not table_date.d then
		table_date = { d = "-1", m = "-1", y = "-1" }
	end
	local msg = table_date.d and "Ok no error found" or "Maybe input error. Date must be dd/mm/yyyy"
	local success = table_date.d and true or false
	return table_date, msg, success
end

---@type fun(t_date:table):boolean
function date.isValid(t_date)
	local days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
	if date.isLeapYear(t_date.y) then
		days[2] = 29
	end
	local d, m, y = tonumber(t_date.d), tonumber(t_date.m), tonumber(t_date.y)
	if m > 12 or m < 1 then
		return false
	end

	if d > days[m] or d < 1 then
		return false
	end
	return true
end

---@type fun(year:string):boolean
function date.isLeapYear(year)
	local y = tonumber(year)
	return (y % 4 == 0 and y % 100 ~= 0) or (y % 400 == 0)
end

---@type fun(type:"european"|"iso", t_date:table):string
function date.format(type, t_date)
	local d, m, y = tonumber(t_date.d), tonumber(t_date.m), tonumber(t_date.y)
	if not date.isValid(t_date) then
		return "Invalid date! Pls try again."
	end
	if type == "european" then
		return string.format("%02d/%02d/%4d", d, m, y)
	elseif type == "iso" then
		return string.format("%4d-%02d-%02d", y, m, d)
	else
		return "Invalid date conversion. Try again"
	end
end

---@param d number Day value
---@param m number Month value
---@param y number Year value
---@return table
function date.createDataSet(d, m, y)
	return { d = d, m = m, y = y }
end

return date
