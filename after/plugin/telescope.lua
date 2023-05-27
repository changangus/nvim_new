require("telescope").setup({
  defaults = {
    initial_mode = "normal",
    path_display = { "truncate" },
    layout_config = {
      preview_cutoff = 0,
      preview_width = 0.6,
    },
  },
})

local builtin = require('telescope.builtin')
vim.cmd('highlight TelescopeNormal guibg=bg')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fe', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', '<leader>km', builtin.keymaps, {})
vim.keymap.set('n', '<leader>a', ':Telescope coc diagnostics<CR>', {})
vim.keymap.set('n', 'gd', ':Telescope coc definitions<CR>', {})
vim.keymap.set('n', 'gr', ':Telescope coc references<CR>', {})
