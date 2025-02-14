return {
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }
    end,
  },

  vim.keymap.set('n', '<localleader>\\', '<cmd>Neorg index<cr>', { desc = '[I]ndex' }),
}
