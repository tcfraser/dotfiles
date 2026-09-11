# Login shells use the same configuration as other interactive Bash shells.
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
