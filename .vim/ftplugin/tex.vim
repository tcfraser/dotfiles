"" Custom latex commands
" See ':help map_bar' for information about the usage of '<bar>'
" compile the .tex document
" nnoremap <buffer> <leader>c :w <CR> :!pdflatex % <CR>
" compile the .tex document and biber bibliography
" nnoremap <buffer> <leader>C :w <CR> :!pdflatex % && biber %:r && pdflatex % && pdflatex % <CR>
" view the compiled .pdf
" nnoremap <buffer> <leader>v :!SumatraPDF %:r.pdf & <CR><CR>
