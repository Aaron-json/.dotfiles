-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<Tab>', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    popup_border_style = 'rounded',
    filesystem = {
      window = {
        position = 'float',
        mappings = {
          ['<Tab>'] = 'close_window',
        },
      },
      filtered_items = {
        visible = true,
      },
      hijack_netrw_behavior = 'disabled',
      use_libuv_file_watcher = true,
      show_untracked = true,
    },
  },
}
