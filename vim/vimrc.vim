" =============================================================================
"   Name:        .vimrc
"   Author:      Mathieu Rivier (yxyfer)
"   Version:     1.0
"
"   My Current .vimrc file
" ============================================================================= 

" ########################### PLUG ##################################

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'

" Make sure you use single quotes

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'mindriot101/vim-yapf', { 'for': 'python' }

" Initialize plugin system
call plug#end()

" ########################## PLUGIN SETTINGS #################################
" Better highlighting in python
"let g:python_highlight_all = 1


" ########################## MAIN  SETTINGS ###################################
" Remove Vim swap files
set noswapfile

" Set LEADER
let mapleader=","

"" To have the normal clipboard of the mac!
"set clipboard=unnamed

" Setting the Colour Scheme
colorscheme purple_theme
" Tell vim how to set the text depending on background
set bg=dark


set number
set ruler       " adds line and column number bottom right.
set cursorline  " highlights the current line.
syntax on       " Allows text keyword highlighting.

set nowrap
set colorcolumn=80      " adds a colored line on the 80th character.
"set list                " adds a $ sign at the end of each line
"                        " for trailing spaces.
"set list listchars=tab:>-,trail:.

" Set Vim's default encoding
set encoding=utf-8

set backspace=indent,eol,start "?

"set ttimeout		" time out for key codes
"set ttimeoutlen=0	" wait up to 100ms after Esc for special key

"set updatetime=300
"set shortmess+=c

" ########################### SEARCH ##################################
" Set the highlights when searching
set hlsearch incsearch
" Set the search without looking at cases
set ignorecase
" if you search with Upercase make it case sensitive
set smartcase


" ########################### TABS ##################################
set expandtab       " replaces tabs with (softtabstop amount of) spaces.
set softtabstop=4   " number of spaces for a tab.
set shiftwidth=4

" ########################### INDENTATION ##################################
set autoindent  " Indenting to above line
set smartindent  " automatically indent from language 


" ########################### NAVIGATION ##################################
set scrolloff=7 " number of lines to keep context when scrolling

"" Tabs:
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Swithing Splits:
map <C-l> <C-w><right>
map <C-h> <C-w><left>
map <C-j> <C-w><down>
map <C-k> <C-w><up>

"" Options for more natural splitting
set splitright
set splitbelow

" Option to disable the arrow keys in normal mode:
noremap <Up>   <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ########################### MAPPINGS ##################################
" Enable editing fast vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<cr>

" Enable sourcing the vimrc easily
nnoremap <leader>sv :source ~/.vimrc<cr>


" Make a command awaiting mapping it enables acting on the inside of (
onoremap p i(
onoremap q i"

onoremap il( :<c-u>normal! F:vi(<cr>
normal! F)vi(<cr>


" ########################### STATUS LINE ##################################

" Showing the Status line
set laststatus=2
" Path to the file
set statusline=%f
" Switch to the right side
set statusline+=%=
" Show modified sign
set statusline+=%m\  
" Filetype of the file
set statusline+=%y\ 
" Show the line number and total line
set statusline+=[%03P]


" ########################### FileType Settings ##################################
" Use za to fold and unfold

function! YxyComment()
    let l:cur = match(getline('.'), '\S')
    let l:f_letter = strpart(getline("."), l:cur, 1)

    if l:f_letter == b:comment_repr
        exe 'norm ^x' . len(b:comment_spaces). 'x'
    else
        exe 'norm I' .b:comment_repr . b:comment_spaces
    endif
endfunction

vnoremap <buffer> <leader>c :call YxyComment() <cr>
nnoremap <buffer> <leader>c :call YxyComment() <cr>

" VIM GENERAL SETTINGS ---------------------- {{{  
augroup VIM
    autocmd!
    " Auto Resize Splits to be the same size
    autocmd VimResized * wincmd =
augroup END
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    " Comment variables:
    autocmd FileType vim let b:comment_repr = '"' 
    autocmd FileType vim let b:comment_spaces = ' ' 
    " Add First document Line
    autocmd bufnewfile *.vim 0r ~/.vim/pack/yxyheader/vim.txt
    " Vim Header
    autocmd FileType vim nnoremap <buffer> <leader>h I" ########################### ##################################<esc>bi
augroup END
" }}}

" Shell file settings ---------------------- {{{
augroup filetype_shell
    autocmd!
    autocmd FileType sh setlocal foldmethod=marker
    " Comment variables:
    autocmd FileType sh let b:comment_repr = '#' 
    autocmd FileType sh let b:comment_spaces = ' ' 
    " Add First document Line
    autocmd bufnewfile *.sh 0r ~/.vim/pack/yxyheader/shell_script.txt
augroup END
" }}}
function Lint()
    let current_line = line('.')

    " save current cur pos
    let current_cursor = getpos(".")

    " exec yapf
    silent execute "0,$!" . "yapf"

    " repos cursor
    call setpos('.', current_cursor)
endfunction

" Python Files Settings ---------------------- {{{
augroup filetype_python
    " Preventing autocommand to run multiple times
    autocmd!

    " Set tab options
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal softtabstop=4

    "  Add First document line
    autocmd bufnewfile *.py 0r ~/.vim/pack/yxyheader/python.txt

    " Comment variables:
    autocmd FileType python let b:comment_repr = '#' 
    autocmd FileType python let b:comment_spaces = ' ' 

    " Set no wrap
    autocmd BufNewFile,BufRead *.py setlocal nowrap

    " Set fold indent
    " autocmd FileType python setlocal foldmethod=indent
    " autocmd FileType python setlocal foldignore=

    " easy if
    autocmd FileType python :iabbrev <buffer> iff if:<left>

    " autoformat for python with black
    autocmd BufWritePost *.py execute 'Yapf'
augroup END
" }}}

" Scala Files Settings ---------------------- {{
augroup filetype_scala
    " Preventing autocommand to run multiple times
    autocmd!
    " Set tab options
    autocmd FileType scala setlocal shiftwidth=2
    autocmd FileType scala setlocal softtabstop=2
    " Comment variables:
    autocmd FileType scala let b:comment_repr = '//' 
    autocmd FileType scala let b:comment_spaces = ' ' 
augroup END
" }}}

"" Makefile --> allow tabs for rules
"autocmd FileType make setlocal noexpandtab


" for resetting the splitsVimResized
