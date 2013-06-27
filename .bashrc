# Time-stamp: <2013-06-28 Fri 00:09 by xin on p5q>

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# I put all my bash setting in this file,
# so that both Red Hat and Debian distributions can use it.

# Files you make look like rw-r-r
#umask 022

######################################################################

# # System-wide .bashrc file for interactive bash(1) shells.

# # To enable the settings / commands in this file for login shells as well,
# # this file has to be sourced in /etc/profile.

# # If not running interactively, don't do anything
# [ -z "$PS1" ] && return

# # check the window size after each command and, if necessary,
# # update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# use_color=false

# # Set colorful PS1 only on colorful terminals.
# # dircolors --print-database uses its own built-in database
# # instead of using /etc/DIR_COLORS.  Try to use the external file
# # first to take advantage of user additions.  Use internal bash
# # globbing instead of external grep binary.
# safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
# match_lhs=""
# [[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
# [[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
# [[ -z ${match_lhs}    ]] \
#     && type -P dircolors >/dev/null \
#     && match_lhs=$(dircolors --print-database)
# [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

# if ${use_color} ; then
#         # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
#     if type -P dircolors >/dev/null ; then
#         if [[ -f ~/.dir_colors ]] ; then
#             eval $(dircolors -b ~/.dir_colors)
#         elif [[ -f /etc/DIR_COLORS ]] ; then
#             eval $(dircolors -b /etc/DIR_COLORS)
#         fi
#     fi

#     if [[ ${EUID} == 0 ]] ; then
#         PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
#     else
#         PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
#     fi

#     alias ls='ls --color=auto'
#     alias grep='grep --colour=auto'
# else
#     if [[ ${EUID} == 0 ]] ; then
#                 # show root@ when we don't have colors
#         PS1='\u@\h \W \$ '
#     else
#         PS1='\u@\h \w \$ '
#     fi
# fi

# # Try to keep environment pollution down, EPA loves us.
# unset use_color safe_term match_lhs

# # Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# # If this is an xterm set the title to user@host:dir
# #case "$TERM" in
# #xterm*|rxvt*)
# #    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
# #    ;;
# #*)
# #    ;;
# #esac

# # enable bash completion in interactive shells
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi

# # if the command-not-found package is installed, use it
# if [ -x /usr/lib/command-not-found ]; then
#   function command_not_found_handle {
#           # check because c-n-f could've been removed in the meantime
#         if [ -x /usr/lib/command-not-found ]; then
#           /usr/bin/python /usr/lib/command-not-found -- $1
#             return $?
#       else
#           return 127
#       fi
#   }
# fi

# /usr/bin/mint-fortune

# if [ "$PS1" ] ; then
#     mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#     echo $$ > /dev/cgroup/cpu/user/$$/tasks
#     echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
# fi

######################################################################
# REF: (@url :file-name "http://www.pixelbeat.org/docs/terminal_colours/" :display "Source")

# .bashrc

# User specific aliases and functions

# Source global definitions
# [ -f /etc/bashrc ] && . /etc/bashrc

#######################################
# user specific environment
#######################################

# for mc, cvs, svn, ...
# export EDITOR=vim

# Use vim to browse man pages. One can use Ctrl-[ and Ctrl-t
# to browse and return from referenced man pages. ZZ or q to quit.
# Note initially within vim, one can goto the man page for the
# word under the cursor by using [section_number]K.
# Note we use bash explicitly here to support process substitution
# which in turn suppresses the "Vim: Reading from stdin..." warning.
# export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" \
#     -c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'
# GROFF_NO_SGR is required with man-db which uses grotty to
# output SGR codes by default when attached to a terminal.
# We want vim to highlight the raw text, so disable that feature.
# Also see MANPAGER in my .vimrc for extra handling to support
# ctrl-[ with man-db
# export GROFF_NO_SGR=1
# Another option is to use $VIMRUNTIME/macros/less.sh
# though I find that less effective

# vim and gnome-terminal have support for 256 colours in fedora 8 at least
# Note debian/ubuntu users need to install the ncurses-term package for this
# Note this should be set in ~/.profile for Fedora startup scripts to
# setup LS_COLORS correctly.
# export TERM=xterm-256color

# setup default search path for python modules.
# Note we add this to the 'path' in .vimrc so the gf
# command will open any .py or .h files etc. in this dir
# export PYTHONPATH=~/pb.o/libs/

# for developing: http://udrepper.livejournal.com/11429.html
# export MALLOC_CHECK_=3
# export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

#######################################
# change app defaults
# Note one can disable an alias for a
# command by running like \command
#######################################

# highlight $HOST:$PWD prompt
# PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '

# Don't store duplicate adjacent items in the history
# HISTCONTROL=ignoreboth

# adjust settings according to current terminal window width
# which may have changed while the last command was running
# (which is a common occurance for vim/less/etc.)
# Note this is already set in /etc/bashrc on Fedora 8 at least.
# shopt -s checkwinsize

# GREP_COLOR=bright yellow on black bg.
# use GREP_COLOR=7 to highlight whitespace on black terminals
# LANG=C for speed. See also: http://www.pixelbeat.org/scripts/findrepo
# alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

# alias ls="BLOCK_SIZE=\'1 ls --color=auto" #enable thousands grouping and colour
# alias minicom='minicom -c on' #enable colour
# alias cal='cal -3' #show 3 months by default
# alias units='units -t' #terse mode
# alias diff='LC_ALL=C TZ=GMT0 diff -Naur' #normalise diffs for distribution
# alias lynx='lynx -force_html -width=$COLUMNS' #best settings for viewing HTML
# alias links='links -force-html' #need to enable colour in config menu manually
# alias xterm='xterm -fb "" -bg black -fg gray -fa "Sans Mono" -fs 9 +sb -sl 3000 -g 80x50+1+1'
# alias sudo='sudo env PATH=$PATH' #work around sudo built --with-secure-path (ubuntu)
# alias vim='vim -X' #don't try to contact xserver (which can hang on network issues)
# alias gdb='gdb -tui -quiet' #enable the text window interface if possible
# alias head='head -n $((${LINES:-12}-2))' #as many as possible without scrolling
# alias tail='tail -n $((${LINES:-12}-2)) -s.1' #Likewise, also more responsive -f

# I hate noise
# set bell-style visible

# Tell less not to beep and also display colours.
# Also don't wrap lines, as less supports horizontal scolling
# export LESS="-QRS"
# Adjust the less highlight colors
# export LESS_TERMCAP_so="$(printf 'rev\nbold\nsetaf 3\n' | tput -S)"
# export LESS_TERMCAP_se="$(tput sgr0)"

# Let me have core dumps
# ulimit -c unlimited

#######################################
# shortcut aliases and functions
#######################################

alias ..="cd .."        #go to parent dir
alias ...="cd ../.."    #go to grandparent dir
# alias -- -="cd -"       #go to previous dir
alias l.='ls -d .*'     #list hidden files
alias ll='ls -lhrt'     #extra info compared to "l"
alias lld='ls -lUd */'  #list directories
alias la='ls -la | more'

# what most people want from od (hexdump)
# alias hd='od -Ax -tx1z -v'

# canonicalize path (including resolving symlinks)
# alias realpath='readlink -f'

# make and change to a directory
md () { mkdir -p "$1" && cd "$1"; }

# print the corresponding error message
# strerror() { python -c "\
# import os,locale as l; l.setlocale(l.LC_ALL, ''); print os.strerror($1)"; }

# quick plot of numbers on stdin. Can also pass plot params.
# E.G: seq 1000 | sed 's/.*/s(&)/' | bc -l | plot linecolor 2
# plot() { { echo 'plot "-"' "$@"; cat; } | gnuplot -persist; }

# highlight occurences of expression
# hili() { e="$1"; shift; grep --col=always -Eih "$e|$" "$@"; }
# Ditto, but user pager ('n' to iterate)
# scan() { e="$1"; shift; less -i -p "*$e" "$@"; }

# Make these functions, common to other languages, available in the shell
# ord() { printf "0x%x\n" "'$1"; }
# chr() { printf $(printf '\\%03o\\n' "$1"); }

##########################################################################

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Fix input method problem in some program
# export LC_CTYPE="zh_CN.UTF-8"

# Emacs related settings
if [ -d "$HOME/.emacs.d/bin/lin64" ] ; then
    PATH="$HOME/.emacs.d/bin/lin64:$PATH"
fi
# Use emacsclient as the default editor
# # For X windows system
# export ALTERNATE_EDITOR="emacs"
# export EDITOR= ecg"
# export VISUAL="ecg"
# alias e='ecg'
# alias et='emacsclient -t'
# alias em='emacs -daemon'
# alias ee='emacs -nw -q'
# alias vi='ecg' # Use emacs instead of vi
# # For text mode
export ALTERNATE_EDITOR="emacs -nw"
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -t"
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias em='emacs -daemon'
alias ee='emacs -nw -q'
alias vi='emacsclient -t' # Use emacs instead of vi

# iBus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# TeXLive
# better solution: create links in /usr/local (better solution)
# if [ -d "/opt/texlive/2011" ] ; then
#     export TEXLIVE="/opt/texlive/2011"
#     MANPATH="$TEXLIVE/texmf/doc/man:$MANPATH"
#     INFOPATH="$TEXLIVE/texmf/doc/info:$INFOPATH"
#     PATH="$TEXLIVE/bin/x86_64-linux:$PATH"
# fi

# Matlab
if [ -d "/opt/MATLAB/R2013a" ] ; then
    # MATLAB="/opt/MATLAB/2013a"
    PATH="/opt/MATLAB/R2013a/bin:$PATH"
    # PATH="$MATLAB/bin/glnxa64:$PATH"
fi

# FPGA settings

fpga () {

    # Xilinx 10.1
    . /opt/Xilinx/10.1/ISE/settings64.sh
    . /opt/Xilinx/10.1/EDK/settings64.sh
    . /opt/Xilinx/10.1/ChipScope/settings64.sh
    . /opt/Xilinx/10.1/PlanAhead/settings64.sh
    # if [ -d "/opt/Xilinx/10.1/ISE" ] ; then
    #     export XILINX="/opt/Xilinx/10.1/ISE"
    # fi
    # Xilinx 13.4
    # . /opt/Xilinx/13.4/ISE_DS/settings64.sh
    # Xilinx 11.1
    # . /opt/Xilinx/11.1/settings64.sh

    # Some system variables
    export XIL_IMPACT_USE_LIBUSB=1
    # export LD_PRELOAD=/usr/local/lib/libusb-driver.so

    # ModelSim
    if [ -d "/opt/Mentor/ModelSim/10.0a_se/modeltech" ] ; then
        export MODELSIM="$HOME/modelsim.ini"
        export MODEL_TECH="/opt/Mentor/ModelSim/10.0a_se/modeltech"
        export MODELSIM_LICENSE_DIR="/opt/Mentor/ModelSim/license"
        export LM_LICENSE_FILE="$MODELSIM_LICENSE_DIR/ModelSim_SE_10.0a.dat"
        export MGLS_LICENSE_FILE="$LM_LICENSE_FILE"
        PATH="$MODEL_TECH/bin:$PATH"
    fi

    # # Fix the secure path in Debian.
    # # sudo uses environment variables of the current user
    # # (@url :file-name "http://stackoverflow.com/questions/257616/sudo-changes-path-why" :display "REF")
    # alias sudo="sudo env PATH=$PATH LD_LIBRARY_PATH=$LD_LIBRARY_PATH LMC_HOME=$LMC_HOME XILINX=$XILINX XILINX_EDK=$XILINX_EDK" # LD_PRELOAD=$LD_PRELOAD"
    }

export PATH
export LD_LIBRARY_PATH

# customized prompt
# REF: http://www.askapache.com/linux/bash-power-prompt.html
export PROMPT_COMMAND='export H1="`history 1|sed -e "s/^[\ 0-9]*//; s/[\d0\d31\d34\d39\d96\d127]*//g; s/\(.\{1,50\}\).*$/\1/g"`";history -a;echo -e "sgr0\ncnorm\nrmso"|tput -S'
export PS1='\n\e[1;30m[\j:\!\e[1;30m]\e[0;36m \T \d \e[1;30m[\e[1;34m\u@\H\e[1;30m:\e[0;37m`tty 2>/dev/null` \e[0;32m+${SHLVL}\e[1;30m] \e[1;37m\w\e[0;37m\[\033]0;[ ${H1}... ] \w - \u@\H +$SHLVL @`tty 2>/dev/null` - [ `uptime` ]\007\]\n\[\]\$ '
