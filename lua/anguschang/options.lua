-- Global
vim.g.mapleader = " "
vim.g.user_emmet_leader_key = ','
vim.g.gitblame_enabled = 0
vim.g.NERDTreeShowHidden = 1
vim.g.markdown_fenced_languages = {'javascript=javascriptreact', 'typescript=typescript', 'tsx=typescriptreact', 'ts=typescriptreact'  }

-- Options:
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.filetype = "on"
vim.opt.filetype = "indent"
vim.opt.filetype = "plugin"
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wrap = true
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes"
vim.wo.cursorline = true


-- Set up fillchars for fold characters
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local fcs = vim.opt.fillchars:get()

local function get_fold(lnum)
	if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return ' ' end
	return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
end

_G.get_statuscol = function()
	return get_fold(vim.v.lnum) .. "%s%l "
end

-- Custom fold text function to remove fold numbers
function _G.custom_foldtext()
  local line = vim.fn.getline(vim.v.foldstart)
  return line .. ' ...'
end

vim.o.statuscolumn = "%!v:lua.get_statuscol()"

vim.o.foldtext = 'v:lua.custom_foldtext()'

-- Enable folding
vim.o.foldmethod = 'syntax'
vim.o.foldlevelstart = 99
vim.o.foldminlines = 1

-- Set the fold column width
vim.o.foldcolumn = 'auto:1'

vim.wo.foldcolumn = '1'

-- Use Treesitter for better folding if available
if pcall(require, 'nvim-treesitter.configs') then
  vim.o.foldmethod = 'expr'
  vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
end

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
