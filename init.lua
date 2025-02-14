-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

require('lspconfig').intelephense.setup {
  settings = {
    intelephense = {
      stubs = {
        'bcmath',
        'bz2',
        'Core',
        'curl',
        'date',
        'dom',
        'fileinfo',
        'filter',
        'gd',
        'gettext',
        'hash',
        'iconv',
        'imap',
        'intl',
        'json',
        'libxml',
        'mbstring',
        'mcrypt',
        'mysql',
        'mysqli',
        'password',
        'pcntl',
        'pcre',
        'PDO',
        'pdo_mysql',
        'Phar',
        'rdkafka',
        'readline',
        'regex',
        'session',
        'SimpleXML',
        'sockets',
        'sodium',
        'standard',
        'superglobals',
        'tokenizer',
        'xml',
        'xdebug',
        'xmlreader',
        'xmlwriter',
        'yaml',
        'zip',
        'zlib',
      },
      environment = {
        -- includePaths = { '', '' },
      },
      files = {
        maxSize = 2000000,
      },
    },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
