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

update_system() {
    log_info "Updating system packages..."
    sudo apt update
    sudo apt upgrade -y
    log_success "System updated successfully"
}

install_apt_package() {
    local package=$1
    local check_command=${2:-$1}
    
    log_info "Checking for $package..."
    
    if dpkg -l | grep -q "^ii  $package "; then
        log_success "$package is already installed"
        return 0
    fi
    
    if command -v "$check_command" &> /dev/null; then
        log_success "$package is already installed (system version)"
        return 0
    fi
    
    log_warning "Installing $package..."
    if sudo apt install -y "$package"; then
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
        log_warning "zsh not found, installing..."
        install_apt_package "zsh" "zsh"
    fi
    
    log_warning "Installing oh-my-zsh (non-interactive mode)..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        log_success "oh-my-zsh installed successfully"
        log_info "Note: Change your shell to zsh with: chsh -s $(which zsh)"
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
    
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    
    if [[ -f "awscliv2.zip" ]]; then
        unzip -q awscliv2.zip
        sudo ./aws/install
        
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

install_php() {
    log_info "Setting up PHP repository..."
    
    if ! grep -q "ondrej/php" /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null; then
        log_warning "Adding ondrej/php PPA..."
        sudo add-apt-repository -y ppa:ondrej/php
        sudo apt update
    fi
    
    install_apt_package "php8.2" "php"
    install_apt_package "php8.2-cli" "php"
    install_apt_package "php8.2-fpm" "php-fpm"
    install_apt_package "php8.2-mysql" "php"
    install_apt_package "php8.2-xml" "php"
    install_apt_package "php8.2-curl" "php"
    install_apt_package "php8.2-mbstring" "php"
    install_apt_package "php8.2-intl" "php"
    install_apt_package "php8.2-zip" "php"
    
    log_info "Checking for Composer..."
    if command -v composer &> /dev/null; then
        log_success "Composer is already installed"
    else
        log_warning "Installing Composer..."
        curl -sS https://getcomposer.org/installer | php
        sudo mv composer.phar /usr/local/bin/composer
        sudo chmod +x /usr/local/bin/composer
        log_success "Composer installed successfully"
    fi
}

install_mysql() {
    log_info "Checking for MySQL..."
    
    if command -v mysql &> /dev/null; then
        log_success "MySQL is already installed"
        return 0
    fi
    
    log_warning "Installing MySQL..."
    install_apt_package "mysql-server" "mysql"
    install_apt_package "mysql-client" "mysql"
    
    log_info "To start MySQL: sudo service mysql start"
}

install_development_tools() {
    log_info "Installing development tools..."
    
    # Base dependencies
    install_apt_package "build-essential" "make"
    install_apt_package "software-properties-common" "add-apt-repository"
    install_apt_package "curl" "curl"
    install_apt_package "wget" "wget"
    install_apt_package "git" "git"
    install_apt_package "unzip" "unzip"
    
    # Development tools
    install_apt_package "autoconf" "autoconf"
    install_apt_package "neovim" "nvim"
    install_apt_package "tmux" "tmux"
    install_apt_package "stow" "stow"
    install_apt_package "bat" "batcat"
    install_apt_package "ripgrep" "rg"
    install_apt_package "zsh" "zsh"
    
    # bat is installed as batcat on Ubuntu, create alias
    if command -v batcat &> /dev/null && ! command -v bat &> /dev/null; then
        mkdir -p ~/.local/bin
        ln -sf /usr/bin/batcat ~/.local/bin/bat
        log_info "Created bat symlink for batcat"
    fi
    
    # Install lazygit
    log_info "Checking for lazygit..."
    if ! command -v lazygit &> /dev/null; then
        log_warning "Installing lazygit..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        rm lazygit lazygit.tar.gz
        log_success "lazygit installed successfully"
    else
        log_success "lazygit is already installed"
    fi
    
    # Install Starship
    log_info "Checking for Starship..."
    if ! command -v starship &> /dev/null; then
        log_warning "Installing Starship..."
        curl -sS https://starship.rs/install.sh | sh -s -- -y
        log_success "Starship installed successfully"
    else
        log_success "Starship is already installed"
    fi
    
    # Install Symfony CLI
    log_info "Checking for Symfony CLI..."
    if ! command -v symfony &> /dev/null; then
        log_warning "Installing Symfony CLI..."
        curl -sS https://get.symfony.com/cli/installer | bash
        sudo mv ~/.symfony*/bin/symfony /usr/local/bin/symfony
        log_success "Symfony CLI installed successfully"
    else
        log_success "Symfony CLI is already installed"
    fi
    
    # Install yarn
    log_info "Checking for Yarn..."
    if ! command -v yarn &> /dev/null; then
        log_warning "Installing Yarn..."
        npm install -g yarn
        log_success "Yarn installed successfully"
    else
        log_success "Yarn is already installed"
    fi
    
    # Install zsh-syntax-highlighting
    if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]]; then
        log_warning "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        log_success "zsh-syntax-highlighting installed successfully"
    else
        log_success "zsh-syntax-highlighting is already installed"
    fi
}

install_docker() {
    log_info "Checking Docker setup..."
    
    if command -v docker &> /dev/null; then
        log_success "Docker is already available"
        log_info "Make sure Docker Desktop for Windows has WSL2 integration enabled"
        return 0
    fi
    
    log_warning "Docker not found in WSL"
    log_info "Please install Docker Desktop for Windows and enable WSL2 integration"
    log_info "Visit: https://docs.docker.com/desktop/windows/wsl/"
}

setup_wsl_clipboard() {
    log_info "Setting up clipboard integration..."
    
    # Check if win32yank.exe is available
    if command -v win32yank.exe &> /dev/null; then
        log_success "win32yank.exe found - clipboard integration available"
    else
        log_warning "win32yank.exe not found"
        log_info "For clipboard integration, you may want to install win32yank"
        log_info "Download from: https://github.com/equalsraf/win32yank/releases"
    fi
}

install_fonts() {
    log_info "Font installation on WSL..."
    log_warning "Fonts should be installed on Windows, not in WSL"
    log_info "Download Hack Nerd Font from: https://www.nerdfonts.com/font-downloads"
    log_info "Install the font in Windows by double-clicking the .ttf files"
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
        "zsh"
    )
    
    for dir in "${dotfile_dirs[@]}"; do
        if [[ -d "$dir" ]]; then
            log_info "Stowing $dir..."
            if stow "$dir" 2>/dev/null; then
                log_success "$dir dotfiles deployed successfully"
            else
                log_warning "Conflicts detected for $dir, backing up and replacing..."
                if [[ -f "$HOME/.zshrc" && "$dir" == "zsh" ]]; then
                    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
                    log_info "Backed up existing .zshrc"
                fi
                if stow "$dir"; then
                    log_success "$dir dotfiles deployed successfully (after backup)"
                else
                    log_error "Failed to stow $dir"
                fi
            fi
        else
            log_warning "$dir directory not found, skipping"
        fi
    done
    
    # Note about ghostty
    if [[ -d "ghostty" ]]; then
        log_info "Ghostty config found but should be configured on Windows side"
        log_info "You may need to manually copy ghostty config to Windows"
    fi
}

main() {
    log_info "Starting Ubuntu/WSL development environment setup..."
    
    update_system
    install_oh_my_zsh
    install_aws_cli
    install_fnm
    install_php
    install_mysql
    install_development_tools
    install_docker
    setup_wsl_clipboard
    install_fonts
    deploy_dotfiles
    
    log_success "Development environment setup completed!"
    log_info "Important next steps:"
    log_info "  1. Change shell to zsh: chsh -s \$(which zsh)"
    log_info "  2. Install Docker Desktop on Windows with WSL2 integration"
    log_info "  3. Install Hack Nerd Font on Windows"
    log_info "  4. Restart your terminal or run 'source ~/.zshrc'"
    log_info "  5. Start MySQL with: sudo service mysql start"
}

main "$@"