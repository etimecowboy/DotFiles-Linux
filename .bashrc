# Time-stamp: <2022-03-13 Sun 14:47 by xin on tufg>
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth
# TO avoid duplicates in multiple shells
export HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Run fbterm after log in tty for Chinese display
# Note: fbterm displays not very good now. Don't start it until it is necessary by fb
# solution 1: use DISPLAY env var
# [[ $(tty) == \/dev\/tty[0-9]* ]] && env DISPLAY=:0 fcitx-fbterm-helper
# solution 2: use -d switch of fcitx-fbterm-helper
# [[ $(tty) == \/dev\/tty[0-9]* ]] && fcitx-fbterm-helper -d 0
# alias fb='env DISPLAY=:0 fcitx-fbterm-helper'
# alias fl='fcitx-fbterm-helper -l'
# Solution[working]: fcitx-front-fbterm, note tty1 and tty2 has been taken by gnome-shell
# [2022-01-24] switched to ibus input method
# [[ $(tty) == \/dev\/tty[3-9]* ]] && fbterm
# [2022-02-08] switched to ucimf input method, and add 256-color support
# REF: https://unix.stackexchange.com/questions/235455/can-fbterm-support-256-colors
# REF: https://gist.github.com/dylon/5281572
# virtual_terminal="$( tty | grep -oE ....$ )"
# case "$virtual_terminal" in
#     tty1|tty2|tty3|tty4|tty5|tty6)
#         exec fbterm -- bash -c 'TERM=fbterm screen'
#         ;;
# esac
# Inspired method: negate a case pattern
# REF: https://unix.stackexchange.com/questions/178832/how-to-negate-a-case-pattern
# NOT working
# virtual_terminal="$( tty | grep -oE ....$ )"
# case "$virtual_terminal" in
# tty1|tty2)
# ;;
# *)
#     exec fbterm -- bash -c 'TERM=fbterm screen'
#     ;;
# esac
# My working method:
# [[ $(tty) == \/dev\/tty[3-6]* ]] && exec fbterm -- bash -c 'TERM=fbterm screen'
[[ $(tty) == \/dev\/tty[3-6]* ]] && exec fbterm -- bash -c 'TERM=fbterm tmux'
# && eval "$(fasd --init auto)" && . /usr/share/powerline/integrations/powerline.sh # run anyway

# powerline-shell
# - https://github.com/b-ryan/powerline-shell
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi
# deb package system integration script
# Only for tty1 and tty2 (Ubuntu Gnome GUI mode)
# [[ $(tty) == \/dev\/tty[012]* ]] && . /usr/share/powerline/integrations/powerline.sh
. /usr/share/powerline/integrations/powerline.sh

# change some default behavior
shopt -s cdspell # correct minor spelling errors in a cd command
shopt -s cmdhist # multi-line commands to be appended to your bash history as a single line command
shopt -s dotglob # allows dot-begin files to be returned in the results of path-name expansion
shopt -s extglob # allows egrep-style extended pattern matching

# preserve bash history in multiple bash shells
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lart'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Editors
export ALTERNATE_EDITOR='emacs -nw'
export EDITOR='emacsclient -ntc'
export VISUAL='emacsclient -ntc'
export PAGER='most'

# Browser
if [ -n "$DISPLAY" ]; then
    export BROWSER='google-chrome'
else
    export BROWSER='w3m'
fi

# Use script in ~/bin =====> for use in matlab command mode
alias ee='emacsclient -tc'
alias ec='emacsclient -c'
# English locale leads to the dysfunction of im (fcitx) in X LC_CTYPE
# should be set when starting the daemon. If the locale already been
# set as zh_CN.UTF-8 then, don't set it here.
# alias emacs='LC_CTYPE=zh_CN.UTF-8 emacs --debug-init'
# alias em='LC_CTYPE=zh_CN.UTF-8 emacs --daemon' # swith im problem
## Already using zh_CN locale
alias emacs='emacs --debug-init'
alias em='emacs --daemon'
alias ek="emacsclient -e '(client-save-kill-emacs)'"
# alias emacs='export LC_CTYPE=zh_CN.UTF-8;emacs --debug-init'
# alias em='export LC_CTYPE=zh_CN.UTF-8;emacs --daemon' # swith im problem
alias eeq='emacs -nw -q'
# alias vi='emacsclient -tc' # Use emacs instead of vi
# alias today="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"d\")' 2> /dev/null | less"
# alias week="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"a\")' 2> /dev/null | less"
# export LC_CTYPE=zh_CN.UTF-8 # moved to ~/.profile
# ## Add cask path
# export PATH="~/.cask/bin:$PATH"

# Matlab
alias mat='matlab -nodesktop -nosplash'
alias matlab='matlab -desktop'
# export COMPUTERNAME='zbox' # added for matlab getenv function
# export USERNAME='xin' # added for matlab getenv function

# urxvt
# alias urxvt='urxvtcd'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Git prompt
# file does not exist
# source /usr/share/git/completion/git-prompt.sh

if [ -n "$DISPLAY" ]; then
    # Turn off system bell in Xorg
    xset b off
    # NOTE: kde, mate, and gnome2 also support remap keys
    setxkbmap -option "altwin:ctrl_alt_win"
    setxkbmap -option "altwin:ctrl_win"
fi

# tmux
alias muxk='tmux kill-server'
alias muxa='tmux attach'
alias muxt='tmux attach -t'

# pbcopy
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# xiki
# [ -f ~/.xsh ] && source ~/.xsh

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Copy from /usr/share/doc/fzf/README.Debian
# Append this line to ~/.bashrc to enable fzf keybindings for Bash:
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
# Append this line to ~/.bashrc to enable fuzzy auto-completion for Bash:
[ -f /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash

# fzf + cd
# - https://github.com/junegunn/fzf/wiki/examples#interactive-cd
function cd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}

# fzf + tmux
# - https://github.com/junegunn/fzf/wiki/examples#tmux

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.
tm() {
    [[ -n "$TMUX" ]] && \
        change="switch-client" || \
            change="attach-session"
    if [ $1 ]; then
        tmux $change -t "$1" 2>/dev/null || \
            (tmux new-session -d -s $1 && \
                 tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | \
                  fzf --exit-0) &&  tmux $change -t "$session" || \
            echo "No sessions found."
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | \
                  fzf --query="$1" --select-1 --exit-0) &&
        tmux switch-client -t "$session"
}

# ftpane - switch pane (@george-b)
ftpane() {
    local panes current_window current_pane target target_window target_pane
    panes=$(tmux list-panes -s -F \
                 '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_pane=$(tmux display-message -p '#I:#P')
    current_window=$(tmux display-message -p '#I')

    target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
        tmux select-pane -t ${target_window}.${target_pane}
    else
        tmux select-pane -t ${target_window}.${target_pane} &&
            tmux select-window -t $target_window
    fi
}
# In tmux.conf
# bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"

# fasd
# NOTE: fasd doesn't work in tty mode
if [ -x "$(command -v fasd)" ]; then
    eval "$(fasd --init auto)"
    alias e='f -e $EDITOR' # quick opening files with emacs
    alias m='f -e smplayer'        # quick opening files with smplayer
    alias o='a -e xdg-open'        # quick opening files with xdg-open
    _fasd_bash_hook_cmd_complete e m o
fi

# fzf + fasd
# https://www.gregorykapfhammer.com/software/tool/productivity/2017/05/08/Directory-Zooming/
# to: first gets a list of all the directories you have recently and
# frequently visited and then passes that program's output to Fzf
t() {
    fasdlist=$( fasd -d -l -r $1 | \
                    fzf --query="$1 " --select-1 --exit-0 \
                        --height=25% --reverse --tac \
                        --no-sort --cycle) && \
        cd "$fasdlist"
}

# https://cdewaka.com/2018/02/07/fasd-for-navigation/
# cd into recent directories
# j() {
#     local dir
#     dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && \
#         cd "${dir}" || return 1
# }
# View recent f files
v() {
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && \
        $EDITOR "${file}" || return 1
}
# cd into the directory containing a recently used file
vd() {
    local dir
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && \
        dir=$(dirname "$file") && cd "$dir"
}

# https://github.com/junegunn/fzf/wiki/examples#with-fasd-1
# jump using `fasd` if given argument,
# filter output of `fasd` using `fzf` else
j(){
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && \
        cd "${dir}" || return 1
}

# https://github.com/junegunn/fzf/wiki/examples#google-chrome-os-xlinux
# c - browse chrome history
c() {
    local cols sep google_history open
    cols=$(( COLUMNS / 3 ))
    sep='{::}'

    if [ "$(uname)" = "Darwin" ]; then
        google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
        open=open
    else
        google_history="$HOME/.config/google-chrome/Default/History"
        open=xdg-open
    fi
    cp -f "$google_history" /tmp/h
    sqlite3 -separator $sep /tmp/h \
            "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
        awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
        fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

# b - browse chrome bookmark (requires ruby)
# https://github.com/junegunn/fzf/wiki/examples#google-chrome-os-xlinux

# fzf + locate
# https://github.com/junegunn/fzf/wiki/examples#locate
# ALT-I - Paste the selected entry from locate output into the command line
# fzf-locate-widget() {
#     local selected
#     if selected=$(locate / | fzf -q "$LBUFFER"); then
#         LBUFFER=$selected
#     fi
#     zle redisplay
# }
# zle     -N    fzf-locate-widget
# bindkey '\ei' fzf-locate-widget

# fzf + docker
# https://github.com/junegunn/fzf/wiki/examples#docker
# Select a docker container to start and attach to
function da() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function ds() {
    local cid
    cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker stop "$cid"
}

export CDPATH=.:~:~/src:~/emacs:~/Desktop~/桌面
export HISTIGNORE="&:ls:ls *:e[mtc]:emacs:[bf]g:exit"
# export vblank_mode=0 # Boost gpu performance

# docker-ce-rootless-extra
# export DOCKER_HOST=unix:///run/user/$UID/docker.sock

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Setting for snap version terminology
# NOT working
# if [[ -d "/sanp/terminology/current" ]]; then
#     export ECORE_IMF_MODULE="fcitx"
#     export XMODIFIERS="@im=none"
#     export PATH="/snap/terminolog/current/usr/bin:$PATH"
# fi

# mc
alias mc='. /usr/lib/mc/mc-wrapper.sh'

# flatpak
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc
