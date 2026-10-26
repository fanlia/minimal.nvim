# minimal.nvim

minimal nvim config, hope you like it!

## what is it

- find files (Telescope)
- file explorer (netrw built-in)
- comment (nvim builtin)
- colorscheme (Catppuccin)
- buffer explorer (Telescope)
- grep/search (Telescope)
- format on save (Conform.nvim)
- completion (Blink.cmp)
- git hunk signs (Gitsigns)
- LSP (uses nvim 0.11+ built-in keymaps, no extra mapping)

## install

```sh
git clone git@github.com:fanlia/minimal.nvim.git ~/.config/nvim
nvim
```

No local npm install. Formatters and LSP servers are expected on `$PATH`:
`prettier` (global), `stylua`, `ruff`, `rustfmt`, `goimports`,
plus `typescript-language-server`, `pyright-langserver`, `gopls`, `rust-analyzer`,
`tailwindcss-language-server`.

## keymapping

Only the mappings below are defined by this config; everything else is a nvim default.

| Key                | Action                            | Source           |
| ------------------ | --------------------------------- | ---------------- |
| \<leader\> = space | leader key                        | this config      |
| \<leader\>nn       | file explorer                     | netrw (Lexplore) |
| \<leader\>ff       | find files                        | Telescope        |
| \<leader\>fg       | live grep                         | Telescope        |
| \<leader\>fb       | find buffers                      | Telescope        |
| gd                 | go to definition                  | nvim default     |
| K                  | hover documentation               | nvim default     |
| grn / gra / grr    | rename / code action / references | nvim default     |
| gO                 | document symbols                  | nvim default     |
| ]d / [d            | next/prev diagnostic              | nvim default     |
| \<C-w\>d           | diagnostics float                 | nvim default     |
| gcc / gc           | comment line/block                | nvim default     |

Formatting happens automatically on save (see `formatters_by_ft` in init.lua);
run `:ConformInfo` to debug, no manual format keymap is defined.

**File management:**

- `<leader>nn` - Open file explorer (netrw sidebar)
- `:e path/file.ts` - Create/open file
- `:!rm %` - Delete current file

**In netrw explorer** (native keybindings):

| Key       | Action                                       |
| --------- | -------------------------------------------- |
| `<Enter>` | Open (dir: navigate / file: **same window**) |
| `-`       | Parent directory                             |
| `%`       | New file                                     |
| `d`       | New folder                                   |
| `D`       | **Delete** file/folder                       |
| `R`       | **Rename** file/folder                       |
| `q`       | Close (quit)                                 |

**Note:** D and R work immediately (no confirmation)

## colorscheme

- catppuccin, shipped with Neovim 0.12's runtime (`$VIMRUNTIME/colors/catppuccin.vim`)
- on Neovim < 0.12 add a plugin (e.g. https://github.com/catppuccin/nvim) before using it

## thanks

- https://github.com/amix/vimrc

## license

- mit
