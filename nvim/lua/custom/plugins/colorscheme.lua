return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000,

    config = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'

      require('tokyonight').setup {
        style = 'night',
        styles = {
          comments = { italic = true },
        },
        on_colors = function(colors)
          print(colors.fg)
          local background = require('tokyonight.util').darken(colors.bg, 0.62, '#000000')
          colors.bg = background
          colors.bg_sidebar = background
          colors.bg_float = background

          local comment = require('tokyonight.util').lighten(colors.blue0, 0.5, colors.fg)
          colors.comment = comment
        end,
        on_highlights = function(highlights, colors)
          highlights.DiagnosticUnnecessary = {
            -- make the same color as the comment
            fg = colors.comment,
          }
        end,
      }
      -- vim.cmd.colorscheme 'tokyonight'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        theme = 'dragon',
        background = {
          dark = 'wave',
        },
      }
      -- vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    dependencies = { 'folke/tokyonight.nvim' },
    config = function()
      local mocha_pallete = require('catppuccin.palettes').get_palette 'mocha'
      require('catppuccin').setup {
        flavour = 'mocha',
        color_overrides = {
          mocha = {
            base = require('tokyonight.util').darken(mocha_pallete.base, 0.54, '#000000'),
          },
        },
      }
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- require('nordic').load()
    end,
  },
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- require('nord').set()
    end,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local cur_bg = require('cyberdream.colors').default.bg
      require('cyberdream').setup {
        theme = {
          highlights = {},
          colors = {
            fg = '#c0caf5',
            bg = require('tokyonight.util').darken(cur_bg, 0.9),
            -- fg = '#d4dbfc',
            -- fg = '#e0e6ff'
          },
        },
      }
      local colors = require 'cyberdream.colors'
      -- print(colors.default.fg)
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
}
