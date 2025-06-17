return {
  {
    'fcancelinha/nordern.nvim',
    branch = 'master',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'nordern'
    end,
  },
  {
    'ViViDboarder/wombat.nvim',
    dependencies = { { 'rktjmp/lush.nvim' } },
    opts = {
      -- You can optionally specify the name of the ansi colors you wish to use
      -- This defaults to nil and will use the default ansi colors for the theme
      ansi_colors_name = nil,
    },
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.cmd.colorscheme 'wombat'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('vscode').setup {
        transparent = true,
        italic_comments = true,
        underline_links = false,
        disable_nvimtree_bg = true,
        -- vim.cmd.colorscheme 'vscode',
      }
    end,
  },
}
