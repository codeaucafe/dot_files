# Golang
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$GOROOT/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# OpenSSL
export PATH="/usr/local/opt/openssl@3/bin:/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib -L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include -I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/openssl@1.1/lib:$DYLD_LIBRARY_PATH"

# PSQL
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pipx
export PIP_REQUIRE_VIRTUALENV=true

# System Paths
export PATH="/usr/local/sbin:$PATH"

# GPG/Signed Commit Configuration
export GPG_TTY=$(tty)
