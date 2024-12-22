
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:/usr/local:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export EDITOR=nvim
export NVIMINIT='~/.config/nvim/init.lua'

# Load user-specific bash completions
if [ -d ~/dotfiles/bash_completion.d ]; then
    for bcfile in ~/dotfiles/bash_completion.d/* ; do
        [ -f "$bcfile" ] && . "$bcfile"
    done
fi

# プロンプトに各種情報を表示
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

############### ターミナルのコマンド受付状態の表示変更
# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $
# カラフルなプロンプト設定
export PS1='\n\[\e[1;32m\]\u@\H |\[\e[1;96m\]\w\n\[\e[1;33m\]\t (\[\e[1;36m\]\!)\[\e[1;35m\]$(__git_ps1) \[\e[1;37m\]$ '
#重複Historyを削除
export HISTCONTROL=ignoredups
#Historyに実行時間も表示
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';

export HISTCONTROL=ignorespace        # 空白から始めたコマンドを無視
export HISTIGNORE="fg*:bg*:history*"  # Historyに表示しないコマンド
export HISTTIMEFORMAT                 # Historyに時刻を表示
alias sudo='sudo -E'                  # sudoでも環境を引き継ぐ
alias cl='clear'
alias vim="nvim"
alias vis="nvim -S ~/.vim.session"
alias gc='git checkout'
alias gs='git status'
alias gb='git branch'
alias gsb='git status && git branch'
alias gti='git'
alias g='git'
alias gcfr='git checkout master&& git fetch -p&& git rebase origin/master'
alias glf='git log --oneline --decorate --graph --branches --tags --remotes'

# tmuxを256色に
export TERM=screen-256color
# LSColor Generator
# https://geoff.greer.fm/lscolors/
alias l='ls -alF --color=auto'
alias ls='ls --color=auto'
LS_COLORS='di=36:ln=35:so=36:pi=33:ex=32:bd=36:cd=36;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export LS_COLORS

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ $SSH_AUTH_SOCK != $HOME/.ssh/sock && -S $SSH_AUTH_SOCK ]] \
    && ln -snf "$SSH_AUTH_SOCK" "$HOME/.ssh/sock" \
    && export SSH_AUTH_SOCK="$HOME/.ssh/sock"
. "$HOME/.deno/env"