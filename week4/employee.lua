#!/usr/bin/env lua

local NhanVien = {}
NhanVien.__index = NhanVien

function NhanVien:new(so_gio, luong_moi_gio)
	return setmetatable({
		so_gio = so_gio,
		luong_moi_gio = luong_moi_gio,
	}, self)
end

function NhanVien:tinh_luong_theo_gio()
	return self.luong_moi_gio
end

function NhanVien:tinh_luong_theo_thang()
	return self.luong_moi_gio * self.so_gio
end

local gio, luong = io.read("*n", "*n")
local nhanvien = NhanVien:new(gio, luong)

print("Luong theo gio: " .. tostring(nhanvien:tinh_luong_theo_gio()))
print("Luong theo thang: " .. tostring(nhanvien:tinh_luong_theo_thang()))
