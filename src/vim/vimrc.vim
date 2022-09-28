" =============================================================================
"   Name:        .vimrc
"   Author:      Mathieu Rivier (yxyfer)
"   Version:     4.4
"
"   My Current .vimrc file
" ============================================================================= 

" ########################### PLUG ##################################

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'

" Make sure you use single quotes

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'mindriot101/vim-yapf', { 'for': 'python' }

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

" Initialize plugin system
call plug#end()
" ########################### USERNAME ##################################

" User name for header name 
let $user_name= 'Mathieu Rivier'

" ########################## PLUGIN SETTINGS #################################
" Better highlighting in python
"let g:python_highlight_all = 1

" Remove auto opening preview YCM
set completeopt-=preview

" ########################## MAIN  SETTINGS ###################################

set noswapfile    " Remove Vim swap files
set encoding=utf-8 " Set Vim's default encoding
set backspace=indent,eol,start  
let mapleader="," " Set LEADER

set number
set ruler       " adds line and column number bottom right.
set cursorline  " highlights the current line.

syntax on                " Allows text keyword highlighting.
colorscheme purple_theme " Setting the Colour Scheme
set bg=dark              " Tell vim how to set the text depending on background

"" To have the normal clipboard of the mac!
"set clipboard=unnamed

set nowrap
set colorcolumn=80      " adds a colored line on the 80th character.
"set list                " adds a $ sign at the end of each line
"                        " for trailing spaces.
"set list listchars=tab:>-,trail:.


" ########################### TIMEOUTS ##################################
" for when you use a command update status bar

" set ttimeout		" time out for key codes
" set ttimeoutlen=0	" wait up to 100ms after Esc for special key
" set updatetime=300
" set shortmess+=c


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
set statusline=\ %f
" Switch to the right side
set statusline+=%=
" Show modified sign
set statusline+=%m\  
" Filetype of the file
set statusline+=%y\ 
" Show the line number and total line
set statusline+=[%03P]


" ########################### YxyFunctions ##################################

" YxyComment ---------------------- {{{
" use ,c to comment and uncomment lines or even selections of lines
function! YxyComment()
    let l:cur = match(getline('.'), '\S')
    if len(b:comment_repr) == 1
        let l:f_letter = strpart(getline("."), l:cur, 1)
    else 
        " if languages with more than 2 comment repr add conditions
        let l:f_letter = strpart(getline("."), l:cur, 2)
    endif

    if l:f_letter == b:comment_repr
        exe 'norm ^x' . len(b:comment_repr) . 'x'
    else
        exe 'norm I' . b:comment_repr . b:comment_spaces
    endif
endfunction

vnoremap <buffer> <leader>c :call YxyComment() <cr>
nnoremap <buffer> <leader>c :call YxyComment() <cr>
" }}}

" YxyHeader ---------------------- {{{
augroup YxyHeader
    autocmd!
    " Add First document Line
    autocmd bufnewfile *.vim 0r !~/dotfiles/src/vim/yxyheader.sh "vim" $user_name
    autocmd bufnewfile *.sh 0r !~/dotfiles/src/vim/yxyheader.sh "sh" $user_name
    autocmd bufnewfile *.py 0r !~/dotfiles/src/vim/yxyheader.sh "py" $user_name
augroup END
" }}}


" ########################### FileType Settings ##################################
" Use za to fold and unfold

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
augroup END
" }}}

" C Files Settings ---------------------- {{{
augroup filetype_c
    " Preventing autocommand to run multiple times
    autocmd!

    " Set tab options
    autocmd FileType c setlocal shiftwidth=4
    autocmd FileType c setlocal softtabstop=4

    "  Add First document line
    " autocmd bufnewfile *.py 0r ~/.vim/pack/yxyheader/python.txt

    " Comment variables:
    autocmd FileType c let b:comment_repr = '//' 
    autocmd FileType c let b:comment_spaces = ' ' 

    " Set no wrap
    " autocmd BufNewFile,BufRead *.py setlocal nowrap

    " Set fold indent
    " autocmd FileType python setlocal foldmethod=indent
    " autocmd FileType python setlocal foldignore=

    " autoformat for python with black
    " autocmd BufWritePre *.py execute 'Yapf'
augroup END
" }}}

" Python Files Settings ---------------------- {{{
augroup filetype_python
    " Preventing autocommand to run multiple times
    autocmd!

    " Set tab options
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal softtabstop=4

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
    autocmd BufWritePre *.py execute 'Yapf'
augroup END
" }}}

" Scala Files Settings ---------------------- {{{
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


" ########################### EXPERIMENTAL ##################################

" Makefile --> allow tabs for rules
"autocmd FileType make setlocal noexpandtab

function! Lint()
    let current_line = line('.')

    " save current cur pos
    let current_cursor = getpos(".")

    " exec yapf
    autocmd Filetype python silent execute "0,$!" . "yapf"
    autocmd Filetype json silent execute ":%!jq ."

    " repos cursor
    call setpos('.', current_cursor)
endfunction
" Not Working
function! FormatJson()
python << EOF
import vim
import json
try:
    buf = vim.current.buffer
    json_content = '\n'.join(buf[:])
    content = json.loads(json_content)
    sorted_content = json.dumps(content, indent=4, sort_keys=True)
    buf[:] = sorted_content.split('\n')
except Exception, e:
    print e
EOF
endfunction
