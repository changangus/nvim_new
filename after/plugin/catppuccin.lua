require('catppuccin').setup {
  color_overrides = {
    mocha = {
      lavender = '#9ca8f7',
      green = '#93c993',
    }
  },
  highlight_overrides = {
    all = function(colors)
      return {
        ['@tag.tsx'] = { fg = colors.peach },
        -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/treesitter.lua
        ["@tag.attribute.tsx"] = { fg = colors.mauve, style = { "italic" } },
      }
    end
  }
}

vim.cmd.colorscheme 'catppuccin'
