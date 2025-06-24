local builtin = require('telescope.builtin')

-- Setup telescope with better defaults
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "target/",
      "build/",
      "dist/",
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

-- File operations
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git files' })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Grep search' })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Live grep' })

-- LSP operations via Telescope
-- vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to references' })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Go to implementation' })
vim.keymap.set('n', 'gy', builtin.lsp_type_definitions, { desc = 'Go to type definition' })

-- Additional LSP telescope features
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Document symbols' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'Workspace symbols' })

-- Buffers and help
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Help tags' })

-- Git operations
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })

-- Diagnostics
vim.keymap.set('n', '<leader>dd', builtin.diagnostics, { desc = 'Diagnostics' })
