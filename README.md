# minimal.nvim

minimal nvim config, hope you like it!

## what is it

- find files
- file explorer
- comment
- color
- autopairs
- indent line
- buffer explorer
- grep

## install

```sh
git clone git@github.com:fanlia/minimal.nvim.git ~/.config/nvim

nvim
# after plugins installed, press `q` to close the installation window
```

## keymapping

```lua
local leader = ' '

```

| plugin | func | keymapping |
| --- | --- | --- |
| nvim-tree/nvim-tree.lua | toggle tree | \<leader\>nn |
| nvim-telescope/telescope.nvim | find files | \<leader\>ff |
| nvim-telescope/telescope.nvim | live grep | \<leader\>fg |
| nvim-telescope/telescope.nvim | find buffers | \<leader\>fb |
| numToStr/Comment.nvim | comment line | gcc |
| numToStr/Comment.nvim | comment block | gc |

## custom plugins

- https://github.com/folke/lazy.nvim

```lua
-- create file ./lua/myplugins.lua

return {
  'ziglang/zig.vim',
  'cheap-glitch/vim-v',
}
```

## plugins

- nvim-telescope/telescope.nvim
- nvim-tree/nvim-tree.lua
- numToStr/Comment.nvim
- folke/tokyonight.nvim
- windwp/nvim-autopairs
- lukas-reineke/indent-blankline.nvim

## colorscheme

- folke/tokyonight.nvim

## thanks

- https://github.com/amix/vimrc

## license

- mit
