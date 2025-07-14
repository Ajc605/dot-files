# Neovim Configuration for Symfony & API Platform Development

A comprehensive Neovim configuration specifically optimized for **Symfony** and **API Platform** development. This setup provides a complete PHP development environment with integrated testing, debugging, database management, and API development tools.

## 🚀 Quick Start

1. Install Neovim (>= 0.9.0)
2. Clone this configuration to `~/.config/nvim`
3. Open Neovim - Lazy.nvim will automatically install all plugins
4. Run `:checkhealth` to verify everything is working

## 🎯 Development Focus

This configuration is designed for:
- **Symfony Framework** development with console integration
- **API Platform** REST API development and testing
- **Doctrine ORM** database management
- **PHPUnit** testing with database fixtures
- **Modern PHP** with full LSP support

---

## 🔧 Core Features

### PHP Language Support
- **Intelephense LSP** with Symfony/Doctrine/API Platform stubs
- **PHPActor** for advanced refactoring
- **PHPStan** static analysis integration
- Auto-formatting with Prettier/Prettierd

### Symfony Integration
- Direct console command access
- Entity/Controller/Form generation
- Route debugging and inspection
- Cache management commands

### Database Management
- Full database UI with vim-dadbod
- Doctrine migration workflows
- Schema validation and updates
- Test database management

### API Development
- REST API testing with .http files
- OpenAPI specification export
- API Platform debugging tools
- Request/response inspection

---

## 📁 Plugin Overview

### 🆕 New Symfony-Specific Plugins

#### ta-tikoma/php.easy.nvim
Direct Symfony console integration for rapid development.

**Keymaps:**
- `<leader>sc` - Symfony Console Commands
- `<leader>sr` - Show Symfony Routes  
- `<leader>se` - Create Entity
- `<leader>sC` - Create Controller
- `<leader>sf` - Create Form
- `<leader>sm` - Create Migration
- `<leader>st` - Create Test

#### vim-dadbod Suite (Database Management)
Complete database management for Doctrine development.

**Keymaps:**
- `<leader>db` - Open Database UI
- `<leader>dt` - Toggle Database UI
- `<leader>df` - Find DB Buffer
- `<leader>dr` - Rename DB Buffer
- `<leader>dq` - Last Query Info

#### rest-nvim (API Development)
Test API Platform endpoints directly in Neovim.

**Keymaps:**
- `<leader>ar` - Run API Request
- `<leader>ap` - Preview API Request
- `<leader>al` - Re-run Last Request

#### Doctrine & Symfony Commands
Quick access to common Symfony/Doctrine operations.

**Keymaps:**
- `<leader>dm` - Run Doctrine Migrations
- `<leader>ds` - Update Doctrine Schema
- `<leader>dv` - Validate Doctrine Schema
- `<leader>dd` - Generate Migration Diff
- `<leader>cc` - Clear Symfony Cache
- `<leader>cw` - Warmup Symfony Cache
- `<leader>apo` - Export OpenAPI Spec
- `<leader>apd` - Debug API Platform

#### Enhanced YAML Support
Schema validation for Symfony configuration files.

**Keymaps:**
- `<leader>yv` - Validate YAML
- `<leader>yf` - Format YAML
- `<leader>yt` - Telescope YAML

---

### 🔍 Enhanced File Navigation

#### Symfony-Specific Telescope Commands
Quick navigation to Symfony project directories.

**Keymaps:**
- `<leader>sC` - Find Controllers
- `<leader>sE` - Find Entities  
- `<leader>sR` - Find Repositories
- `<leader>sS` - Find Services
- `<leader>sF` - Find Forms
- `<leader>sT` - Find Tests
- `<leader>sy` - Find YAML Config Files

#### Standard Telescope Commands
- `<leader>sh` - Search Help
- `<leader>sk` - Search Keymap
- `<leader>sf` - Search Files
- `<leader>ss` - Search Select Telescope
- `<leader>sw` - Search Current Word
- `<leader>sd` - Search Diagnostics
- `<leader>sr` - Search Resume
- `<leader><leader>` - Find current buffers
- `<leader>fg` - Live Grep
- `<leader>fp` - Previous Opened Files
- `<leader>/` - Fuzzy Find Current File
- `<Ctrl-p>` - Search Files

---

### 🧪 Enhanced Testing

#### PHPUnit Integration with Symfony Support
Comprehensive testing workflow with database management.

**Basic Test Commands:**
- `<leader>t` - Test nearest test
- `<leader>T` - Test current file
- `<leader>a` - Test all tests
- `<leader>l` - Rerun last test
- `<leader>g` - Visit test file

**Advanced Test Commands:**
- `<leader>tf` - Test with filter
- `<leader>tc` - Test coverage report
- `<leader>td` - Test debug mode

**Test Database Management:**
- `<leader>tdb` - Create test database
- `<leader>tdm` - Migrate test database
- `<leader>tdf` - Load test fixtures

---

### 🐛 Debugging

#### DAP (Debug Adapter Protocol)
Full debugging support for PHP with Xdebug.

**Keymaps:**
- `<leader>dt` - Toggle breakpoint
- `<leader>dc` - Continue/start debugging
- `<leader>do` - Step over
- `<leader>di` - Step into
- `<leader>du` - Toggle debug UI

---

### 🎨 UI & Theme

#### Core UI Components
- **Theme:** Catppuccin for modern, clean aesthetics
- **Status Line:** Lualine with comprehensive information
- **Notifications:** Noice.nvim for enhanced command line
- **File Explorer:** Neo-tree (`<leader>n`)
- **Diagnostics:** Trouble.nvim (`<leader>xx`)

#### Terminal Integration
- **FloaTerm:** Floating terminal (`<leader>ft`)
- **Tmux Navigator:** Seamless pane navigation
  - `<Ctrl-h/j/k/l>` - Navigate between Neovim/tmux panes

---

### 🔧 Development Tools

#### Code Completion & Snippets
- **LuaSnip** - Snippet engine
- **friendly-snippets** - Snippet collection
- **nvim-cmp** - Completion engine with LSP integration

#### Git Integration
- **Gitsigns** - Git changes in sign column
  - `<leader>gt` - Toggle git blame
  - `<leader>gp` - Preview hunk changes
  - `<leader>hu` - Undo hunk
  - `<leader>nh` - Next hunk
  - `<leader>Nh` - Previous hunk

#### Code Quality
- **Treesitter** - Advanced syntax highlighting
- **vim-illuminate** - Highlight word under cursor
- **undotree** - Visual undo history (`<leader>u`)
- **vim-commentary** - Quick commenting (`gcc`, visual `gc`)

---

## 📋 Areas for Potential Improvement

### 1. **Container Integration**
Consider adding Docker/container management plugins:
- `docker.nvim` for container management
- `docker-compose.nvim` for service orchestration

### 2. **Additional API Testing**
- `hurl.nvim` for more advanced HTTP testing
- Postman collection import/export

### 3. **Code Quality Tools**
- **PHP CS Fixer** integration for code style
- **Rector** for automated refactoring
- **PHPDoc** generation tools

### 4. **Symfony-Specific Enhancements**
- **Twig template** syntax highlighting and completion
- **Symfony Form** visual builder integration
- **Event/Listener** quick navigation

### 5. **Database Improvements**
- **Redis** client integration for caching
- **Database schema** visualization
- **Migration rollback** workflows

### 6. **Performance Monitoring**
- **Blackfire** profiler integration
- **Xdebug profiler** visualization
- **Performance** metrics dashboard

### 7. **Documentation Tools**
- **PhpDocumentor** integration
- **OpenAPI/Swagger** editor
- **Architecture diagram** generation

---

## 🛠️ Plugin Management

Uses **Lazy.nvim** for efficient plugin management:
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - Performance profiling

---

## 📝 Configuration Structure

```
├── init.lua                 # Entry point
├── lua/
│   ├── vim-options.lua     # Core Vim settings
│   └── plugins/            # Plugin configurations
│       ├── symfony.lua     # Symfony console integration
│       ├── database.lua    # Database management
│       ├── api-tools.lua   # API development
│       ├── doctrine.lua    # Doctrine commands
│       ├── yaml.lua        # YAML enhancements
│       ├── lsp-config.lua  # Enhanced LSP setup
│       ├── vim-test.lua    # Testing framework
│       └── ...            # Other plugin configs
├── lazy-lock.json          # Plugin version lock
└── CLAUDE.md              # AI assistant documentation
```

---

## 🚀 Performance Notes

- **Lazy loading** - Most plugins load only when needed
- **Startup time** - `:StartupTime` to profile boot performance
- **LSP optimization** - Configured for large Symfony projects
- **File exclusions** - Vendor/cache directories ignored

---

*This configuration provides a complete, production-ready Symfony and API Platform development environment within Neovim. All keybindings follow the `<leader>` prefix convention for consistency.*