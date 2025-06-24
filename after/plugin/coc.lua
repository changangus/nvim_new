-- General vim settings (moved from coc config)
-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false
-- Vim Command Remaps:
vim.keymap.set('n', '<leader><CR>', ':luafile ~/.config/nvim/init.lua<CR>', { noremap = true })
vim.keymap.set('n', '<leader>s', ':wq<CR>', { noremap = true })
vim.keymap.set('n', '<leader>e', ':q<CR>', { noremap = true })
vim.keymap.set('n', '<leader>w', ':wa<CR>', { noremap = true })
vim.keymap.set('n', '<c-h>', '<c-w>h', { noremap = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { noremap = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { noremap = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { noremap = true })
vim.keymap.set('n', '<leader>nh', ':noh<CR>', { noremap = true })
vim.keymap.set('x', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>rp', ':let @+ = expand("%")<CR>', { noremap = true })
-- Move lines up and down
vim.keymap.set('n', '<S-j>', ':.move +1<CR>')
vim.keymap.set('n', '<S-k>', ':.move -2<CR>')
vim.keymap.set('v', '<S-j>', ":'<,'>move '>+1 | normal! gv<CR>")
vim.keymap.set('v', '<S-k>', ":'<,'>move '<-2 | normal! gv<CR>")
-- Split screen 50% vertically 
vim.keymap.set('n', '<leader>v', ':vsplit<CR>:resize 50<CR>', { noremap = true })
-- Split screen 10% horizontally
vim.keymap.set('n', '<leader>vh', ':split<CR>:resize 10<CR>', { noremap = true })
-- resize windows 
vim.keymap.set('n', '<F4>', ':vertical resize -5<CR>', { noremap = true })
vim.keymap.set('n', '<F5>', ':vertical resize +5<CR>', { noremap = true })
vim.keymap.set('n', '<F6>', ':resize -5<CR>', { noremap = true })
vim.keymap.set('n', '<F7>', ':resize +5<CR>', { noremap = true })

