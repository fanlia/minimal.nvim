vim.loader.enable()

function get_url_format()
  return 'git@github.com:%s.git'
end

local url_format = get_url_format()

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

vim.g.mapleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 3
vim.g.netrw_sort_by = 'name'
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25
vim.g.netrw_confirm = 0
vim.g.netrw_use_trash = 0

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.clipboard = 'unnamedplus'

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'stevearc/conform.nvim' },
  { 'saghen/blink.cmp', version = '1.*' },
  'neovim/nvim-lspconfig',
}

require('lazy').setup({
  spec = plugins,
  git = { url_format = url_format },
})

vim.cmd([[colorscheme catppuccin]])

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nn', ':Lexplore<CR>', { desc = 'File explorer' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_format' },
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
    graphql = { 'prettier' },
    xml = { 'prettier' },
    php = { 'prettier' },
    go = { 'goimports' },
  },
  format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
  formatters = {
    stylua = {
      prepend_args = { '--indent-type', 'Spaces', '--indent-width', 2, '--quote-style', 'AutoPreferSingle' },
    },
    prettier = {
      command = 'prettier',
      prepend_args = { '--config', vim.fn.expand('~/.config/nvim/prettier.config.js') },
    },
  },
})

require('blink.cmp').setup({
  keymap = { preset = 'super-tab' },
})

vim.lsp.enable({ 'ts_ls', 'pyright', 'tailwindcss', 'zls', 'rust_analyzer', 'gopls', 'clangd' })

vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'References' })
