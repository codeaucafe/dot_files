# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Golang
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# User bin directories
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# OpenSSL
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib -L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include -I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/openssl@1.1/lib:$DYLD_LIBRARY_PATH"

# pipx
export PIP_REQUIRE_VIRTUALENV=true

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Zsh Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="agnoster"

# Plugins
plugins=(git colored-man-pages colorize pip python brew macos zsh-syntax-highlighting poetry golang zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Userpath additions
export PATH="$HOME/.local/bin:$PATH"

# GPG/Signed Commit Configuration
export GPG_TTY=$(tty)

# Keybindings
bindkey '\x01' beginning-of-line
bindkey '\x05' end-of-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
