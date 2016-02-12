#!/bin/bash
export CYGWIN="winsymlinks:native"
DOT_FILES=~/dotfiles/*.dotfile
for filename in $DOT_FILES
do
    noext=${filename%.*}    # Removes extension
    basename=${noext##*/}   # Removes path
    targetdotfile=$filename
    linkname=~/.$basename
    ln -sf $targetdotfile $linkname
    echo "Gave /dotfiles/"$basename".dotfile the alias /."$basename
done