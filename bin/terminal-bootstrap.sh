#!/bin/bash
# Use this to bootstrap a terminal into a tmux session named main
# If the session does not exist, create it
# If the session does exist and is not attached, attach it
# Otherwise start a new terminal session

tmux_line=$(tmux list-sessions | grep "^main:")
tmux_exists=$?

if [ $tmux_exists -eq 0 ]
then
    echo $tmux_line | grep "attached" > /dev/null
    tmux_attached=$?

    if [ $tmux_attached -eq 0 ]
    then
        # Main session already attached
        bash
    else
        # Main session detached - connect to it
        tmux attach-session -t main
    fi
else
    # No main sessino, create it now
    tmux new-session -s main
fi
