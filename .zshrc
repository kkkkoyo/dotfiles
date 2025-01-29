# System PATH initialization - 最初に実行
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

# Base PATH
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin

# Anaconda
if [ -d "/Users/koyoarai/opt/anaconda3" ]; then
    # >>> conda initialize >>>
    __conda_setup="$('/Users/koyoarai/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/koyoarai/opt/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/koyoarai/opt/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/koyoarai/opt/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # Add conda environment to PATH if it exists
    if [ -d "/Users/koyoarai/opt/anaconda3/envs/ca/bin" ]; then
        export PATH="/Users/koyoarai/opt/anaconda3/envs/ca/bin:$PATH"
    fi
fi

# Environment managers (only if installed)
if [ -d "$HOME/.nodenv" ]; then
    export PATH="$HOME/.nodenv/bin:$PATH"
    eval "$(nodenv init -)"
fi

if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Flutter paths
export PATH="$PATH:/Users/koyoarai/Documents/dev/flutter/bin"
export PATH=~/Documents/flutter/bin:$PATH

# Homebrew sbin
export PATH="/opt/homebrew/sbin:$PATH"

# Android SDK
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# zplug settings
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "wbinglee/zsh-wakatime"
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "ascii-soup/zsh-url-highlighter"
zplug "voronkovich/mysql.plugin.zsh"
zplug "marzocchi/zsh-notify"
zplug "oknowton/zsh-dwim"
zplug load

# Prompt settings
if [ $UID -eq 0 ]; then
    PROMPT="(^-^)ﾆｺ🍁 %F{red}%n:%f%F{green}%d%f %% "
else
    PROMPT="(^-^)ﾆｺ🍁 %F{cyan}%n:%f%F{green}%d%f %% "
fi

# Git branch display
function rprompt-git-current-branch {
    local branch_name st branch_status

    if [ ! -e  ".git" ]; then
        return
    fi
    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        branch_status="%F{green}"
    elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
        branch_status="%F{red}?"
    elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
        branch_status="%F{red}+"
    elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
        branch_status="%F{yellow}!"
    elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
        echo "%F{red}!(no branch)"
        return
    else
        branch_status="%F{blue}"
    fi
    echo "${branch_status}[$branch_name]"
}

setopt prompt_subst
RPROMPT='`rprompt-git-current-branch`'

# Utility functions
function kpp {
    kill -9 $(lsof -t -i :$1)
}

# General settings
export LC_ALL=en_US.UTF-8
setopt print_eight_bit
setopt extended_glob
setopt globdots
setopt auto_param_slash
setopt mark_dirs
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments
setopt complete_in_word
setopt always_last_prompt
setopt brace_ccl

# Completion settings
autoload -U compinit
compinit
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' use-cache true
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# Key bindings
bindkey "^I" menu-complete
cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
zle -N cheat-sheet
bindkey "^[^h" cheat-sheet
git-cheat () { zle -M "`cat ~/zsh/git-cheat.conf`" }
zle -N git-cheat
bindkey "^[^g" git-cheat

# Colors
autoload colors
colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Display useful commands cheat sheet at startup
echo "\033[0;33m=== Useful Commands ===\033[0m"
echo "\033[0;36mkpp [port]\033[0m - Kill process running on specified port"
echo "Example: kpp 3000"
