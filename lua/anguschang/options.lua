-- Global
vim.g.mapleader = " "
vim.g.user_emmet_leader_key = ','
vim.g.gitblame_enabled = 0
vim.g.NERDTreeShowHidden = 1
vim.g.markdown_fenced_languages = {'javascript=javascriptreact', 'typescript=typescript', 'tsx=typescriptreact', 'ts=typescriptreact'  }

-- Options:
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.updatetime = 300

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')
vim.cmd('highlight LineNr guibg=NONE ctermbg=NONE')
vim.cmd('highlight CursorLineNr guibg=NONE ctermbg=NONE')
vim.cmd('highlight StatusLine gui=NONE cterm=NONE')
vim.cmd('highlight StatusLineNC gui=NONE cterm=NONE')
vim.cmd('highlight EndOfBuffer guibg=NONE ctermbg=NONE')
vim.cmd('highlight Directory gui=NONE cterm=NONE')
vim.cmd('highlight WinSeparator gui=NONE cterm=NONE')
vim.cmd('highlight CursorLine guibg=#403257')

