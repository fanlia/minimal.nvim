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
- format
- completion
- llm
- lsp

## install

```sh
npm i -g prettier
npm i -g typescript-language-server pyright
pip install isort black

git clone git@github.com:fanlia/minimal.nvim.git ~/.config/nvim

nvim
# after plugins installed, press `q` to close the installation window

```

## keymapping

```lua
local leader = ' '

```

| plugin                                    | func             | keymapping   |
| ----------------------------------------- | ---------------- | ------------ |
| nvim-tree/nvim-tree.lua                   | toggle tree      | \<leader\>nn |
| nvim-telescope/telescope.nvim             | find files       | \<leader\>ff |
| nvim-telescope/telescope.nvim             | live grep        | \<leader\>fg |
| nvim-telescope/telescope.nvim             | find buffers     | \<leader\>fb |
| olimorris/codecompanion.nvim              | chat buffer      | \<leader\>ii |
| olimorris/codecompanion.nvim              | inline prompt    | \<leader\>ij |
| stevearc/conform.nvim                     | format on save   |              |
| MeanderingProgrammer/render-markdown.nvim | markdown preview |              |
| saghen/blink.cmp                          | completion       |              |
| nvim builtin                              | comment line     | gcc          |
| nvim builtin                              | comment block    | gc           |

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
- https://github.com/folke/tokyonight.nvim
- https://github.com/windwp/nvim-autopairs
- https://github.com/lukas-reineke/indent-blankline.nvim

## colorscheme

- https://github.com/folke/tokyonight.nvim

## thanks

- https://github.com/amix/vimrc

## license

- mit
