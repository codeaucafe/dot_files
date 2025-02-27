# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Golang
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$GOROOT/bin:$PATH"

# System Paths
export PATH="/usr/local/sbin:$PATH"

# GPG/Signed Commit Configuration
export GPG_TTY=$(tty)

export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"
