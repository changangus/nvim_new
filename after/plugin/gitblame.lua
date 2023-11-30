-- GitBlame
require('gitblame').setup {
  enabled = false,
}
vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>', { noremap = true });
vim.keymap.set('n', '<leader>gO', ':GitBlameOpenCommitURL<CR>', { noremap = true });
vim.keymap.set('n', '<leader>gS', ':GitBlameCopySHA<CR>', { noremap = true });

