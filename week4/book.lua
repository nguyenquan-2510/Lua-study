#!/usr/bin/env lua

local Sach = {}
Sach.__index = Sach

function Sach:new(tuaSach, tacGia, soTrang)
	return setmetatable({
		tuaSach = tuaSach,
		tacGia = tacGia,
		soTrang = soTrang,
	}, self)
end

local SachGiaoKhoa = setmetatable({}, Sach)
SachGiaoKhoa.__index = SachGiaoKhoa

function SachGiaoKhoa:new(tuaSach, tacGia, soTrang, monHoc)
	local obj = Sach.new(self, tuaSach, tacGia, soTrang)
	obj.monHoc = monHoc
	return obj
end

function SachGiaoKhoa:hienThi()
	print(
		string.format("Sach giao khoa: %s - %s - %d trang - %s", self.tuaSach, self.tacGia, self.soTrang, self.monHoc)
	)
end

local TieuThuyet = setmetatable({}, Sach)
TieuThuyet.__index = TieuThuyet

function TieuThuyet:new(tuaSach, tacGia, soTrang, theLoai)
	local obj = Sach.new(self, tuaSach, tacGia, soTrang)
	obj.theLoai = theLoai
	return obj
end

function TieuThuyet:hienThi()
	print(string.format("Tieu thuyet: %s - %s - %d trang - %s", self.tuaSach, self.tacGia, self.soTrang, self.theLoai))
end

local n = io.read()
n = tonumber(n)

local data = {}

for i = 1, n do
	local type, name, author, pages, extra = io.read():match("(%S+) (%S+) (%S+) (%S+) (%S+)")
	type = tonumber(type)
	pages = tonumber(pages)
	local tab = { type, name, author, pages, extra }
	table.insert(data, tab)
end

for _, v in ipairs(data) do
	if v[1] == 1 then
		local book = SachGiaoKhoa:new(v[2], v[3], v[4], v[5])
		book:hienThi()
	elseif v[1] == 2 then
		local book2 = TieuThuyet:new(v[2], v[3], v[4], v[5])
		book2:hienThi()
	end
end
