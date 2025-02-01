local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '.', api.tree.change_root_to_node, opts 'CD')
  vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts 'Parent Folder')
  vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
end

-- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({ 'BufEnter', 'QuitPre' }, {
  nested = false,
  callback = function(e)
    local tree = require('nvim-tree.api').tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _, winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == 'QuitPre' and winCount == 2 then
      vim.api.nvim_cmd({ cmd = 'qall' }, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == 'BufEnter' and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle { find_file = true, focus = true }
        -- re-open nivm-tree
        tree.toggle { find_file = true, focus = false }
      end, 10)
    end
  end,
})

return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        on_attach = my_on_attach,
      }
    end,
  },
  vim.keymap.set('n', '\\', '<cmd>NvimTreeOpen<cr>', { desc = '[F]ile explorer' }),
}

-- return {
--   {
--     'nvim-neo-tree/neo-tree.nvim',
--     branch = 'v3.x',
--     dependencies = {
--       'nvim-lua/plenary.nvim',
--       'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
--       'MunifTanjim/nui.nvim',
--     },
--     config = function()
--       require('neo-tree').setup {
--         close_if_last_window = true,
--         window = {
--           mappings = {
--             ['s'] = 'open_split',
--             ['S'] = 'open_vsplit',
--           },
--           width = 40,
--         },
--         filesystem = {
--           filtered_items = {
--             visible = true,
--           },
--           follow_current_file = {
--             enabled = true,
--           },
--         },
--       }
--     end,
--   },
--
--   vim.keymap.set('n', '\\', '<cmd>Neotree left filesystem<cr>', { desc = '[F]ile explorer' }),
-- }
