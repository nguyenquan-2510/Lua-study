#!/usr/bin/env lua

local VuKhi = {}
VuKhi.__index = VuKhi

function VuKhi.new(ten, sat_thuong)
	return setmetatable({
		ten = ten,
		sat_thuong = sat_thuong,
	}, VuKhi)
end

local NhanVat = {}
NhanVat.__index = NhanVat

function NhanVat.new(ten, mau, vu_khi)
	return setmetatable({
		ten = ten,
		mau = mau,
		vu_khi = vu_khi,
	}, NhanVat)
end

function NhanVat:tan_cong()
	print(
		string.format(
			"Nhan vat %s co vu khi %s gay %d sat thuong, mau %d",
			self.ten,
			self.vu_khi.ten,
			self.vu_khi.sat_thuong,
			self.mau
		)
	)
end

local ten = io.read()
local ten_vu_khi = io.read()
local sat_thuong = io.read()
local mau = io.read()
sat_thuong = tonumber(sat_thuong)
mau = tonumber(mau)
local weapon = VuKhi.new(ten_vu_khi, sat_thuong)
local player = NhanVat.new(ten, mau, weapon)

print(player:tan_cong())
