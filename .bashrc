#!/use/bin/env bash
# Time-stamp: <2023-12-15 Fri 18:08 by xin on tufg>
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

# set as a turecolor term
case "$TERM" in
        iterm   |\
        screen* |\
        tmux*   |\
        xterm*  |\
        uxterm* |\
        kitty*  |\
        foot*  |\
        *-256color )    export COLORTERM=truecolor ;;
    vte*)
esac

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

# My locale settings
unset LANG   # make the following works
unset LANGUAGE # make the following works
unset LC_ALL # make the following works #export LC_ALL=C
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_TIME=C

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
[[ $(tty) == \/dev\/tty[3-6]* ]] && exec fbterm -- bash -c 'TERM=fbterm tmux'
## Test sixel-tmux, not working
# [[ $(tty) == \/dev\/tty[3-6]* ]] && exec fbterm -- bash -c 'TERM=fbterm /home/xin/src/sixel-tmux/tmux

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

# . /usr/share/powerline/integrations/powerline.sh # commented out to use starship shell prompt.

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
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'
alias lt='ls -larth'

# use exa to replace ls
alias li='exa -alFh --icons'
alias lg='exa -alFh --icons --git'
alias lit='exa -larh -t modified --icons'
alias ltree='exa --tree --icons'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Editors
export ALTERNATE_EDITOR='emacs'
# export EDITOR='emacsclient -tc'
# export VISUAL='emacsclient -tc'
export EDITOR='emacsclient'
export VISUAL='emacsclient'
export PAGER='most'

# Browser
if [ -n "$DISPLAY" ]; then
    export BROWSER='google-chrome'
    # export BROWSER='brave'
else
    export BROWSER='w3m'
fi

# Use script in ~/bin =====> for use in matlab command mode
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
alias eq='emacs -nw -q'
alias eQ='emacs -nw -Q'
alias ee="emacsclient -tc"
alias ec="emacsclient -nc"
# alias vi='emacsclient -tc' # Use emacs instead of vi
# alias today="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"d\")' 2> /dev/null | less"
# alias week="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"a\")' 2> /dev/null | less"
# export LC_CTYPE=zh_CN.UTF-8 # moved to ~/.profile
# ## Add cask path
# export PATH="~/.cask/bin:$PATH"
alias spacemacs="emacs --with-profile spacemacs"
alias doomemacs="emacs --with-profile doomemacs"
alias efsemacs="emacs --with-profile efs"
alias lazycatemacs="emacs --with-profile lazycat"
alias spaces="emacs --with-profile spacemacs -daemon"
alias dooms="emacs --with-profile doomemacs -daemon"
alias efss="emacs --with-profile efs -daemon"
alias lazycats="emacs --with-profile lazycat -daemon"

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

# Proxy
# export https_proxy=http://127.0.0.1:7890
# export http_proxy=http://127.0.0.1:7890
# export all_proxy=socks5://127.0.0.1:7890
# Use a universal IP - can be connected by both local and virtual machines
# Don't forget to config Clash server to "allow LAN" in the General tab of "Clash for Windows"
# export https_proxy=http://192.168.0.23:7890
# export http_proxy=http://192.168.0.23:7890
# export all_proxy=socks5://192.168.0.23:7890
export https_proxy=http://192.168.2.2:7890
export http_proxy=http://192.168.2.2:7890
export all_proxy=socks5://192.168.2.2:7890

# Basic setup
export CDPATH=".:~:~/src"
export HISTIGNORE="&:ls:ls *:e[mtc]:emacs:[bf]g:exit"
# export vblank_mode=0 # Boost gpu performance

# Fix errors
#    bash: __bp_precmd_invoke_cmd: command not found
#    bash: __bp_interactive_mode: command not found
# REF: https://superuser.com/questions/1007647/bash-how-to-remove-bp-precmd-invoke-cmd-error
unset PROMPT_COMMAND

# X11 config
if [[ $XDG_SESSION_TYPE = "x11" ]]; then
    # Turn off system bell in X11
    # FIXME: this cause emacs-vterm pop error
    # if [ -n "$DISPLAY" ]; then
    #     xset b off
    # fi

    # Remap keys
    # NOTE: - setxkbmap does not work in wayland
    #       - GUI tools are avaiable in kde, mate, and gnome (gnome-tweaks)
    # remap ctrl to alt, alt to win
    setxkbmap -option "altwin:ctrl_alt_win"
    setxkbmap -option "altwin:ctrl_win"
    # swap caps and escape (vim user's favorite)
    setxkbmap -option "caps:swapescape"
fi

# Git prompt
# file does not exist
# source /usr/share/git/completion/git-prompt.sh

# docker-ce-rootless-extra
# export DOCKER_HOST=unix:///run/user/$UID/docker.sock

# Setting for snap version terminology
# NOT working
# if [[ -d "/sanp/terminology/current" ]]; then
#     export ECORE_IMF_MODULE="fcitx"
#     export XMODIFIERS="@im=none"
#     export PATH="/snap/terminolog/current/usr/bin:$PATH"
# fi

# tmux
alias tmuxk='tmux kill-server'
alias tmuxa='tmux attach'
alias tmuxt='tmux attach -t'

# pbcopy
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# mc
alias mc='. /usr/lib/mc/mc-wrapper.sh'

# xiki
# [ -f ~/.xsh ] && source ~/.xsh

# QT
# export QT_MEDIA_BACKEND=ffmpeg

# imagemagick
# export MAGICK_CONFIGURE_PATH="~/.config/ImageMagick/:/etc/ImageMagick-6/"

# env_parallel
. `which env_parallel.bash`

# neofetch - show system specification, useful for the audience
# neofetch

# shell-color-scripts
# REF: https://gitlab.com/dwt1/shell-color-scripts
# colorscript random

# fortune
# fortune-zh

# kitty terminal
# alias kitty='GLFW_IM_MODULE=ibus kitty'
# # BEGIN_KITTY_SHELL_INTEGRATION
# if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# # END_KITTY_SHELL_INTEGRATION

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

# Poetry
if [ -d "$HOME/.poetry/bin" ] ; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

# NVM
#
# NOTE: NVM is commented out. My bash uses system nodejs by default.
#
# Currently, only emacs packages such as eaf, lsp-bridge, lsp-mode, and etc.,
# use node packages that need to be installed via ~npm install~ commands. I do
# that in a conda virtual environment.
#
# export NVM_DIR="$HOME/.nvm" ;; moved to "~/.profile"
# Load nvm config
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Load nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# rustup
## rustup China mirror
# export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

## Load rustup completion
if [ -f ~/.local/share/bash_completion/completions/rustup ]; then
    . ~/.local/share/bash_completion/completions/rustup
fi

# cargo
export CARGO_HOME="$HOME/.cargo"
[ -s "$CARGO_HOME/env" ] && \. "$CARGO_HOME/env"

## Load cargo completion
if [ -f ~/.local/share/bash_completion/completions/cargo ]; then
    . ~/.local/share/bash_completion/completions/cargo
fi

## starship prompt
eval "$(starship init bash)"

## zellij completion
if [ -f ~/.local/share/bash_completion/completions/zellij ]; then
    . ~/.local/share/bash_completion/completions/zellij
fi

## broot
# source /home/xin/.config/broot/launcher/bash/br
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}

# Go
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
# export PATH="$PATH:$GOPATH/bin"

## LF
### LFCD="~/.config/lf/scripts/lfcd.sh"
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir" || return
            fi
        fi
    fi
}
bind '"\C-o":"lfcd\C-m"'

## fzf

# If fzf is installed by apt install of deb package
# Copy from /usr/share/doc/fzf/README.Debian
# Append this line to ~/.bashrc to enable fzf keybindings for Bash:
# [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && \
#     source /usr/share/doc/fzf/examples/key-bindings.bash

# Append this line to ~/.bashrc to enable fuzzy auto-completion for Bash:
# [ -f /usr/share/doc/fzf/examples/completion.bash ] && \
#     source /usr/share/doc/fzf/examples/completion.bash

# If fzf is installed by the install script in the git repo
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### always use fzf-tmux
alias fzf='fzf-tmux'

FD_OPTS="--follow --exclude '.git' --hidden"  # --exclude node_modules

export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | \
  fd --type f --type l $FD_OPTS"

export FZF_DEFAULT_OPTS="
  --multi --layout=reverse --inline-info
  --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || \
            (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | \
            head -100'
  --preview-window='right:hidden:wrap'
  --bind 'f2:toggle-preview'
  --bind 'alt-t:toggle-preview'
  --bind 'f3:execute(bat --style=numbers --color=always {} || less -f {})'
  --bind 'alt-e:execute(bat --style=numbers --color=always {} || less -f {})'
  --bind 'ctrl-r:reload(eval "$FZF_DEFAULT_COMMAND")'
  --bind 'ctrl-v:half-page-down'
  --bind 'alt-v:half-page-up'
  --bind 'alt-a:select-all+accept'
  --bind 'alt-w:execute-silent(echo {+} | xclip -sel clip)'
  --color 'fg:#7d8590,bg:#30363d,hl:#ffffff'
  --color 'fg+:#e6edf3,bg+:#313f50,hl+:#ffa657'
  --color 'info:#d29922,prompt:#2f81f7,pointer:#a371f7'
  --color 'marker:#3fb950,spinner:#6e7681,header:#495058'
"
export FZF_TMUX_OPTS="-p80%,60%"

### Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_COMMAND="fd $FD_OPTS"
# export FZF_CTRL_T_OPTS="
#   --preview 'bat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -sel clip)+abort'
  --color 'header:italic'
  --header 'Press CTRL-Y to copy command into clipboard'"

### Print tree structure in the preview window
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS"
export FZF_ALT_C_OPTS="
  --preview 'tree -C {}'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -sel clip)+abort'
  --color 'header:italic'
  --header 'Press CTRL-Y to copy path into clipboard'"

### Overriding fzf functions
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd $FD_OPTS . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d $FD_OPTS . "$1"
}

### enable more completions
# usage: _fzf_setup_completion path|dir|var|alias|host COMMANDS...
_fzf_setup_completion path rg ag git kubectl
_fzf_setup_completion dir tree

### define some custom functions

#### fzf + open (xdg-open)
function fo() {
    xdg-open "$(fd --type f $FD_OPTS | fzf)" &
}

#### fzf + kill
function fpk() {
    ps aux | fzf | awk '{print $2}' | xargs kill
}

#### fzf + cd
# - https://github.com/junegunn/fzf/wiki/examples#interactive-cd
function fcd() {
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

#### fzf + tmux
# - https://github.com/junegunn/fzf/wiki/examples#tmux

#### tm
# Create new tmux session, or switch to existing one.
#
# Works from within tmux too. (@bag-man)
#
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

#### fs [FUZZY PATTERN]
# Select selected tmux session
#
#   - Bypass fuzzy finder if there's only one match (--select-1)
#
#   - Exit if there's no match (--exit-0)
fs() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | \
                  fzf --query="$1" --select-1 --exit-0) &&
        tmux switch-client -t "$session"
}

#### fp
# - switch pane (@george-b)
fp() {
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

#### In tmux.conf
# bind-key 0 run "tux split-window -l 12 'bash -ci ftpane'"

### fasd
# NOTE: fasd doesn't work in tty mode
if [ -x "$(command -v fasd)" ]; then
    eval "$(fasd --init auto)"
    # default aliases begin
    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection
    # default aliases end
    alias e='f -e $EDITOR'   # quick opening files with emacs
    alias m='f -e smplayer'  # quick opening files with smplayer
    alias o='a -e xdg-open'  # quick opening files with xdg-open
    _fasd_bash_hook_cmd_complete e m o
fi

#### fzf + fasd
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

# HTTP://cdewaka.com/2018/02/07/fasd-for-navigation/
# cd into recent directories
# j() {
#     local dir
#     dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && \
#         cd "${dir}" || return 1
# }

#### View recent f files
v() {
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && \
        $EDITOR "${file}" || return 1
}

#### cd into the directory containing a recently used file
vd() {
    local dir
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && \
        dir=$(dirname "$file") && cd "$dir"
}

#### jump using `fasd` if given argument,
# filter output of `fasd` using `fzf` else
# https://github.com/junegunn/fzf/wiki/examples#with-fasd-1
j(){
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && \
        cd "${dir}" || return 1
}

#### c - browse chrome history
# https://github.com/junegunn/fzf/wiki/examples#google-chrome-os-xlinux
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

#### b - browse chrome bookmark (requires ruby)
# https://github.com/junegunn/fzf/wiki/examples#google-chrome-os-xlinux

#### fzf + locate
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

### fzf + docker
# Select a docker container to start and attach to
# https://github.com/junegunn/fzf/wiki/examples#docker
function fda() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function fds() {
    local cid
    cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker stop "$cid"
}

### fzf + rga
# Search contents in pdf, epub, office docs, zip, tar.gz etc
fzf-rga() {
	  RG_PREFIX="rga --files-with-matches"
	  local file
	  file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				# --preview-window="70%:wrap"
	)" &&
	      echo "opening $file" &&
	      xdg-open "$file"
}

# Emacs
## doom emacs
if [ -d "$HOME/src/doomemacs/bin" ] ; then
    export PATH="$HOME/src/doomemacs/bin:$PATH"
fi

## cask
if [ -d "$HOME/.cask/bin" ] ; then
    export PATH="$HOME/.cask/bin:$PATH"
fi

## try to fix ob-shell warning:
#
# REF: https://stackoverflow.com/questions/11821378/what-does-bashno-job-control-in-this-shell-mean
#
#   bash: cannot set terminal process group (1374396): Inappropriate ioctl for device
#
#   bash: no job control in this shell
#
#   [ Babel evaluation exited with code 0 ]
set -m

# Nix
[ -s "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && \. "$HOME/.nix-profile/etc/profile.d/nix.sh"

## added by Nix installer
# if [ -e /home/xin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/xin/.nix-profile/etc/profile.d/nix.sh; fi
