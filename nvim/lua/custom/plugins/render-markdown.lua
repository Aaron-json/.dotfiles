return {
  -- Make sure to set this up properly if you have lazy=true
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    file_types = { 'markdown', 'Avante' },
  },
  config = function()
    vim.keymap.set('n', '<leader>tm', '<cmd>RenderMarkdown toggle<CR>')
  end,
  ft = { 'markdown', 'Avante' },
}
