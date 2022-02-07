#!/bin/zsh
STATUSFILE=$XDG_CONFIG_HOME/waybar/mako.status

touch $STATUSFILE
state=`cat $STATUSFILE`

if [ "$state" = "d" ]; then
    makoctl set-mode suppress
    echo -n 's' > $STATUSFILE
else
    makoctl set-mode default
    echo -n 'd' > $STATUSFILE
fi
