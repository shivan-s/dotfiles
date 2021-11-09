set nocompatible
filetype off

" # # # # # # # # 
" Vundle START
" Plugins go here
" # # # # # # # # 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required Plugin
Plugin 'VundleVim/Vundle.vim'

" Custom Plugins
Plugin 'psliwka/vim-smoothie' " Smooth Scrolling
Plugin 'Yggdroot/indentLine' " Displays Indentation
Plugin 'itchyny/lightline.vim' " Bottom Displays

call vundle#end()
filetype plugin indent on


" # # # # # # # #
" Plugin settings
" # # # # # # # # 

" lightline
let g:lightline = {
			\	'colorscheme': 'powerline',
			\     'active': {
				\         'left': [['mode', 'paste' ], ['readonly', 'relativepath', 'modified']],
				\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
				\     }
				\ }
set laststatus=2
set t_Co=256
set noshowmode

" indentLine
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_cat = "⦙"


" # # # # # # # # 
" Extra settings
" # # # # # # # #

" key remaps
noremap! <C-?> <C-H>

" colour
set background=dark

" syntax and search
set hlsearch
set incsearch
set ignorecase
set spell
syntax on

" tab spacing
autocmd FileType python setlocal sw=4 ts=4 sts=4
autocmd FileType html setlocal sw=2 ts=2 sts=2
autocmd FileType htmldjango setlocal sw=2 ts=2 sts=2
autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType javascriptreact setlocal sw=2 ts=2 sts=2

" other
set confirm
