require('catppuccin').setup({
  color_overrides = {
    mocha = {
      lavender = '#9ca8f7',
      green = '#93c993',
    }
  },
  highlight_overrides = {
    all = function(colors)
      return {
        ['@constructor.tsx'] = { fg = colors.peach },
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/treesitter.lua
      }
    end
  }
})
