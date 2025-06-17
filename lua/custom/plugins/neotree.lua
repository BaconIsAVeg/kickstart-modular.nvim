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
        event_handlers = {
          {
            event = 'file_open_requested',
            handler = function()
              require('neo-tree.command').execute { action = 'close' }
            end,
          },
        },
        close_if_last_window = true,
        window = {
          mappings = {
            ['s'] = 'open_split',
            ['S'] = 'open_vsplit',
            ['\\'] = 'close_window',
          },
          width = 30,
        },
        filesystem = {
          hijack_netrw_behavior = 'open_current',
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

  vim.keymap.set('n', '\\', '<cmd>Neotree position=current reveal_force_cwd<cr>', { desc = 'Netrw explorer' }),
  vim.keymap.set('n', '<leader>tf', '<cmd>Neotree current position=left<cr>', { desc = 'Toggle [F]iletree' }),
}
