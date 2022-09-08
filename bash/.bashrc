export PATH="$(go env GOPATH)/bin:$PATH"
. "$HOME/.cargo/env"

if [ -f ~/.bash_ld ]; then
  #shellcheck source=/dev/null
  . ~/.bash_ld
fi

if [ -f ~/.bash_aliases ]; then
  #shellcheck source=/dev/null
  . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
  # shellcheck source=/dev/null
  . ~/.bash_functions
fi
