-- LuaLine
require('lualine').setup {
  options = { theme = 'catppuccin' },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {{ 'filename', path = 1 }},
    lualine_y = {},
    lualine_z = {},
  }
}

