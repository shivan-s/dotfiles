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
" fuzzy search finder
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
"
Plugin 'jremmen/vim-ripgrep' " ripgrep search
Plugin 'cespare/vim-toml' " toml highlighting

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
let g:indentLine_cat = "⦙"

" fzf
set rtp+=/.fzf
nnoremap <silent> <C-p>  :Files<CR>
nnoremap <silent> <C-e>  :Buffer<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
let g:fzf_history_dir = '~/.local/share/fzf-history'
autocmd! FileType fzf 
autocmd! FileType fzf set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" ripgrep
if executable('rg')
	set grepprg=rg\ --color=never
endif
let g:rg_command = 'rg --vimgrep -S'
nnoremap <C-t> :Rg<CR>


" # # # # # # # # 
" Extra settings
" # # # # # # # #

" key remaps
noremap! <C-?> <C-H>

" colour
set background=dark

" opening new files
set nohidden

" syntax and search
set hlsearch
set incsearch
set ignorecase
set spell
syntax on

" tab spacing
set expandtab
autocmd FileType python setlocal sw=4 ts=4 sts=4
autocmd FileType javascript,javascriptreact,lua,html,htmldjango,yaml setlocal ts=2 sw=2 sts=2 expandtab

" 80 char vertical line
let &colorcolumn=81
highlight ColorColumn term=standout ctermbg=8

" other
set shell=/bin/bash " don't need fish in vim
set confirm
set title

