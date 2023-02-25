
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

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    'nvim-tree/nvim-tree.lua',
    'numToStr/Comment.nvim',
}, {
    git = { url_format = 'git@github.com:%s.git' },
})

-- nvim-tree/nvim-tree.lua
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", {})

-- nvim-telescope/telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- numToStr/Comment.nvim
require('Comment').setup()
