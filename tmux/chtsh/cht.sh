#!/usr/bin/env bash
selected=`cat ~/Desktop/dotfiles/tmux/chtsh/.tmux-cht-languages | fzf`
# selected=`cat ~/Desktop/dotfiles/tmux/chtsh/.tmux-cht-languages ~/Desktop/dotfiles/tmux/chtsh/.tmux-cht-command | fzf`
read -p "Enter Query: " query

if grep -qs "$selected" ~/Desktop/dotfiles/tmux/chtsh/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    echo "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
    tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    echo "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
