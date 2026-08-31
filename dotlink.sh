#!/bin/bash

# resolves the full path to here the dotfiles repo was cloned
DOTFILE_PATH=$(dirname "$(readlink -f "$0")")

# parsing the options (either verbose or terse)
if [ $# -eq 0 ] ; then
    echo "Error: no input options detected."
    echo "  -r|--remove    Removes any existing symlinks."
    echo "  -c|--create    Creates symlinks from the dotfiles folder to the home directory."
    echo "  -l|--load      Loads the .bash_profile."
    exit 1
fi
for key in "$@"
do
case $key in
    -r|--remove)
    isRemoving=true
    shift
    ;;
    -c|--create)
    isCreating=true
    shift
    ;;
    -l|--load)
    isLoading=true
    shift
    ;;
esac
done

# DOT_FILE_SELECTOR=.[^.]* # starts with a '.' and then is followed by something that is not '.' and then anything else.

FILE_SELECTOR=".bash_profile
.bash_functions
.bash_path
.bashrc
.gitconfig
.vimrc
.hushlogin
"

FOLDER_SELECTOR=".vim
.config"

if [ "$isRemoving" = true ] ; then
    echo "[ Removing old links ]"
    for file in $FILE_SELECTOR
    do
        rm -f "$HOME/$file"
        echo -e "Removed $HOME/$file"
    done
    for folder in $FOLDER_SELECTOR
    do
        rm -rf "$HOME/$folder"
        echo -e "Removed $HOME/$folder"
    done
fi

if [ "$isCreating" = true ] ; then
    echo "[ Creating Symbolic Links ]"
    for file in $FILE_SELECTOR
    do
        ln -sfv "$DOTFILE_PATH/$file" "$HOME/$file"
        echo -e "Created symlink $HOME/$file -> $DOTFILE_PATH/$file"
    done
    for folder in $FOLDER_SELECTOR
    do
        ln -sv "$DOTFILE_PATH/$folder" "$HOME/$folder"
        echo -e "Created symlink $HOME/$folder -> $DOTFILE_PATH/$folder"
    done
fi

if [ "$isLoading" = true ] ; then
    echo "[ Loading new links ]"
    source "$HOME/.bash_profile"
    echo "sourced $HOME/.bash_profile"
fi
