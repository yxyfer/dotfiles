" This .vimrc has been updated on Wed 30 Sept 2020

" Basics:
" 0. General Settings:

set noswapfile

" 1. Adding the helpful visual composents:

colorscheme purple_theme
" colorscheme onehalfdark     " My theme of the moment

set number      " adds line numbers on the left.
set ruler       " adds line and column number bottom right.
set cursorline  " highlights the current line.
syntax on       " Allows text keyword highlighting.

set colorcolumn=80      " adds a colored line on the 80th character.
set list                " adds a $ sign at the end of each line
                        " for trailing spaces.
set list listchars=tab:>-,trail:.

" TABS:
set expandtab       " replaces tabs with (softtabstop amount of) spaces.
set softtabstop=4   " number of spaces for a tab.
set shiftwidth=4


set scrolloff=7 " number of lines to keep context when scrolling
set smartindent  " automatically indent to above line;

" Makefile --> allow tabs for rules
autocmd FileType make setlocal noexpandtab

" Tabs:
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Parental Control: (its a joke chill :) )

" Option to disable the arrow keys:

" In normal mode
noremap <Up>   <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" In insert mode:
" inoremap <Up>   <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right><Nop>

" Option for easier navigation between splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Options for more natural splitting
set splitright
set splitbelow


" SETTING UP THE STATUS LINE
hi DiffAdd ctermbg=green ctermfg=black
hi DiffChange ctermbg=yellow ctermfg=black
hi DiffDelete ctermbg=darkblue ctermfg=white
set laststatus=2

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DIffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage
