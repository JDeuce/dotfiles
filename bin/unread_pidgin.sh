#!/bin/sh

# script to get count of unread messages from pidgin

export DISPLAY=:0
xwininfo -tree -root | \
    awk '/Pidgin/{system("xprop -id "$1" _PIDGIN_UNSEEN_COUNT")}' | \
    awk -F'= ' '/CARDINAL/{s+=$2;} END { print s }'
