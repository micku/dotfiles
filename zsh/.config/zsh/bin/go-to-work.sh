#!/bin/sh

pwd="$(dirname "$0")"

projects_list=~/dev/work/*/**

# Using `ls` prevents misbehaving with paths containing spaces
if [ "$TMUX" = "" ]
then
    project=$(ls -d $projects_list | fzf --height ~40% --layout reverse --with-nth=-1 --delimiter=/)
else
    project=$(ls -d $projects_list | fzf --tmux center --with-nth=-1 --delimiter=/)
fi

if [ -n "$project" ]
then
    "$pwd/libs/go-to-tmux-session.sh" $project
fi
