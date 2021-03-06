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
eval "$(pyenv init -)"
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/k-arai/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/k-arai/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/k-arai/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/k-arai/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# added by Miniconda2 installer
export PATH="/Users/k-arai/miniconda2/bin:$PATH"
