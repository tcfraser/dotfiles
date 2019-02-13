# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# source the bash path if it exists
if [ -f "${HOME}/.bash_path" ] ; then
  source "${HOME}/.bash_path"
fi

# source the bash functions if it exists
if [ -f "${HOME}/.bash_functions" ] ; then
  source "${HOME}/.bash_functions"
fi