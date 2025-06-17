return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers', -- get the correct treesitter norg parser
    lazy = false,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
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
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 3
    end,
  },

  vim.keymap.set('n', '<localleader>\\', '<cmd>Neorg index<cr>', { desc = '[I]ndex' }),
}
