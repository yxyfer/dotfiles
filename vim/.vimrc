" This .vimrc has been updated on Wed 30 Sept 2020


" Basics:
" 1. Adding the helpful visual composents:

colorscheme molokai     " My theme of the moment

set number      " adds line numbers on the left.
set ruler       " adds line and column number bottom right.
set cursorline  " highlights the current line.
syntax on       " Allows text keyword highlighting.

set colorcolumn=80      " adds a colored line on the 80th character.
set list                " adds a $ sign at the end of each line
                        " for trailing spaces.

" TABS:
set expandtab       " replaces tabs with (softtabstop amount of) spaces.
set softtabstop=4   " number of spaces for a tab.


" Parental Control: (its a joke chill :) )
" Option to disable the arrow keys:

" In normal mode
noremap <Up>   <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right><Nop>

" In insert mode:
inoremap <Up>   <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right><Nop>
