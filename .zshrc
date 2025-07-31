# --------------------------------------------------
# POWERLEVEL10K INSTANT PROMPT (MUST BE FIRST)
# --------------------------------------------------
# Only load P10k instant prompt if NOT in JetBrains terminal
if [[ -z "$TERMINAL_EMULATOR" || "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
fi

# --------------------------------------------------
# OH MY ZSH CONFIGURATION
# --------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# Detect if we're in a JetBrains terminal
if [[ -n "$TERMINAL_EMULATOR" && "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
    # Use simple Robbyrussell theme in JetBrains
    ZSH_THEME="robbyrussell"
else
    # Use Powerlevel10k everywhere else
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi

plugins=(git colored-man-pages colorize pip python brew macos zsh-syntax-highlighting poetry golang zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# --------------------------------------------------
# PATH CONFIGURATION - Consolidated
# --------------------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/Applications:$PATH"

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
# Only load P10k config if NOT in JetBrains terminal
if [[ -z "$TERMINAL_EMULATOR" || "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

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

# kubectl completion (add this here)
if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daviddansby/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/daviddansby/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/daviddansby/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/daviddansby/google-cloud-sdk/completion.zsh.inc'; fi

# --------------------------------------------------
# STARSHIP and Oh-My-Post PROMPT (MUST BE LAST)
# --------------------------------------------------
# eval "$(starship init zsh)"
# eval "$(oh-my-posh init zsh)"
