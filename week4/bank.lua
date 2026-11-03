#!/usr/bin/env lua

local BankAccount = {}
BankAccount.__index = BankAccount

function BankAccount:new(balance)
	local acc = {
		balance = balance or 0,
	}
	setmetatable(acc, self)
	return acc
end

function BankAccount:deposit(amount)
	self.balance = self.balance + amount
end

function BankAccount:withdraw(amount)
	self.balance = self.balance - amount
end

local tien, gui, rut = io.read("*n", "*n", "*n")
local a = BankAccount:new(tien)

a:deposit(gui)
a:withdraw(rut)
print(a.balance)
