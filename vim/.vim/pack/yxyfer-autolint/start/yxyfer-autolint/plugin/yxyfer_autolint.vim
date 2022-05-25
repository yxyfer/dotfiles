" ==========================
" Welcome to AutoLint
" ==========================
" File: autolint_linters
" Author: Mathieu (yxyfer) Rivier
" Creation Date: 04/05/2022
" Descrition: A simple vim pack that enables auto linting on save


" Generic Linter function
" Param: Lang's linter
function Linter(lang_linter)
    set noconfirm
    "execute 'normal! mm'
    bufdo silent execute '!' . a:lang_linter . ' %'
    silent execute 'edit! '
    bufdo redraw!
    "command! normal! `m
    set confirm
endfunction


" Default Python Linter: Black
" Info: The user can change the linter by changing the value of the global
"       variable: g:py_linter
if !exists("g:py_linter")
    let g:py_linter = "black"
endif


command! PyLint exec Linter(g:py_linter)

