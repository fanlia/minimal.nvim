
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "                           -- make sure to set `mapleader` before lazy so your mappings are correct
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.number = true                           -- line number
vim.opt.relativenumber = true                   -- relative line number
vim.opt.cursorline = true                       -- highlight current line
vim.opt.undofile = true                         -- undo file
vim.opt.undolevels = 100                        -- undo file levels
vim.opt.list = true                             -- show strange char

require("lazy").setup({
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-tree/nvim-tree.lua',
  'numToStr/Comment.nvim',
  'folke/tokyonight.nvim',
  'windwp/nvim-autopairs',
  'lukas-reineke/indent-blankline.nvim',
}, {
  git = { url_format = 'git@github.com:%s.git' },
})

vim.cmd[[colorscheme tokyonight]]

-- nvim-tree/nvim-tree.lua
require("nvim-tree").setup({
  view = { side = 'right' },
})
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", {})

-- nvim-telescope/telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- numToStr/Comment.nvim
require('Comment').setup()

-- windwp/nvim-autopairs
require('nvim-autopairs').setup{}

-- lukas-reineke/indent-blankline.nvim
require('indent_blankline').setup{}

