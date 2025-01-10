source ~/.profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# rbenvにパスを通す
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

export PATH=$PATH:/Users/k-arai/Library/Android/sdk/build-tools/28.0.3
# タブ補完

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH="/Users/k-arai/Documents/flutter/bin:$PATH"

eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)

