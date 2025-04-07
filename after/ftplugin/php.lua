-- PHP-specific indentation settings
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Disable treesitter indent for PHP
vim.cmd("TSBufDisable indent")