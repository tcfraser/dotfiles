#!/bin/bash
export CYGWIN="winsymlinks:native"
DOT_FILES=~/dotfiles/*.dotfile
for filename in $DOT_FILES
do
    noext=${filename%.*}    # Removes extension
    basename=${noext##*/}   # Removes path
    targetdotfile=$filename
    linkname=~/.$basename
    rm -f $linkname
    echo "Removing alias /."$basename "from /dotfiles/"$basename".dotfile"
done