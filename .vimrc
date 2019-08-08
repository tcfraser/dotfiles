" turns filetype detection ON (see ~/.vim/ftplugin)
" https://www.gilesorr.com/blog/vim-ftplugin.html
filetype plugin indent on 
syntax on

"" [vim-plug] declared list of plugins
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'

" Allows certain plugin commands to be faithfully repeated using .
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
" Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"" General
set number                      " Show line numbers

set linebreak                   " Break lines at word
set breakindent                 " Break lines with leading indentations
set showbreak=⤷                 " Wrap-broken line prefix
set textwidth=0                 " Line wrap (number of cols)
set showmatch                   " Highlight matching brace

" Move visually through wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$
vnoremap k gk
vnoremap j gj
vnoremap 0 g0
vnoremap ^ g^
vnoremap $ g$

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
set scrolloff=99                " Ensures that the cursor is always in middle of screen
set listchars=eol:$,tab:>-,trail:~,extends:»,precedes:« " Show certain hidden characters
set list                        " Activates the listchars, set nolist to deactivate

"" Status Line
set laststatus=2                " Permanently enables the statusline

"" Folding option
set foldmethod=indent
set foldlevel=10

"" Completion options
" https://vi.stackexchange.com/questions/11349/ctrl-n-completion-takes-a-long-time-for-scanning-included-file
set complete-=i                 " Removes included files from the default completion sources

"" Unmap the arrow keys
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

"" airline font characters
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

""

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"" Easier way to leave insert mode
" imap jj <Esc>
set timeoutlen=500 ttimeoutlen=0 "Reduced delay for checking multi-keystrokes

"" Advanced
set ruler                       " Show row and column ruler information

set undolevels=1000             " Number of undo levels

"" Hybrid line numbering by https://github.com/jeffkreeftmeijer/vim-numbertoggle
" set number relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

let g:netrw_dirhistmax = 0 "in order to stop generating a .netrwhist file.
"" https://stackoverflow.com/questions/9850360/what-is-netrwhist

"" Options for vimtex
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'process',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-interaction=nonstopmode',
    \   '-synctex=1',
    \   '-pdf',
    \ ],
\}
" let g:vimtex_compiler_latexmk = 1
"let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
" let g:vimtex_view_general_options_latexmk = '-pdf'
