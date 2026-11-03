#!/usr/bin/env lua

local Product = {}
Product.__index = Product

function Product:new(name, price)
	return setmetatable({
		name = name,
		price = price,
	}, self)
end

local Order = {}
Order.__index = Order

function Order:new(product, quantity)
	local order = {
		product = product,
		quantity = quantity,
	}
	setmetatable(order, self)
	return order
end

function Order:get_total()
	print(string.format("Tong tien: %d", (self.product.price * self.quantity)))
end

local name = io.read()
local price = io.read()
local quantity = io.read("*n")

local product = Product:new(name, price)
local order = Order:new(product, quantity)
order:get_total()
