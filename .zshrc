# --------------------------------------------------
# POWERLEVEL10K INSTANT PROMPT
# --------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------
# OH MY ZSH CONFIGURATION
# --------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Plugins
plugins=(git colored-man-pages colorize pip python brew macos zsh-syntax-highlighting poetry golang zsh-autosuggestions)

# --------------------------------------------------
# PATH CONFIGURATION - Consolidated
# --------------------------------------------------
# Base path additions
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# --------------------------------------------------
# DEVELOPMENT ENVIRONMENTS
# --------------------------------------------------
# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# Use --path flag to avoid output during initialization
eval "$(pyenv init --path)"

# pipx
export PIP_REQUIRE_VIRTUALENV=true

# Golang configuration
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# --------------------------------------------------
# SYSTEM LIBRARIES & DEPENDENCIES
# --------------------------------------------------
# OpenSSL
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib -L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include -I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/openssl@1.1/lib:$DYLD_LIBRARY_PATH"

# --------------------------------------------------
# SHELL BEHAVIOR & KEYBINDINGS
# --------------------------------------------------
# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# IMPORTANT: Move these output-producing commands after the instant prompt is fully initialized

# Node.js - nvm configuration (can produce output)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# GPG/Signed Commit Configuration
export GPG_TTY=$(tty)

# pyenv virtualenv initialization (can produce output)
eval "$(pyenv virtualenv-init -)"

# Keybindings (Emacs-style)
bindkey '\x01' beginning-of-line  # Ctrl+A
bindkey '\x05' end-of-line        # Ctrl+E

# --------------------------------------------------
# THEME CONFIGURATION
# --------------------------------------------------
# To customize prompt, run p10k configure or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
