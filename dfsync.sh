#! /usr/bin/env bash
#
# Author: Brian Nichols <brian.p.nichols@gmail.com>
#
# 
files=("/home/brian/.vimrc" 
       "/home/brian/.zshrc" 
       "/home/brian/.tmux.conf" 
       "/home/brian/.xinitrc")

for file in "${files[@]}"
do
    echo $file
    cp -nipvH "$file" "."
done


       
