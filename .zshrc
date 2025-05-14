# --------------------------------------------------
# POWERLEVEL10K INSTANT PROMPT (MUST BE FIRST)
# --------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------
# OH MY ZSH CONFIGURATION
# --------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colored-man-pages colorize pip python brew macos zsh-syntax-highlighting poetry golang zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# --------------------------------------------------
# PATH CONFIGURATION - Consolidated
# --------------------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# --------------------------------------------------
# SYSTEM LIBRARIES & DEPENDENCIES
# --------------------------------------------------
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib -L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include -I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/openssl@1.1/lib:$DYLD_LIBRARY_PATH"

# --------------------------------------------------
# SHELL BEHAVIOR & KEYBINDINGS
# --------------------------------------------------
export GPG_TTY=$(tty)
bindkey '\x01' beginning-of-line  # Ctrl+A
bindkey '\x05' end-of-line        # Ctrl+E

# --------------------------------------------------
# THEME CONFIGURATION
# --------------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --------------------------------------------------
# DEVELOPMENT ENVIRONMENTS (OUTPUT-PRODUCING)
# --------------------------------------------------

# pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# pipx
export PIP_REQUIRE_VIRTUALENV=true

# Golang
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# nvm config (can produce output, so placed late)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Docker completions
fpath=(/Users/daviddansby/.docker/completions $fpath)
autoload -Uz compinit
compinit
