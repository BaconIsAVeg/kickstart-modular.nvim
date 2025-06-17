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
          min_width = { 30, 0.2 },
          max_width = { 40, 0.8 },
          resize_to_content = false,
        },
        attach_mode = 'window',
        close_automatic_events = { 'switch_buffer', 'unfocus', 'unsupported' },
        autojump = true,
      }
    end,
  },
  vim.keymap.set('n', '|', '<cmd>AerialToggle right<cr>', { desc = '[S]ymbol explorer' }),
}
