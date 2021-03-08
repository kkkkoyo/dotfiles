# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}

eval "$(pyenv init -)"

# コメント機能を有効にする
setopt interactivecomments

# 謎のやつ
alias python=python3

#zsh-syntax-highlighting

source ~/.zplug/init.zsh
 
zplug "zsh-users/zsh-syntax-highlighting", defer:2
 
if ! zplug check --verbose; then
    printf "インストールしますか？[y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
 
zplug load

# vcCodeの設定
# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi
# vscodeの設定


# ここはプロンプトの設定なので今回の設定とは関係ありません
if [ $UID -eq 0 ];then
# ルートユーザーの場合
PROMPT="(^-^)ﾆｺ🍁 %F{red}%n:%f%F{green}%d%f %% "
else
# ルートユーザー以外の場合
PROMPT="(^-^)ﾆｺ🍁 %F{cyan}%n:%f%F{green}%d%f %% "
fi


# flutter
export PATH=~/Documents/flutter/bin:$PATH

# 🍣
opening_comment=(こんにちはー 今日も1日頑張るぞ やっほー)
echo $opening_comment[2] |echo-sd -s

# 🍣

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 名前で色を付けるようにする
autoload colors
colors

# vimをアップデートして言語のwarningが出たのでその対策
export LC_ALL=en_US.UTF-8


# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 補完に関するオプション
# http://voidy21.hatenablog.jp/entry/20090902/1251918174
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす

setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示

setopt print_eight_bit  #日本語ファイル名等8ビットを通す
setopt extended_glob  # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots # 明確なドットの指定なしで.から始まるファイルをマッチ

bindkey "^I" menu-complete   # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)

# 色の定義
local RED=$'%{^[[1;31m%}'$
local GREEN=$'%{^[[1;32m%}'$
local YELLOW=$'%{^[[1;33m%}'$
local BLUE=$'%{^[[1;34m%}'$
local PURPLE=$'%{^[[1;35m%}'$
local LIGHT_BLUE=$'%{^[[1;36m%}'$
local WHITE=$'%{^[[1;37m%}'$

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true

# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# apt-getとかdpkgコマンドをキャッシュを使って速くする
zstyle ':completion:*' use-cache true

# ディレクトリを切り替える時の色々な補完スタイル
#あらかじめcdpathを適当に設定しておく
cdpath=(~ ~/myapp/gae/ ~/myapp/gae/google_appengine/demos/)
# カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補に出す
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
#cd は親ディレクトリからカレントディレクトリを選択しないので表示させないようにする (例: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# cheat-sheet
cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
zle -N cheat-sheet
bindkey "^[^h" cheat-sheet

git-cheat () { zle -M "`cat ~/zsh/git-cheat.conf`" }
zle -N git-cheat
bindkey "^[^g" git-cheat






# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''


# 補完候補カラー
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2
# 補完候補カラー


# https://qiita.com/akashima/items/bdcde778644086533adeのやつ

source ~/.zplug/init.zsh

zplug "wbinglee/zsh-wakatime"

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# program
zplug "voronkovich/mysql.plugin.zsh"

# tools
zplug "marzocchi/zsh-notify"
zplug "oknowton/zsh-dwim"

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# nodenvの設定
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"


# rbenvにパスを通す
# https://qiita.com/Alex_mht_code/items/d2db2eba17830e36a5f1
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"


# 末尾設定
eval "$(pyenv init -)"
