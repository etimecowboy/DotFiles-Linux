## oh-my-fish: (switched to use fishman)
### Path to Oh My Fish install.
# set -q XDG_DATA_HOME
#   and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
#   or set -gx OMF_PATH "$HOME/.local/share/omf"

### Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/xin/.config/omf"

### Load oh-my-fish configuration.
# source $OMF_PATH/init.fish

### Load plugins
# set fish_plugins emacs
# set fish_plugins tmux-zen

## Remap keyboard
setxkbmap -option 'altwin:ctrl_alt_win'
setxkbmap -option 'altwin:ctrl_win'

## System path
### Path of pip installed py packages
set PATH $HOME/.local/bin $PATH

## LD_LIRBARY_PATH for c/c++
# set -Ux LD_LIBRARY_PATH '/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64'

## New in debian-testing (jessie), copy from .bashrc maybe not very useful
# colored GCC warnings and errors
# set -Ux GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Language environment
setenv LC_CTYPE 'zh_CN.UTF-8'

## System Editors
setenv ALTERNATE_EDITOR 'emacs -nw'
setenv EDITOR 'emacsclient -tc'
setenv VISUAL 'emacsclient -tc'
# set -Ux ALTERNATE_EDITOR 'emacs -nw'
# set -Ux EDITOR 'emacsclient -tc'
# set -Ux VISUAL 'emacsclient -tc'
# set -gx ALTERNATE_EDITOR 'emacs -nw'
# set -gx EDITOR 'emacsclient -tc'
# set -gx VISUAL 'emacsclient -tc'

## emacs
### add PATH
set PATH $HOME/.emacs.d/bin $HOME/.emacs.d/bin/lin64 $PATH
# Use script in ~/bin =====> for use in matlab command mode
alias et='emacsclient -tc'
alias ec='emacsclient -c'
# English locale leads to the dysfunction of im (fcitx) in X
# LC_CTYPE should be set when starting the daemon.
# alias emacs='export LC_CTYPE=zh_CN.UTF-8;emacs --debug-init'
# function emacs
#     set old_shell $SHELL
#     set SHELL /bin/bash
#     set LC_CTYPE zh_CN.UTF-8
#     command emacs --debug-init
#     set SHELL $old_shell
# end
function emacs
   set -lx SHELL /bin/bash
   # set -lx LC_CTYPE zh_CN.UTF-8
   command emacs --debug-init $argv
end
# alias em='export LC_CTYPE=zh_CN.UTF-8;emacs --daemon' # swith im problem
# function em
#     set old_shell $SHELL
#     set SHELL /bin/bash
#     set LC_CTYPE zh_CN.UTF-8
#     command emacs --daemon --debug-init
#     set SHELL $old_shell
# end
function em
   set -lx SHELL /bin/bash
   # set -lx LC_CTYPE zh_CN.UTF-8
   command emacs --daemon --debug-init $argv
end

alias eq='emacs -nw -q'
alias vi='emacsclient -tc' # Use emacs instead of vi
# alias today="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"d\")' 2> /dev/null | less"
# alias week="emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda \"a\")' 2> /dev/null | less"

## ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## tmux
alias muxk='tmux kill-server'
alias muxa='tmux attach'
alias muxat='tmux attach -t'

## tmuxinator
# copy from /var/lib/gems/$ver$/gems/tmuxinator-$ver$/completion/tmuxinator.fish
# to ~/.config/fish/completions
alias mux='tmuxinator'

## urxvt
alias urxvt='urxvtcd'

## fbterm
# Run fbterm after log in tty for Chinese display
# Note: fbterm displays not very good now. Don't start it until it is necessary by fb
# solution 1: use DISPLAY env var
# [[ $(tty) == \/dev\/tty[0-9]* ]] && env DISPLAY=:0 fcitx-fbterm-helper
# solution 2: use -d switch of fcitx-fbterm-helper
# [[ $(tty) == \/dev\/tty[0-9]* ]] && fcitx-fbterm-helper -d 0
# alias fb='env DISPLAY=:0 fcitx-fbterm-helper'
# alias fl='fcitx-fbterm-helper -l'
alias fb='fcitx-fbterm-helper -d 0 -l'


## Matlab
# REF: https://www.mail-archive.com/fish-users@lists.sourceforge.net/msg03338.html
# function mat
#     set old_shell $SHELL
#     set SHELL /bin/bash
#     command matlab -nodesktop -nosplash
#     set SHELL $old_shell
# end
# function matlab
#     set old_shell $SHELL
#     set SHELL /bin/bash
#     command matlab -desktop -nosplash &
#     set SHELL $old_shell
# end
function mat
   set -lx SHELL /bin/bash
   command matlab -nodesktop -nosplash $argv
end
function matlab
   set -lx SHELL /bin/bash
   command matlab -desktop -nosplash $argv &
end

## Git prompt
# file does not exist
# source /usr/share/git/completion/git-prompt.sh

## jabref
# alias jabref='java -jar ~/.emacs.d/bin/JabRef-2.10.jar'

## rm: safe rm use trash-cli
alias rm='trash'

# tar
# Use parallel compressor and decompressor
# choices:
# a) lbzip2
# b) pbzip2
# c) pigz
# d) pxz
alias tar='tar -I lbzip2'

## mplayer: multithread support
alias mplayer='mplayer -lavdopts threads=N'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# fix wrong window button display on xfce4-panel after computer wakes up from sleep
# xfce4-panel -r

## powerline
### auto setup
set fish_function_path $fish_function_path '/usr/share/powerline/bindings/fish'
### fonts support
# set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
### no need to setup, the pwerline theme will do it
# powerline-setup

## fishmarks
. ~/src/fishmarks/marks.fish
