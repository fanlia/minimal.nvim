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
- lsp
- prettier

## install

```sh
git clone git@github.com:fanlia/minimal.nvim.git ~/.config/nvim

nvim
# after plugins installed, press `q` to close the installation window

# install formatter
:MasonInstall prettier
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
| neovim/nvim-lspconfig | go to definition | gd |
| neovim/nvim-lspconfig | hover signature | K |
| stevearc/conform.nvim | html/json/javascript/typescript formatter | \<leader\>cf |

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

- https://github.com/nvim-telescope/telescope.nvim
- https://github.com/nvim-tree/nvim-tree.lua
- https://github.com/numToStr/Comment.nvim
- https://github.com/folke/tokyonight.nvim
- https://github.com/windwp/nvim-autopairs
- https://github.com/lukas-reineke/indent-blankline.nvim
- https://github.com/neovim/nvim-lspconfig
- https://github.com/williamboman/mason.nvim
- https://github.com/williamboman/mason-lspconfig.nvim
- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/stevearc/conform.nvim

## colorscheme

- https://github.com/folke/tokyonight.nvim

## thanks

- https://github.com/amix/vimrc

## license

- mit
