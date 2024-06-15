# nvim
My nvim config
## Plugins
### vim-airline/vim-airline
This is used to show a status bar at the bottom of neovim to show the mode, branch and other details about the current file
### goolord/alpha-nvim
Provides a nice visual when loading up neovim
### completions.lua
This contains plugins for snippets, mini winodw with a suggested code snippet
### lewis6991/gitsigns.nvim
This plugin can be used for some git stuff.
#### KeyMaps:
- <leader> gt => Togger line git blame
- <leader> gp => Preview hunk, changes
There are more uses for this plug (see github for a full list), however these ones fit my workflo
### lsp-config.lua
This file contains serveral plugins to configur LSP. LSP's reads files and will look for coding erros, provide suggestions and fromating. This is using Mason and Mason LSP config to manage my LSP. I'm a PHP deveploer and currently using phpactor as my main LSP 
### nvim-neo-tree/neo-tree.nvim
This provides a file tree, by defualt this is on the left side.
#### KeyMaps:
- <leader> n => Open tree on the current file
### nvimtools/none-ls.nvim
This is build from null-ls, which is no longer being maintained. Althought we have LSP's from Mason and Mason Config this plugins helps bridge the LSP's to other plugins. (I think so anyway)
### christoomey/vim-tmux-navigator
I like to use Tmux while developing to move between windows and panles, this plugins allows the use of moving between neovim windows and tmux panes. You will also need to install the Tmuc package 
#### Keymaps
- <CTRL> h => Move to left pane 
- <CTRL> j => Move to down pane 
- <CTRL> k => Move to up pane 
- <CTRL> l => Move to right pane 
### epwalsh/obsidian.nvim
This plugin was to use obsidian note taking in the terminal
### xemptuous/sqlua.nvim
This plugin is to connect to a sql server. I havemn't got round to configuring this yet
### nvim-telescope/telescope.nvim
This is another very useful plugin, telescope allows you to search for files or fuzzy find in files.
#### Keymaps:
- <leader> sh => Search Help 
- <leader> sk => Search Keymap 
- <leader> sf => Search Files 
- <leader> ss => Search Select Telescope
- <leader> sw => Search Current Word
- <leader> sd => Search Diagnostics
- <leader> sr => Search Resume 
- <leader><leader> => Find current buffers 
- <leader> fg => Live Grep
- <leader> fp => Previouse Opened Files
- <leader> sr => LSP Reference
- <leader> / => Fuzzy Find Current File
- <ctnl> p => Search Files 
### theme.lua/catppuccin/nvim
This is the current theme used for neovim. I am using catppuccin dark but I've also other dark themese commented out. If you're using tmux it's worth getting the catppuccin theme for your terminal of cchoice.
### nvim-treesitter/nvim-treesitter
This plugin helps with code highlighting, making easier to read.
### mbbill/undotree
This plugin provides a history of changes to the current file.
#### Keymaps:
- <leader> u => Toggle undo tree
### tpope/vim-commentary
This plugin add's keymaps for quickly commenting out lines
#### Keymaps:
- (normal mode) gcc => comments out the current line, can be prefixed with number of lines to comment out
- (visual mode) gc => comments out the selected lines
### RRethy/vim-illuminate
This plugins will hight all places were the current varible is being used, making clealier to read your code.
### vim-test/vim-test
This plugin is used to run tests wihtout leaving neovim, I have this setup with my tmux to open a new pane at the bottom
#### Keymaps:
- <leader> t => Test nearest test 
- <leader> T => Test current file 
- <leader> a => Test all tests
- <leader> l => Rerun last test 
- <leader> g => Go to last test
