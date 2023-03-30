-- Harpoon
require("harpoon").setup({
  menu = {
    width = 90,
    height = 20,
  }
})
vim.keymap.set('n', '<leader>lv', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>la', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ht', ':Telescope harpoon marks<CR>', { noremap = true })

