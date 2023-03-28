require("telescope").setup({
  defaults = {
    initial_mode = "normal",
    path_display = { "truncate" },
    layout_config = {
      preview_cutoff = 0,
      preview_width = 0.6,
    },
  },
  extensions = {
    coc = {
      theme = "ivy",
    },
    harpoon = {
      theme = "ivy",
    },
  }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>a', function() builtin.diagnostics({ bufnr = 0 }) end)
vim.keymap.set('n', 'gr', function() builtin.lsp_references() end)
vim.keymap.set('n', 'gd', function() builtin.lsp_definitions() end)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fe', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

