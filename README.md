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
```

## plugins

- nvim-telescope/telescope.nvim
- nvim-tree/nvim-tree.lua
- numToStr/Comment.nvim
- folke/tokyonight.nvim
- windwp/nvim-autopairs
- lukas-reineke/indent-blankline.nvim

## keymapping

```lua
local leader = ' '

-- nvim-tree/nvim-tree.lua
-- toggle <leader>nn

-- nvim-telescope/telescope.nvim
-- find_files <leader>ff
-- live_grep <leader>fg
-- buffers <leader>fb

-- numToStr/Comment.nvim
-- comment_line gcc
-- comment_block gc
```

## colorscheme

- folke/tokyonight.nvim

## license

- mit
