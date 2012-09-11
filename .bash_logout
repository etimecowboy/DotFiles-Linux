# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# Kill emacs
emacsclient --kill

# umount local hard disks
pumount /dev/sdb1
pumount /dev/sdb5
pumount /dev/sdb6
pumount /dev/sdb7
