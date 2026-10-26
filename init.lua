-- 尽量少写配置：只保留与 nvim 默认值不同、且确实需要的项。
local url_format = 'git@github.com:%s.git'

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local repo = string.format(url_format, 'folke/lazy.nvim')
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({ { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' }, { out, 'WarningMsg' } }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 250 -- 默认 4000，诊断/hover/gitsigns 太慢

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

local prettier_fts = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  'vue',
  'css',
  'html',
  'json',
  'yaml',
  'markdown',
  'graphql',
}
local formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'ruff_format' },
  rust = { 'rustfmt' },
  go = { 'goimports' },
}
for _, ft in ipairs(prettier_fts) do
  formatters_by_ft[ft] = { 'prettier' }
end

require('lazy').setup({
  spec = {
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
      'stevearc/conform.nvim',
      opts = {
        formatters_by_ft = formatters_by_ft,
        format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
        formatters = {
          stylua = {
            prepend_args = { '--indent-type', 'Spaces', '--indent-width', 2, '--quote-style', 'AutoPreferSingle' },
          },
          prettier = {
            -- 走全局 prettier；这里只保留代码风格，不指定 --config
            prepend_args = { '--no-semi', '--single-quote' },
          },
        },
      },
    },
    {
      'saghen/blink.cmp',
      version = '1.*',
      -- capabilities 由 blink 自己的 plugin/ 文件注入，无需手写
      opts = {
        keymap = { preset = 'super-tab' },
        completion = { documentation = { auto_show = true } },
      },
    },
    'neovim/nvim-lspconfig',
    'lewis6991/gitsigns.nvim', -- 自带 plugin/ 自动 setup
  },
  git = { url_format = url_format },
})

vim.cmd.colorscheme('catppuccin')

vim.lsp.enable({ 'ts_ls', 'pyright', 'tailwindcss', 'rust_analyzer', 'gopls' })

vim.keymap.set('n', '<leader>nn', '<cmd>Lexplore<CR>', { desc = 'File explorer' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Buffers' })
