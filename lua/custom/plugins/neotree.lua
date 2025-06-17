return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        window = {
          mappings = {
            ['s'] = 'open_split',
            ['S'] = 'open_vsplit',
          },
          width = 30,
        },
        filesystem = {
          filtered_items = {
            visible = true,
          },
          follow_current_file = {
            enabled = true,
          },
        },
      }
    end,
  },

  vim.keymap.set('n', '\\', '<cmd>Neotree left filesystem<cr>', { desc = '[F]ile explorer' }),
}
