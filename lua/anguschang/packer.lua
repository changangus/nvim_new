-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- nvim tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
    'nvim-telescope/telescope.nvim',
    -- or
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }
  -- LSP - COC
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'lervag/vimtex'
  use { 'fannheyward/telescope-coc.nvim' }
  -- Github CoPilot
  use 'github/copilot.vim'
  -- Harpoon
  use 'ThePrimeagen/harpoon'
  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Git Blame
  use 'f-person/git-blame.nvim'
  -- nvim surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  -- Prettier
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use('MunifTanjim/eslint.nvim')
  -- git signs
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  -- autosave
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = false

      }
    end,
  })
  -- autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  -- Comment
  use {
    'numToStr/Comment.nvim',
  }
  use { 'kdheepak/lazygit.nvim' }
  --github pulls
  use "changangus/gh-list.nvim"
  -- toggleterm
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      float_opts = {
        border = "curved",
      }
    })
  end }
  -- Emmet 
  use { 'mattn/emmet-vim' }
  use {
    'Equilibris/nx.nvim',
    requires = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      vim.keymap.set("n", "<leader>nxa", ":Telescope nx actions<CR>", { desc = "NX Actions" })
      vim.keymap.set("n", "<leader>nxr", require("nx").setup, { desc = "NX init/reload" })
    end
  }
  use { 'mg979/vim-visual-multi' }
  use { 'fatih/vim-go' }
  use { 'norcalli/nvim-colorizer.lua' }
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })
end)
