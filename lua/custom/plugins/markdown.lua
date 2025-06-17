local cmp = require 'cmp'
cmp.setup {
  sources = cmp.config.sources {
    { name = 'render-markdown' },
  },
}

return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
