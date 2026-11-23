---@diagnostic disable:empty-block
local m = {}

function m.validate_email(email)
	return string.match(email, "^([%w_%.%+%-]+@[%w_%.%+%-]+%.%a%a+)$") ~= nil
end

local MIN_PASSWD_LEN = 8

function m.validate_password(passwd)
	return #passwd >= MIN_PASSWD_LEN and string.match(passwd, "%d") ~= nil
end

function m.validate(email, passwd)
	if m.validate_email(email) and not m.validate_password(passwd) then
		print("Mat khau khong hop le")
		return
	end
	if not m.validate_email(email) and m.validate_password(passwd) then
		print("Email khong hop le")
		return
	end
	print("Xac thuc thanh cong")
end

return m
