#!/usr/bin/env bash

# Link only repo-managed files; preserve unrelated machine configuration.
DOTFILE_PATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
CONFIG_HOME="$HOME/.config"
isRemoving=false
isCreating=false
isLoading=false

if [ $# -eq 0 ]; then
    echo "Usage: $0 [-r|--remove] [-c|--create] [-l|--load]"
    exit 1
fi
for key in "$@"; do
    case "$key" in
        -r|--remove) isRemoving=true ;;
        -c|--create) isCreating=true ;;
        -l|--load) isLoading=true ;;
        *) echo "Unknown option: $key" >&2; exit 1 ;;
    esac
done

manage_link() {
    local source_path="$1" target_path="$2" backup_path
    if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
        if [ "$isRemoving" = true ]; then
            unlink "$target_path" || return
        else
            return 0
        fi
    fi
    if [ "$isCreating" = true ]; then
        mkdir -p "$(dirname "$target_path")" || return
        if [ -e "$target_path" ] || [ -L "$target_path" ]; then
            backup_path="${target_path}.backup.$(date +%Y%m%d%H%M%S).$$"
            mv "$target_path" "$backup_path" || return
            echo "Backed up $target_path to $backup_path"
        fi
        ln -s "$source_path" "$target_path" || return
        echo "Linked $target_path -> $source_path"
    fi
}

# Remove obsolete links from before the Bash configuration was consolidated.
# Leave any independently maintained files at these paths alone.
for file in .bash_functions .bash_path; do
    if [ -L "$HOME/$file" ] && [ "$(readlink "$HOME/$file")" = "$DOTFILE_PATH/$file" ]; then
        unlink "$HOME/$file" || exit 1
    fi
done

for file in .bash_profile .bashrc .gitconfig .vimrc .hushlogin .vim; do
    manage_link "$DOTFILE_PATH/$file" "$HOME/$file" || exit 1
done

# Existing installations may already link the entire .config directory.
# Keep that working layout; otherwise link individual entries into .config.
if [ -L "$CONFIG_HOME" ] && [ "$(readlink -f "$CONFIG_HOME")" = "$DOTFILE_PATH/.config" ]; then
    if [ "$isRemoving" = true ]; then
        unlink "$CONFIG_HOME" || exit 1
    fi
fi
if [ ! -L "$CONFIG_HOME" ] || [ "$(readlink -f "$CONFIG_HOME")" != "$DOTFILE_PATH/.config" ]; then
    for config in "$DOTFILE_PATH"/.config/*; do
        manage_link "$config" "$CONFIG_HOME/$(basename "$config")" || exit 1
    done
fi

if [ "$isLoading" = true ]; then
    source "$HOME/.bash_profile"
    echo "Open a new terminal or run 'source ~/.bashrc' to update your current shell."
fi
