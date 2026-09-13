# Dotfiles

On a supported Linux machine (Debian/Ubuntu, Fedora/RHEL, or Arch), clone
this repository and run from its directory:

```bash
./install.sh
source ~/.bashrc
```

The installer uses Homebrew to install/update the packages in `brewfile`,
installs the bundled JetBrains Mono Nerd Font and Codex, creates the dotfile
symlinks, and sets up GitHub authentication if needed. Codex is not launched.
It can be run regardless of where the repository was cloned.

After installation, run `source ~/.bashrc` to load the updated configuration
in your current shell.

On WSL, Bash and the installer set `BROWSER` to Windows' built-in
`rundll32.exe url.dll,FileProtocolHandler` when the executable is available.
This opens web links in Windows' default browser (for example, Chrome). 
Windows executable interop and Windows directories in `PATH` must be enabled. 
Try `xdg-open https://example.com` after loading your Bash configuration.

Select **JetBrainsMono Nerd Font Mono** in your terminal's font settings.
For SSH sessions, select/install the font on the machine running the terminal.

`dotlink.sh --create` links the managed dotfiles and individual entries in
`~/.config`. Existing conflicting files/directories are
backed up beside their originals. Repeating the command is safe. Older setups
that link the whole `.config` directory continue to work.
`--remove` removes only matching repository symlinks; it does not restore backups.

## tmux

tmux provides terminal multiplexing.

Start a named session with `tmux new -s work`. The prefix is **Ctrl+Space**:
press those keys together, release them, then press the command key below.

| Keys after Ctrl+Space | Action |
| --- | --- |
| `c` | Create a window |
| `n` / `p` | Next / previous window |
| `w` | Choose a window |
| `%` | Split into left/right panes |
| `"` | Split into top/bottom panes |
| Arrow key | Move between panes |
| `z` | Toggle zoom for the current pane |
| `[` | Enter scroll mode; use arrows/Page Up/Page Down, then `q` to leave |
| `d` | Detach, leaving programs running |
| `?` | Show key bindings; press `q` to leave |

Outside tmux, use `tmux ls` to list sessions and `tmux attach -t work` to
rejoin one. Type `exit` in a pane to close its shell; closing the last pane
closes its window, and closing the last window ends the session.

Press Ctrl+Space twice to send a literal
Ctrl+Space to the program inside tmux. 

## Prompt

All Bash settings, aliases, and functions live in `.bashrc`. `.bash_profile`
only loads that file for login shells. After editing `.bashrc`, run
`source ~/.bashrc` or open a new terminal. Running `dotlink.sh --create` also
removes obsolete repo symlinks for `.bash_functions` and `.bash_path`.

`.config/starship.toml` customizes Starship's Gruvbox Rainbow preset:

- Username, SSH hostname, shortened directory path with the repository root highlighted.
- Git branch or detached commit, change counts, ahead/behind counts, and merge/rebase state.
- Relevant language versions, Python virtual environment, Conda/Pixi and Docker context.
- Command duration after two seconds, background job count, and nonzero exit status.
- A 24-hour clock and a second-line prompt colored by command success.
