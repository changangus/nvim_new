local g = vim.g
local map = vim.keymap.set

g.mapleader = " "

-- Custom
map("n", "<leader>pv", vim.cmd.Ex)
map("x", "<leader>y", '"+y', { noremap = true })
map('n', '<leader><CR>', ':luafile ~/.config/nvim/init.lua<CR>', { noremap = true })
map('n', '<leader>s', ':wq<CR>', { noremap = true })
map('n', '<leader>e', ':q<CR>', { noremap = true })
map('n', '<leader>w', ':wa<CR>', { noremap = true })
map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })
map('n', '<leader>nh', ':noh<CR>', { noremap = true })
map('x', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>rp', ':let @+ = expand("%")<CR>', { noremap = true })
-- Move lines up and down
map('n', '<S-d>', ':.move +1<CR>')
map('n', '<S-u>', ':.move -2<CR>')
map('v', '<S-d>', ":'<,'>move '>+1 | normal! gv<CR>")
map('v', '<S-u>', ":'<,'>move '<-2 | normal! gv<CR>")
-- Split screen 50% vertically 
map('n', '<leader>v', ':vsplit<CR>:resize 50<CR>', { noremap = true })
-- Split screen 10% horizontally
map('n', '<leader>vh', ':split<CR>:resize 10<CR>', { noremap = true })
-- resize windows 
map('n', '<F4>', ':vertical resize -5<CR>', { noremap = true })
map('n', '<F5>', ':vertical resize +5<CR>', { noremap = true })
map('n', '<F6>', ':resize -5<CR>', { noremap = true })
map('n', '<F7>', ':resize +5<CR>', { noremap = true })
-- exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
