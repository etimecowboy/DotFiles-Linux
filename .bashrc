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
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

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
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability.
#
# Turned off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

force_color_prompt=yes

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

# customized prompt
# REF: http://www.askapache.com/linux/bash-power-prompt.html
# export PROMPT_COMMAND='export H1="`history 1|sed -e "s/^[\ 0-9]*//; s/[\d0\d31\d34\d39\d96\d127]*//g; s/\(.\{1,50\}\).*$/\1/g"`";history -a;echo -e "sgr0\ncnorm\nrmso"|tput -S'
# export PS1='\n\e[1;30m[\j:\!\e[1;30m]\e[0;36m \T \d \e[1;30m[\e[1;34m\u@\H\e[1;30m:\e[0;37m`tty 2>/dev/null` \e[0;32m+${SHLVL}\e[1;30m] \e[1;37m\w\e[0;37m\[\033]0;[ ${H1}... ] \w - \u@\H +$SHLVL @`tty 2>/dev/null` - [ `uptime` ]\007\]\n\[\]\$ '

# export PROMPT_COMMAND='echo -en "\033[m\033[38;5;2m"$(( `sed -n "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"\033[38;5;22m/"$((`sed -n "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"' \
# export PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '

# terminix config fixes
if [ $TERMINIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
# On Ubuntu (16.04 or 16.10), a symlink is probably missing. You can create it with:
# ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# powerline
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bindings/bash/powerline.sh
fi


# set PATH so it includes user's private bin if it exists
# already in ~/.profile
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# for installed py packages
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if [ -d "$HOME/.emacs.d/bin" ] ; then
#     PATH="$HOME/.emacs.d/bin:$PATH"
# fi
# if [ -d "$HOME/.emacs.d/bin/lin64" ] ; then
#     PATH="$HOME/.emacs.d/bin/lin64:$PATH"
# fi

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

# New in debian-testing (jessie)
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Editors
export ALTERNATE_EDITOR='emacs -nw'
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export PAGER='less'

# Browser
if [ -n "$DISPLAY" ]; then
    export BROWSER='firefox'
else
    export BROWSER='w3m'
fi

# Use script in ~/bin =====> for use in matlab command mode
alias et='emacsclient -tc'
alias ec='emacsclient -c'
# English locale leads to the dysfunction of im (fcitx) in X LC_CTYPE
# should be set when starting the daemon. If the locale already been
# set as zh_CN.UTF-8 then, don't set it here.
# alias emacs='LC_CTYPE=zh_CN.UTF-8 emacs --debug-init'
# alias em='LC_CTYPE=zh_CN.UTF-8 emacs --daemon' # swith im problem
## Already using zh_CN locale
alias emacs='emacs --debug-init'
alias em='emacs --daemon' # swith im problem

alias ek="emacsclient -e '(client-save-kill-emacs)'"
# alias emacs='export LC_CTYPE=zh_CN.UTF-8;emacs --debug-init'
# alias em='export LC_CTYPE=zh_CN.UTF-8;emacs --daemon' # swith im problem
alias ee='emacs -nw -q'
# alias vi='emacsclient -tc' # Use emacs instead of vi
# alias today="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"d\")' 2> /dev/null | less"
# alias week="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"a\")' 2> /dev/null | less"

# export LC_CTYPE=zh_CN.UTF-8 # moved to ~/.profile

# Matlab
alias mat='matlab -nodesktop -nosplash'
alias matlab='matlab -desktop'
export COMPUTERNAME='zbox' # added for matlab getenv function
export USERNAME='xin' # added for matlab getenv function

# urxvt
alias urxvt='urxvtcd'

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

# Run fbterm after log in tty for Chinese display
# Note: fbterm displays not very good now. Don't start it until it is necessary by fb
# solution 1: use DISPLAY env var
# [[ $(tty) == \/dev\/tty[0-9]* ]] && env DISPLAY=:0 fcitx-fbterm-helper
# solution 2: use -d switch of fcitx-fbterm-helper
# [[ $(tty) == \/dev\/tty[0-9]* ]] && fcitx-fbterm-helper -d 0
# alias fb='env DISPLAY=:0 fcitx-fbterm-helper'
# alias fl='fcitx-fbterm-helper -l'
# alias fb='LC_ALL=zh_CN.UTF-8 fbterm -i fbterm_ucimf --font-names "Noto Sans Mono CJK SC Regular"'
alias fb='LC_ALL=zh_CN.UTF-8 fbterm -i fbterm_ucimf'

# Git prompt
# file does not exist
# source /usr/share/git/completion/git-prompt.sh

# jabref
# alias jabref='java -jar ~/.emacs.d/bin/JabRef-2.10.jar'
# alias jabref='java -jar ~/bin/JabRef-3.8.jar'
# alias jabref='java -jar ~/bin/JabRef-4.0.jar'

if [ -n "$DISPLAY" ]; then
    # Turn off system bell in Xorg
    xset b off
    # Remap keyboard, NOTE: when using mate or gnome2, the remap can be done by keyboard config
    setxkbmap -option "altwin:ctrl_alt_win"
    setxkbmap -option "altwin:ctrl_win"
fi


# Safe rm use trash-cli
# alias rm='trash'

# fix wrong window button display on xfce4-panel after computer wakes up from sleep
# xfce4-panel -r

# Use parallel compressor and decompressor
# choices:
# a) lbzip2
# b) pbzip2
# c) pigz
# d) pxz
# alias tar='tar -I lbzip2'

# tmuxinator
# NOTE: not used any more
# copy from tmuxinator/completion/tmuxinator.bash
# _tmuxinator() {
#     COMPREPLY=()
#     local word
#     word="${COMP_WORDS[COMP_CWORD]}"

#     if [ "$COMP_CWORD" -eq 1 ]; then
#         local commands="$(compgen -W "$(tmuxinator commands)" -- "$word")"
#         local projects="$(compgen -W "$(tmuxinator completions start)" -- "$word")"

#         COMPREPLY=( $commands $projects )
#     elif [ "$COMP_CWORD" -eq 2 ]; then
#         local words
#         words=("${COMP_WORDS[@]}")
#         unset words[0]
#         unset words[$COMP_CWORD]
#         local completions
#         completions=$(tmuxinator completions "${words[@]}")
#         COMPREPLY=( $(compgen -W "$completions" -- "$word") )
#     fi
# }
# complete -F _tmuxinator tmuxinator mux
# alias mux='tmuxinator'

# tmux
alias muxk='tmux kill-server'
alias muxa='tmux attach'
alias muxt='tmux attach -t'

# mplayer: multithread support
# TODO: test
alias mplayer='mplayer -lavdopts threads=N'

# tightvnc
alias vncs='vncserver :1 -geometry 1280x800 -depth 24 -compatiblekbd'
alias vnck='vncserver -kill :1'

# Moved to ~/.profile
# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# xiki
# [ -f ~/.xsh ] && source ~/.xsh
# kaldi ASR
# [ -f ~/src/kaldi/tools/env.sh ] && source ~/src/kaldi/tools/env.sh

# python virtual environments
# FIXME: disable this part to supress errors on sony s13.
######## virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs   # optional
# # export PROJECT_HOME=$HOME/projects      # optional
# # source /usr/local/bin/virtualenvwrapper.sh
# # use python3 with virtualenvwrapper
# VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3' # This needs to be placed before the virtualenvwrapper command
# source /usr/local/bin/virtualenvwrapper.sh
######## pyenv
# export PATH="/home/xin/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Python jupyter notebook server
alias jss='jupyter notebook --no-browser --notebook-dir=~/work/jupyter &'
alias jsk='kill $(pgrep jupyter)'

function jnp() {
    # sudo:
    #   jupyter-nbextension install rise --py --sys-prefix
    #   jupyter-nbextension enable rise --py --sys-prefix
    jupyter-nbconvert $1 --to slides --post serve
}

# Upgrade Python pip packages
# alias pip2up='sudo -H pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U'
# alias pip3up='sudo -H pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U'
