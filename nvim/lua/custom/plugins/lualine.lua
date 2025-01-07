return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local filename = { 'filename', path = 3 }
    require('lualine').setup {
      options = {
        theme = 'auto',
        component_separators = '',
        section_separators = '',
      },
      sections = {
        lualine_a = { { 'mode', right_padding = 2 } },
        lualine_b = { 'diff', 'branch' },
        lualine_c = {
          '%=',
          filename,
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'filesize', 'progress' },
        lualine_z = {
          { 'location', left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { filename },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
