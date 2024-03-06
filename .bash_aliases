# -- ls ------------------------------------------------------------------------

alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'
alias lt='ls -larth'

# use exa to replace ls
alias li='exa -alFh --icons'
alias lg='exa -alFh --icons --git'
alias lit='exa -larh -t modified --icons'
alias ltree='exa --tree --icons'

# -- Add an "alert" alias for long running commands -----------------------------
# -- Use like so:

# sleep 10; alert

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# -- Emacs -------------------------------------------------------------

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
alias ec="emacsclient"
alias ee="emacsclient -tc"
alias en="emacsclient -nc"
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

# -- Matlab ------------------------------------------------------------

alias mat='matlab -nodesktop -nosplash'
alias matlab='matlab -desktop'

# export COMPUTERNAME='zbox' # added for matlab getenv function
# export USERNAME='xin' # added for matlab getenv function

# -- urxvt --------------------------------------------------------------

# alias urxvt='urxvtcd'

# -- tmux -----------------------------------------------------------------------

alias tmuxk='tmux kill-server'
alias tmuxa='tmux attach'
alias tmuxt='tmux attach -t'

# -- pbcopy ---------------------------------------------------------------------

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# -- mc --------------------------------------------------------------------------

alias mc='. /usr/lib/mc/mc-wrapper.sh'

# -- lf --------------------------------------------------------------------------

# Only works as expected in tmux
alias lfmc='tmux split lf; lf'