vim.api.nvim_set_keymap('n', '<S-t>', ':ToggleTerm direction=float<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<S-t>', '<C-\\><C-n>:ToggleTerm direction=float<CR>', {noremap = true, silent = true})
