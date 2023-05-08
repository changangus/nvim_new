vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm direction=float<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-t>', '<C-\\><C-n>:ToggleTerm direction=float<CR>', {noremap = true, silent = true})
