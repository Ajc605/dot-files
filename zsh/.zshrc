export ZSH=$HOME/.oh-my-zsh
export HOMEBREW_NO_AUTO_UPDATE=1
export XDEBUG_MODE=coverage

HYPHEN_INSENSITIVE='true'

plugins=(
      macos
      last-working-dir
      extract
      history
      web-search  # optional
  )

source $ZSH/oh-my-zsh.sh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':omz:update' mode disabled  # disable automatic updates

# ============================================================================
# MYSQL ALIASES
# ============================================================================
alias mysqlStart='mysql.server start'
alias mysqlStop='mysql.server stop'
alias mysqlRestart='mysql.server restart'

# ============================================================================
# DOCKER ALIASES
# ============================================================================
alias dockerStop='docker stop $(docker ps -q)'
alias dockerKill='docker rm $(docker ps -qa)'

# ============================================================================
# PHP ALIASES
# ============================================================================
alias unitTest='APP_ENV=test ./vendor/bin/phpunit'

# Load work-specific configuration if it exists
if [ -f ~/.zshrc.work ]; then
  source ~/.zshrc.work
fi

eval "$(fnm env --use-on-cd --shell zsh)"
# eval "$(direnv hook zsh)"

# Install and set Node.js 20 as default if not already installed
if command -v fnm &> /dev/null; then
    if ! fnm list | grep -q "v20"; then
        echo "Installing Node.js 20..."
        fnm install 20
        fnm default 20
    elif ! fnm list | grep -q "default.*v20"; then
        echo "Setting Node.js 20 as default..."
        fnm default 20
    fi
fi

eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
