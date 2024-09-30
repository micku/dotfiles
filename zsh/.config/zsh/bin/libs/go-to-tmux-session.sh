#!/bin/sh

project_path=$1
session_name=$(echo $project_path | awk -F "/" '{print $NF}')

tmux has-session -t $session_name  > /dev/null 2>&1
if [ $? != 0 ]
then
    if [ -d "$project_path/master" ]
    then
        project_path="$project_path/master" 
    fi
    tmux new-session -s $session_name -c $project_path -d
    tmux rename-window -t "$session_name:1" shell
    tmux new-window -a -t "$session_name:1" -c $project_path -n master
    tmux send-keys -t "$session_name:2" C-z 'nvim' Enter
fi
tmux switch-client -t $session_name
