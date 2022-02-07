#!/bin/zsh
STATUSFILE=$XDG_CONFIG_HOME/waybar/mako.status

touch $STATUSFILE
state=$(cat $STATUSFILE)

if [ "$state" = "s" ]; then
    icon=''
    stateshow="suppress"
elif [ "$state" = "d" ]; then
    icon=''
    stateshow="default"
else
    makoctl set-mode default
    echo -n 'd' >$STATUSFILE
    icon=''
    stateshow="default"
fi

queues=$(makoctl list | jq '.data[] | length')

echo "{\"text\":\"$icon $queues\",\"tooltip\":\"$icon $stateshow - $queues\",\"class\":\"$stateshow\"}"
