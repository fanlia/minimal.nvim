
url_format = 'git@github.com:%s.git'
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = string.format(url_format, 'folke/lazy.nvim')
  print(lazypath, lazyrepo)
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
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
vim.opt.foldmethod = "indent"                   -- foldmethod
vim.opt.foldenable = false                      -- nofold at startup

-- minimal plguins
local plugins = {
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-tree/nvim-tree.lua',
  'folke/tokyonight.nvim',
  'windwp/nvim-autopairs',
  'lukas-reineke/indent-blankline.nvim',
}

-- try to load myplugins
local status_ok, myplugins = pcall(require, 'myplugins')
if status_ok then
  vim.list_extend(plugins, myplugins)
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = plugins,
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

-- windwp/nvim-autopairs
require('nvim-autopairs').setup()

-- lukas-reineke/indent-blankline.nvim
require('ibl').setup()
