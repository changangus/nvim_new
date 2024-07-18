require('catppuccin').setup {
  color_overrides = {
    mocha = {
      lavender = '#9ca8f7',
      green = '#96d4a3',
      yellow = '#e6d0a1',
      mauve = '#b393d9',
      peach = '#e0a97b'
    }
  },
  highlight_overrides = {
    all = function(colors)
      return {
        ['@tag.tsx'] = { fg = colors.peach },
        ['@tag.jsx'] = { fg = colors.peach },
        -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/treesitter.lua
        ["@tag.attribute.tsx"] = { fg = colors.mauve },
        ["@tag.attribute.jsx"] = { fg = colors.mauve },
        ['@tag.builtin'] = { fg = colors.blue },
      }
    end
  }
}

vim.cmd.colorscheme 'catppuccin'
