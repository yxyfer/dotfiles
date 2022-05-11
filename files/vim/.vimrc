" This .vimrc has been updated on Wed 30 Sept 2020

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'dense-analysis/ale'
Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-commentary'

Plugin 'yxyfer/yxybar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" autoformat for python with black
" autocmd BufWritePre *.py execute ':Black'


" ########################## PLUGIN SETTINGS #################################

" Close auto complete preview after use
let g:ycm_autoclose_preview_window_after_completion=1


      " \   'python': ['flake8', 'pylint'],
" Ale use the right formatter
let g:ale_linters = {
      \   'python': ['flake8'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['yapf', 'isort']
            \}
let g:ale_fix_on_save = 1


" Better highlighting in python
let g:python_highlight_all = 1


" ########################## MAIN  SETTINGS ###################################
"
" autocmd FileType cpp ClangFormatAutoEnable

" Basics:
" 0. General Settings:
set noswapfile

" To have the normal clipboard of the mac!
set clipboard=unnamed


" 1. Adding the helpful visual composents:
colorscheme purple_theme

set number
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

" Option for easier navigation between splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Options for more natural splitting
set splitright
set splitbelow

set backspace=indent,eol,start
