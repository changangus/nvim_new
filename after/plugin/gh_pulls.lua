local gh_plugin = require('github_pulls')

gh_plugin.setup({
  username = "changangus"
})()

vim.keymap.set("n", "<leader>gp", ":lua require('github_pulls.ui').toggle_pr_menu()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gr", ":lua require('github_pulls.ui').toggle_reviews_menu(true)<CR>", { noremap = true, silent = true })
