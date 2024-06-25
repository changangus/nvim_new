-- Harpoon
require("harpoon").setup({
  menu = {
    width = 90,
    height = 20,
  },
  mark_branch = true
})

vim.keymap.set('n', '<leader>lv', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>la', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ht', ':Telescope harpoon marks<CR>', { noremap = true })

vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "harpoon",
  callback = function()
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
  end
})

