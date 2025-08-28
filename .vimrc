" turns filetype detection ON (see ~/.vim/ftplugin)
" https://www.gilesorr.com/blog/vim-ftplugin.html
filetype plugin indent on
syntax on

"" [vim-plug] declared list of plugins
" Plugins will be downloaded under the specified directory.
call plug#begin()

" Allows certain plugin commands to be faithfully repeated using .
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'andymass/vim-matchup'
Plug 'bfrg/vim-c-cpp-modern'
Plug 'tikhomirov/vim-glsl'
"Plug 'romainl/vim-cool' " removes search highlights after searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"" General
set number                      " Show line numbers
set wrap
set linebreak                   " Break lines at word
set breakindent                 " Break lines with leading indentations
set showbreak=⤷                 " Wrap-broken line prefix
set textwidth=0                 " Line wrap (number of cols)
set showmatch                   " Highlight matching brace
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1 " vimtex option to speed up matches while navigating
let g:vimtex_indent_on_ampersands = 0 " disables auto alignment of apersands

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

"set hlsearch                   " Highlight all search results
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

"" Better substitute: handles literal search and replace
" change next literal occurrence of the selection, then use '.' to repeat
xnoremap <silent> <leader>c "zy:let @/ = '\V' . escape(@z, '\\/')<CR>cgn
" change all literal occurrences of the selection
xnoremap <silent> <leader>C "zy:let @/ = '\V' . escape(@z, '\\/')<CR>:execute '%s/' . '/' . escape(input('Replace with: '), '/\&~') . '/g'<CR>
" next literal occurrence (no change)
xnoremap <silent> <leader>n "zy:let @/ = '\V' . escape(@z, '\\/')<CR>ngn
" previous literal occurrence (no change)
xnoremap <silent> <leader>N "zy:let @/ = '\V' . escape(@z, '\\/')<CR>NgN

"" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"quickly use fzf pluggin features with ctrl-p
nnoremap <C-p> :GFiles<CR>


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

let g:airline#extensions#tabline#enabled = 1

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
"
set timeoutlen=500 ttimeoutlen=0 "Reduced delay for checking multi-keystrokes

"" Advanced
set ruler                       " Show row and column ruler information
set undolevels=1000             " Number of undo levels

"" https://stackoverflow.com/questions/9850360/what-is-netrwhist
let g:netrw_dirhistmax = 0 "in order to stop generating a .netrwhist file.

"" Options for vimtex

"" === VimTex Compiler ===
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 0,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

""" === Sioyek Viewer ===
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'bash'
let g:vimtex_view_general_options = '~/dotfiles/sioyek-wsl-forward-inverse.sh @pdf @tex @line @col'
