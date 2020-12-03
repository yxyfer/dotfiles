" This .vimrc has been updated on Wed 30 Sept 2020

" Basics:
" 0. General Settings:

set noswapfile

" 1. Adding the helpful visual composents:

colorscheme purple_theme
" colorscheme onehalfdark     " My theme of the moment

set number
set relativenumber      " adds line numbers on the left.
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
hi DiffAdd ctermbg=176 ctermfg=black
hi DiffChange ctermbg=yellow ctermfg=black
hi DiffDelete ctermbg=darkblue ctermfg=black
" hi Cursor ctermbg=176 ctermfg=black
hi File ctermbg=240 ctermfg=176
set laststatus=2

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DIffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=\ %n\           " buffer number


set statusline+=%#Visual#               " colour
set statusline+=%{StatuslineGit()}

set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}

set statusline+=%#Visual#               " colour
set statusline+=>\ %f\ 

" Right
set statusline+=%#CursorLine#   " colour
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour

"set statusline+=%#TrailingSpace#
set statusline+=%#Cusor#%{StatuslineTrailingSpaceWarning()}
"set statusline+=%*

set statusline+=%#CursorLine#%r
"set statusline+=%r                        " readonly flag
set statusline+=%#Purple#%m                         " modified [+] flag

" Line Type
set statusline+=%#Purple#%y\ 

set statusline+=%#Visual#     " colour
set statusline+=%3l:%-2c\          " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage


"recalculate the trailing whitespace warning when idle, and after saving
autocmd FileAppendPost,cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  git@'.l:branchname.' ':''
endfunction


" coding style checker
imap <C-j> <c-o>:pyf /Users/mathieu.rivier/Documents/Projects/CodingSetUp/files/vim/clang-format.py<cr>
imap <C-k> <c-o>:call FormatFile()<cr>
map <C-j> <c-o>:pyf /Users/mathieu.rivier/Documents/Projects/CodingSetUp/files/vim/clang-format.py<cr>
map <C-k> <c-o>:call FormatFile()<cr>
function FormatFile()
   let l:lines="all"
   pyf /Users/mathieu.rivier/Documents/Projects/CodingSetUp/files/vim/clang-format.py
endfunction
