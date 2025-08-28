#!/bin/bash
# Converts WSL paths to Windows paths and calls the pdf viewer Sioyek
PDF_WIN=$(wslpath -w "$1")
TEX_WIN=$(wslpath -w "$2")
LINE="$3"
COLUMN="$4"
"sioyek.exe" --forward-search-file "$TEX_WIN" --forward-search-line "$LINE" --forward-search-column "$COLUMN" "$PDF_WIN"
# for inverse search using line number copying, I use
# inverse_search_command "powershell" "-command" "$args = '%1:%2'.Split(':'); Set-Clipboard $args[2]"
# in the prefs.config of sioyek
