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
- LSP (go-to-definition, diagnostics, code actions)

## install

```sh
git clone git@github.com:fanlia/minimal.nvim.git ~/.config/nvim
nvim
```

## keymapping

| Key              | Action           | Description     |
| ---------------- | ---------------- | --------------- |
| \<leader\>=space | leader key       | leader key      |
| \<leader\>nn     | file explorer    | netrw sidebar   |
| \<leader\>ff     | find files       | fuzzy finder    |
| \<leader\>fg     | live grep        | grep/search     |
| \<leader\>fb     | find buffers     | buffer explorer |
| \<leader\>gd     | go to definition | LSP             |
| \<leader\>e      | diagnostics      | LSP             |
| \<leader\>ca     | code action      | LSP             |
| \<leader\>cr     | rename symbol    | LSP             |
| gr               | references       | LSP             |
| \<leader\>f      | format           | LSP             |
| ]d / [d          | diagnostics nav  | LSP             |
| gcc              | comment line     | nvim builtin    |
| gc               | comment block    | nvim builtin    |

**File management:**

- `<leader>nn` - Open file explorer (netrw sidebar)
- `:e path/file.ts` - Create/open file
- `:!rm %` - Delete current file

**In netrw explorer** (native keybindings):
| Key | Action |
|-----|--------|
| `<Enter>` | Open (dir: navigate / file: **same window**) |
| `-` | Parent directory |
| `%` | New file |
| `d` | New folder |
| `D` | **Delete** file/folder |
| `R` | **Rename** file/folder |
| `q` | Close (quit) |

**Note:** D and R work immediately (no confirmation)

## colorscheme

- https://github.com/folke/tokyonight.nvim

## thanks

- https://github.com/amix/vimrc

## license

- mit
