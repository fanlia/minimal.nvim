function get_url_format()
  local handle = io.popen('git remote get-url origin')
  local result = handle:read('*a')
  handle:close()
  if string.find(result, 'git') == 1 then
    return 'git@github.com:%s.git'
  else
    return 'https://github.com/%s.git'
  end
end

local url_format = get_url_format()

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = string.format(url_format, 'folke/lazy.nvim')
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- options
vim.g.mapleader = ' ' -- make sure to set `mapleader` before lazy so your mappings are correct
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line number
vim.opt.cursorline = true -- highlight current line
vim.opt.undofile = true -- undo file
vim.opt.undolevels = 100 -- undo file levels
vim.opt.list = true -- show strange char
vim.opt.foldmethod = 'indent' -- foldmethod
vim.opt.foldenable = false -- nofold at startup

-- minimal plguins
local plugins = {
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-tree/nvim-tree.lua',
  'folke/tokyonight.nvim',
  'windwp/nvim-autopairs',
  'lukas-reineke/indent-blankline.nvim',
  'stevearc/conform.nvim',
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '*',
  },
  {
    'olimorris/codecompanion.nvim',
    config = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
  },
  { 'echasnovski/mini.diff', version = '*' },
  'neovim/nvim-lspconfig',
}

-- try to load myplugins
local status_ok, myplugins = pcall(require, 'myplugins')
if status_ok then
  vim.list_extend(plugins, myplugins)
end

-- Setup lazy.nvim
require('lazy').setup({
  spec = plugins,
  git = { url_format = url_format },
})

-- folke/tokyonight.nvim
vim.cmd([[colorscheme tokyonight]])

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

-- windwp/nvim-autopairs
require('nvim-autopairs').setup()

-- lukas-reineke/indent-blankline.nvim
require('ibl').setup()

-- stevearc/conform.nvim
require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    rust = { 'rustfmt' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    vue = { 'prettier' },
    json = { 'prettier' },
    markdown = { 'prettier' },
    yaml = { 'prettier' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters = {
    stylua = {
      prepend_args = { '--indent-type', 'Spaces', '--indent-width', 2, '--quote-style', 'AutoPreferSingle' },
    },
    prettier = {
      prepend_args = { '--no-semi', '--single-quote' },
    },
  },
})

-- saghen/blink.cmp
require('blink.cmp').setup({
  keymap = { preset = 'super-tab' },
})

-- olimorris/codecompanion.nvim
require('codecompanion').setup({
  display = {
    diff = {
      provider = 'mini_diff',
    },
  },
  adapters = {
    ollama = function()
      return require('codecompanion.adapters').extend('ollama', {
        schema = {
          model = {
            default = 'qwen2.5-coder:latest',
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = 'ollama',
    },
    inline = {
      adapter = 'ollama',
    },
  },
})
vim.keymap.set('n', '<leader>ii', ':CodeCompanionChat Toggle<CR>', {})
vim.keymap.set('n', '<leader>ij', ':CodeCompanion #buffer ', {})

-- nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'javascript', 'typescript', 'tsx', 'python', 'lua', 'rust', 'graphql' },
  highlight = {
    enable = true,
  },
})

-- echasnovski/mini.diff
require('mini.diff').setup()

-- neovim/nvim-lspconfig
require('lspconfig').ts_ls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').tailwindcss.setup({})
