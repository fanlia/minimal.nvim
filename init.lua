
url_format = 'git@github.com:%s.git'
-- install plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    string.format(url_format, 'folke/lazy.nvim'),
    '--branch=stable',                          -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- options
vim.g.mapleader = ' '                           -- make sure to set `mapleader` before lazy so your mappings are correct
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.number = true                           -- line number
vim.opt.relativenumber = true                   -- relative line number
vim.opt.cursorline = true                       -- highlight current line
vim.opt.undofile = true                         -- undo file
vim.opt.undolevels = 100                        -- undo file levels
vim.opt.list = true                             -- show strange char

-- minimal plguins
local plugins = {
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-tree/nvim-tree.lua',
  'numToStr/Comment.nvim',
  'folke/tokyonight.nvim',
  'windwp/nvim-autopairs',
  'lukas-reineke/indent-blankline.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'stevearc/conform.nvim',
}

-- try to load myplugins
local status_ok, myplugins = pcall(require, 'myplugins')
if status_ok then
  vim.list_extend(plugins, myplugins)
end

-- install plugins
require('lazy').setup(plugins, {
  git = { url_format = url_format },
})

-- folke/tokyonight.nvim
vim.cmd[[colorscheme tokyonight]]

-- nvim-tree/nvim-tree.lua
require('nvim-tree').setup({
  view = { side = 'right' },
  git = { ignore = false },
})
vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', {})

-- nvim-telescope/telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- numToStr/Comment.nvim
require('Comment').setup()

-- windwp/nvim-autopairs
require('nvim-autopairs').setup()

-- lukas-reineke/indent-blankline.nvim
require('ibl').setup()

-- 'williamboman/mason.nvim',
-- 'williamboman/mason-lspconfig.nvim',
-- 'neovim/nvim-lspconfig',
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'pyright',
    'tsserver',
  },
})
local lspconfig = require('lspconfig')
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

-- nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = {'typescript', 'javascript', 'python'},
  highlight = {
    enable = true,
  },
})

-- 'stevearc/conform.nvim',
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    typescript = { "prettier" },
  },
})
vim.keymap.set('n', '<leader>cf', function()
  require("conform").format({ async = true, lsp_fallback = true })
end, {})
