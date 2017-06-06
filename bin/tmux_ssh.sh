#!/bin/bash

# script which sets my tmux window titles when I ssh

ssh_host=$1


current_title=$(tmux display-message -p "#{window_name}")

if [ "$ssh_host" == "gitlab" ]
then
    # don't let git pushes effect title
    exit
fi

if [ "$current_title" == "bash" ] || [[ "$current_title" == ssh* ]]
then
    tmux rename-window ssh-$ssh_host
fi


