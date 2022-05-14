# pyenv related
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# export PATH="/Users/daviddansby/.pyenv/bin:$PATH"
eval "$(pyenv init -)" 2>&1 >/dev/null
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# poetry related
export PATH="$HOME/.poetry/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# golang
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# gpg/signed commit stuff
export GPG_TTY=$(tty)
