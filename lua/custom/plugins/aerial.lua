return {
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        layout = {
          default_direction = 'prefer_right',
          min_width = { 20, 0.2 },
          resize_to_content = false,
        },
        close_automatic_events = { 'unfocus', 'unsupported' },
        autojump = true,
      }
    end,
  },
  vim.keymap.set('n', '|', '<cmd>AerialOpen<cr>', { desc = '[S]ymbol explorer' }),
}
