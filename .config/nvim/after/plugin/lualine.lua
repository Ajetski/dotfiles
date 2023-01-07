require('lualine').setup {
  options = {
    theme = 'modus-vivendi', -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      -- { 'mode', separator = { left = '' }, right_padding = 2 },
      'mode'
    },
    lualine_b = {{ 'filename', path = 1 }, 'branch', 'diff', 'diagnostics' },
    lualine_c = {'searchcount'},
    lualine_x = {},
    lualine_y = {'fileformat', { 'filetype', colored = true, icon_only = true, padding = { left = 1, right = 2 }}},
    lualine_z = {
      -- { 'location', separator = { right = '' }, left_padding = 2 },
      'progress'
    },
  },
  inactive_sections = {
    lualine_a = { {'filename', path = 1} },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'progress'},
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'},
  },
  winbar = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'quickfix'},
}
