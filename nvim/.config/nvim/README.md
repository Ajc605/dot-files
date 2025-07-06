# nvim

My nvim config

## Plugins

### goolord/alpha-nvim

Provides a nice visual when loading up neovim

### Completions and Snippets

- LuaSnip
- friendly-snippets
- cmp-nvim-lsp
- cmp_luasnip
  Provides code completion and snippet functionality

### eslint.nvim

ESLint integration for Neovim

### Debug Support

These plugins use the Debug Adaptor Protocol (DAP) to allow debugging in nvim, like with xDebug.

#### KeyMaps:

- `<leader>dt` => Creates break point on the current line
- `<leader>dc` => Starts the Debugger and continues to next break point
- `<leader>do` => Step Over
- `<leader>di` => Step Into
- `<leader>du` => Toggles UI

### lewis6991/gitsigns.nvim

Git integration for showing changes in the sign column.

#### KeyMaps:

- `<leader>gt` => Toggle line git blame
- `<leader>gp` => Preview hunk changes
- `<leader>hu` => Undo hunk
- `<leader>nh` => Next hunk
- `<leader>Nh` => Previous hunk

### LSP Configuration

Uses Mason and Mason-lspconfig to manage Language Server Protocols. Currently configured for PHP development using phpactor.

### Theme

Using Catppuccin theme for a modern, clean look. If you're using tmux, consider getting the matching Catppuccin theme for your terminal.

### nvim-neo-tree/neo-tree.nvim

File explorer tree.

#### KeyMaps:

- `<leader>n` => Open tree on the current file

### folke/noice.nvim

Enhanced command line and notifications UI

### nvimtools/none-ls.nvim

Bridges LSP functionality with other tools

### christoomey/vim-tmux-navigator

Seamless navigation between Neovim windows and tmux panes.

#### Keymaps:

- `<CTRL>h` => Move to left pane
- `<CTRL>j` => Move to down pane
- `<CTRL>k` => Move to up pane
- `<CTRL>l` => Move to right pane

### epwalsh/obsidian.nvim

Obsidian integration for note-taking

### gbprod/phpactor.nvim

PHP development tools and LSP support

### nvim-telescope/telescope.nvim

Fuzzy finder and file navigation.

#### Keymaps:

- `<leader>sh` => Search Help
- `<leader>sk` => Search Keymap
- `<leader>sf` => Search Files
- `<leader>ss` => Search Select Telescope
- `<leader>sw` => Search Current Word
- `<leader>sd` => Search Diagnostics
- `<leader>sr` => Search Resume
- `<leader><leader>` => Find current buffers
- `<leader>fg` => Live Grep
- `<leader>fp` => Previous Opened Files
- `<leader>sr` => LSP Reference
- `<leader>/` => Fuzzy Find Current File
- `<CTRL>p` => Search Files

### nvim-treesitter/nvim-treesitter

Syntax highlighting and code parsing

### folke/trouble.nvim

Enhanced error, warning, and diagnostic viewing.

#### Keymaps:

- `<leader>xx` => Opens pane with diagnostics for current file/buffer

### mbbill/undotree

Visual representation of file change history.

#### Keymaps:

- `<leader>u` => Toggle undo tree

### tpope/vim-commentary

Quick commenting functionality.

#### Keymaps:

- (normal mode) `gcc` => Comments out the current line
- (visual mode) `gc` => Comments out the selected lines

### voldikss/vim-floaterm

Floating terminal window.

#### Keymaps:

- `<Esc>` => Exit Terminal mode
- `<leader>ft` => Toggle floating terminal

### RRethy/vim-illuminate

Highlights other uses of the current word under the cursor

### vim-test/vim-test

Test runner integration.

#### Keymaps:

- `<leader>t` => Test nearest test
- `<leader>T` => Test current file
- `<leader>a` => Test all tests
- `<leader>l` => Rerun last test
- `<leader>g` => Go to last test
