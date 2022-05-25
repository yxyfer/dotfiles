" ==========================
" Welcome to AutoLint
" ==========================
" File: autolint_langs_rules
" Author: Mathieu (yxyfer) Rivier
" Creation Date: 04/05/2022
" Descrition: A simple vim pack that enables auto linting on save


" PYTHON
augroup py
    autocmd BufReadPre,FileReadPre,BufRead *.py set tabstop=4
    autocmd BufReadPre,FileReadPre,BufRead *.py set softtabstop=4
    autocmd BufReadPre,FileReadPre,BufRead *.py set shiftwidth=4
    autocmd BufReadPre,FileReadPre,BufRead *.py set textwidth=79
    autocmd BufReadPre,FileReadPre,BufRead *.py set expandtab
    autocmd BufReadPre,FileReadPre,BufRead *.py set autoindent
    autocmd BufReadPre,FileReadPre,BufRead *.py set fileformat=unix

    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

"    autocmd BufWritePost,FileAppendPost    *.py PyLint
augroup END


augroup tsx
    autocmd BufReadPre,FileReadPre,BufRead *.tsx set tabstop=2
    autocmd BufReadPre,FileReadPre,BufRead *.tsx set softtabstop=2
    autocmd BufReadPre,FileReadPre,BufRead *.tsx set shiftwidth=2
    autocmd BufReadPre,FileReadPre,BufRead *.tsx set textwidth=79
    autocmd BufReadPre,FileReadPre,BufRead *.tsx set expandtab
    autocmd BufReadPre,FileReadPre,BufRead *.tsx set autoindent
    autocmd BufReadPre,FileReadPre,BufRead *.tsx set fileformat=unix

augroup END
