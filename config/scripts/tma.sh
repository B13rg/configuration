#!/bin/zsh                                                                                                   

SESSIONNAME="sessionroot"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s $SESSIONNAME -D
    #tmux send-keys -t $SESSIONNAME "~/.tmux/script" C-m 
fi

tmux attach -t $SESSIONNAME
