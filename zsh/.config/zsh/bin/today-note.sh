#!/bin/sh

path=~/Documents/My\ Brain/
session_name="brain"

tmux has-session -t $session_name > /dev/null 2>&1
if [ $? != 0 ]
then
    # Double quotes arount $path ensure spaces are preserved
    tmux new-session \
        -s $session_name \
        -c "$path" \
        -n notes \
        -d

    tmux send-keys -t "$session_name:1" 'nvim' Enter
fi
tmux switch-client -t $session_name
