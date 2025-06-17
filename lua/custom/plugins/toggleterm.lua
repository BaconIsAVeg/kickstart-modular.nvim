return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    opts = {
      size = 15,
      float_opts = {
        border = 'curved',
        width = 120,
        height = 25,
        title_pos = 'left',
      },
    },
  },

  vim.keymap.set('n', '<A-i>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Toggle a split terminal' }),
}
