local g = vim.g
local map = vim.keymap.set

g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)
