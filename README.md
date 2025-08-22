# Development Environment Dotfiles

A complete development environment setup using GNU Stow for dotfile management, featuring configurations for Neovim, tmux, Starship prompt, Ghostty terminal, and zsh, plus an automated installation script.

## 🚀 Quick Start

### Automated Installation
```bash
git clone https://github.com/yourusername/dot-files.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The install script will:
- Install oh-my-zsh
- Install Homebrew (if not present)
- Install AWS CLI
- Install fnm (Fast Node Manager)
- Install development tools via Homebrew
- Install GUI applications (Docker, Postman, Hack Nerd Font)
- Deploy all dotfiles using GNU Stow

### Manual Installation
```bash
# Install GNU Stow
brew install stow

# Deploy all configurations
stow */

# Or deploy specific configurations
stow nvim tmux starship ghostty zsh
```

## 📦 What's Included

### 🎯 Core Tools
- **Neovim**: Comprehensive Symfony/API Platform development environment
- **tmux**: Terminal multiplexer with Catppuccin theme and session management
- **Starship**: Fast, customizable shell prompt
- **Ghostty**: Modern terminal emulator configuration
- **zsh**: Shell configuration with oh-my-zsh and auto Node.js 20 setup

### 🛠 Development Tools (Auto-installed)
- PHP 8.2 with Composer
- Node.js (managed via fnm)
- Yarn package manager
- Symfony CLI
- MySQL 8.4
- LazyGit
- ICU4C (for Node.js compatibility)
- And more...

### 🎨 GUI Applications (Auto-installed)
- Docker Desktop
- Postman
- Hack Nerd Font

## 🔧 Configuration Details

### Neovim
- **Focus**: Symfony and API Platform development
- **Package Manager**: Lazy.nvim
- **LSP**: Intelephense + PHPActor for PHP
- **Features**: Database management, API testing, debugging support, enhanced PHPUnit
- **Theme**: Catppuccin

### tmux
- **Prefix**: `Ctrl-s`
- **Theme**: Catppuccin with system monitoring
- **Features**: Session persistence, vim-style navigation
- **Plugins**: TPM, tmux-resurrect, tmux-continuum

### Starship Prompt
- **Features**: AWS profile display, memory usage, local IP on SSH
- **Performance**: Fast startup with selective module loading

### Ghostty Terminal
- **Font**: Hack Nerd Font (13pt)
- **Theme**: Catppuccin Frappe
- **Features**: 95% opacity, ligatures disabled for cleaner code

### zsh Configuration
- **Framework**: oh-my-zsh
- **Auto-setup**: Node.js 20 via fnm
- **Features**: Symfony/Docker/PHP aliases, syntax highlighting
- **Prompt**: Starship integration

## 🎨 Theme Consistency

All tools use the **Catppuccin** theme family for visual consistency across the development environment.

## 🔄 Managing Configurations

### Deploy Changes
```bash
# After modifying any dotfiles
stow */
```

### Remove Configurations
```bash
# Remove specific configuration
stow -D nvim

# Remove all configurations
stow -D */
```

### Update Plugins
```bash
# Neovim plugins
nvim +Lazy sync

# tmux plugins
prefix + I  # (Ctrl-s + I)
```

## 📋 Requirements

- macOS (Darwin)
- Git
- Curl

All other dependencies are automatically installed by the install script.

## 🤝 Contributing

Feel free to fork and adapt these configurations for your own use. The modular structure makes it easy to pick and choose components.
