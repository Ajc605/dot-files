export ZSH=$HOME/.oh-my-zsh
export HOMEBREW_NO_AUTO_UPDATE=1

HYPHEN_INSENSITIVE='true'

plugins=(
      macos
      last-working-dir
      extract
      history
      web-search  # optional
  )

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
eval "$(starship init zsh)"
