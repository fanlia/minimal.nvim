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
- lsp

## install

```sh

# stylua for lua
npm i -g prettier
npm i -g typescript-language-server pyright @tailwindcss/language-server
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
| neovim/nvim-lspconfig                     | go to definition | \<leader\>gd |
| neovim/nvim-lspconfig                     | show error       | \<leader\>e  |
| stevearc/conform.nvim                     | format on save   |              |
| MeanderingProgrammer/render-markdown.nvim | markdown preview |              |
| saghen/blink.cmp                          | completion       |              |
| nvim builtin                              | comment line     | gcc          |
| nvim builtin                              | comment block    | gc           |

## colorscheme

- https://github.com/folke/tokyonight.nvim

## thanks

- https://github.com/amix/vimrc

## license

- mit
