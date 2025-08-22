#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_and_install_homebrew() {
    log_info "Checking for Homebrew installation..."
    
    if command -v brew &> /dev/null; then
        log_success "Homebrew is already installed"
        log_info "Current Homebrew version: $(brew --version | head -n 1)"
        return 0
    fi
    
    log_warning "Homebrew not found. Installing Homebrew..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
            log_success "Homebrew installed successfully (Apple Silicon)"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
            log_success "Homebrew installed successfully (Intel)"
        else
            log_error "Homebrew installation failed"
            exit 1
        fi
    else
        log_error "This script currently only supports macOS"
        exit 1
    fi
}

install_brew_package() {
    local package=$1
    local check_command=${2:-$1}
    
    log_info "Checking for $package..."
    
    if brew list "$package" &> /dev/null; then
        log_success "$package is already installed"
        return 0
    fi
    
    if command -v "$check_command" &> /dev/null && [[ "$package" != *"@"* ]]; then
        log_success "$package is already installed (system version)"
        return 0
    fi
    
    log_warning "Installing $package..."
    if brew install "$package"; then
        log_success "$package installed successfully"
    else
        log_error "Failed to install $package"
        return 1
    fi
}

install_oh_my_zsh() {
    log_info "Checking for oh-my-zsh installation..."
    
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        log_success "oh-my-zsh is already installed"
        return 0
    fi
    
    if ! command -v zsh &> /dev/null; then
        log_error "zsh is not installed. Please ensure zsh is installed first."
        return 1
    fi
    
    log_warning "Installing oh-my-zsh (non-interactive mode)..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        log_success "oh-my-zsh installed successfully"
        log_info "Note: You may need to change your shell to zsh manually: chsh -s $(which zsh)"
    else
        log_error "oh-my-zsh installation failed"
        return 1
    fi
}

install_aws_cli() {
    log_info "Checking for AWS CLI installation..."
    
    if command -v aws &> /dev/null; then
        log_success "AWS CLI is already installed"
        log_info "Current AWS CLI version: $(aws --version)"
        return 0
    fi
    
    log_warning "Installing AWS CLI..."
    
    local temp_dir=$(mktemp -d)
    cd "$temp_dir"
    
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    
    if [[ -f "AWSCLIV2.pkg" ]]; then
        sudo installer -pkg AWSCLIV2.pkg -target /
        
        if command -v aws &> /dev/null; then
            log_success "AWS CLI installed successfully"
            log_info "AWS CLI version: $(aws --version)"
        else
            log_error "AWS CLI installation failed"
            cd - > /dev/null
            rm -rf "$temp_dir"
            return 1
        fi
    else
        log_error "Failed to download AWS CLI package"
        cd - > /dev/null
        rm -rf "$temp_dir"
        return 1
    fi
    
    cd - > /dev/null
    rm -rf "$temp_dir"
}

install_fnm() {
    log_info "Checking for fnm installation..."
    
    if command -v fnm &> /dev/null; then
        log_success "fnm is already installed"
        log_info "Current fnm version: $(fnm --version)"
        return 0
    fi
    
    log_warning "Installing fnm..."
    
    if curl -fsSL https://fnm.vercel.app/install | bash; then
        log_success "fnm installed successfully"
    else
        log_error "fnm installation failed"
        return 1
    fi
}

install_development_tools() {
    log_info "Installing development tools..."
    
    local packages=(
        "autoconf:autoconf"
        "php@8.2:php"
        "composer:composer"
        "icu4c:icu-config"
        "yarn:yarn"
        "neovim:nvim"
        "tmux:tmux"
        "symfony-cli:symfony"
        "mysql@8.4:mysql"
        "lazygit:lazygit"
        "zsh-syntax-highlighting:zsh-syntax-highlighting"
        "starship:starship"
        "stow:stow"
        "bat:bat"
    )
    
    for package_info in "${packages[@]}"; do
        IFS=':' read -r package check_cmd <<< "$package_info"
        install_brew_package "$package" "$check_cmd"
    done
    
    log_info "Linking versioned packages..."
    brew link --force php@8.2 2>/dev/null || log_warning "Could not link php@8.2"
    brew link --force mysql@8.4 2>/dev/null || log_warning "Could not link mysql@8.4"
    
}

install_applications() {
    log_info "Installing GUI applications..."
    
    # Docker
    log_info "Checking for Docker..."
    if [[ -d "/Applications/Docker.app" ]]; then
        log_success "Docker is already installed"
    elif brew list --cask docker &> /dev/null; then
        log_success "Docker is already installed (via Homebrew)"
    else
        log_warning "Installing Docker..."
        if brew install --cask docker; then
            log_success "Docker installed successfully"
        else
            log_error "Failed to install Docker"
        fi
    fi
    
    # Postman
    log_info "Checking for Postman..."
    if [[ -d "/Applications/Postman.app" ]]; then
        log_success "Postman is already installed"
    elif brew list --cask postman &> /dev/null; then
        log_success "Postman is already installed (via Homebrew)"
    else
        log_warning "Installing Postman..."
        if brew install --cask postman; then
            log_success "Postman installed successfully"
        else
            log_error "Failed to install Postman"
        fi
    fi
    
    # Hack Nerd Font
    log_info "Checking for Hack Nerd Font..."
    if brew list --cask font-hack-nerd-font &> /dev/null; then
        log_success "Hack Nerd Font is already installed (via Homebrew)"
    elif ls ~/Library/Fonts/HackNerdFont* &>/dev/null || ls /Library/Fonts/HackNerdFont* &>/dev/null; then
        log_success "Hack Nerd Font is already installed (system fonts)"
    else
        log_warning "Installing Hack Nerd Font..."
        if brew install --cask font-hack-nerd-font; then
            log_success "Hack Nerd Font installed successfully"
        else
            log_error "Failed to install Hack Nerd Font"
        fi
    fi
}

install_php_extensions() {
    log_info "PHP extensions installation skipped"
    log_info "Install Xdebug manually if needed: pecl install xdebug"
}

deploy_dotfiles() {
    log_info "Deploying dotfiles with stow..."
    
    if ! command -v stow &> /dev/null; then
        log_error "GNU stow is not installed. Please ensure stow is installed first."
        return 1
    fi
    
    local dotfile_dirs=(
        "nvim"
        "tmux"
        "starship"
        "ghostty"
        "zsh"
    )
    
    for dir in "${dotfile_dirs[@]}"; do
        if [[ -d "$dir" ]]; then
            log_info "Stowing $dir..."
            if stow "$dir" 2>/dev/null; then
                log_success "$dir dotfiles deployed successfully"
            else
                log_warning "Conflicts detected for $dir, backing up existing files and adopting..."
                if [[ -f "$HOME/.zshrc" && "$dir" == "zsh" ]]; then
                    cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
                    log_info "Backed up existing .zshrc"
                fi
                if stow --adopt "$dir"; then
                    log_success "$dir dotfiles deployed successfully (with adoption)"
                else
                    log_error "Failed to stow $dir even with adoption"
                fi
            fi
        else
            log_warning "$dir directory not found, skipping"
        fi
    done
}

main() {
    log_info "Starting development environment setup..."
    
    install_oh_my_zsh
    check_and_install_homebrew
    install_aws_cli
    install_fnm
    install_development_tools
    install_applications
    install_php_extensions
    deploy_dotfiles
    
    log_success "Development environment setup completed!"
    log_info "You may need to restart your terminal or run 'source ~/.zshrc' to use newly installed tools"
}

main "$@"