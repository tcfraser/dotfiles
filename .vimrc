"" General
set number                      " Show line numbers
" set linebreak                 " Break lines at word (requires Wrap lines)
set showbreak=--->              " Wrap-broken line prefix
set textwidth=0                 " Line wrap (number of cols)
set showmatch                   " Highlight matching brace
 
set hlsearch                    " Highlight all search results
set incsearch                   " Searches for strings incrementally
 
set autoindent                  " Auto-indent new lines
set expandtab                   " Use spaces instead of tabs
set shiftwidth=4                " Number of auto-indent spaces
set smartindent                 " Enable smart-indent
set smarttab                    " Enable smart-tabs
set softtabstop=4               " Number of spaces per Tab

set background=dark             " Ensure dark colorscheme is used.
colorscheme gruvbox             " Colorscheme selection

set showmode                    " Show current mode in command-line
set scrolloff=999               " Ensures that the cursor is always in middle of screen
set listchars=eol:$,tab:>-,trail:~,extends:»,precedes:« " Show certain hidden characters
set list                        " Activates the listchars, set nolist to deactivate

"" Status Line
set laststatus=2                " Permanently enables the statusline

"" Unmap the arrow keys
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

"" Easier way to leave insert mode
imap jj <Esc>
set timeoutlen=500 "Reduced delay for checking multi-keystrokes

"" Advanced
set ruler                       " Show row and column ruler information

set undolevels=1000             " Number of undo levels


"" Hybrid line numbering by https://github.com/jeffkreeftmeijer/vim-numbertoggle
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let g:netrw_dirhistmax = 0 "in order to stop generating a .netrwhist file.
"" https://stackoverflow.com/questions/9850360/what-is-netrwhist
