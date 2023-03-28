vim.api.nvim_set_keymap('i','<C-j>', 'copilot#Accept("<CR>")', { expr=true, silent=true })
vim.api.nvim_set_keymap('i','<C-c>', ':Copilot panel', { expr=true, silent=true })
