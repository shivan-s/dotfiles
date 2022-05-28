set nocompatible
filetype off

" # # # # # # # # 
" Vundle START
" Plugins go here
" # # # # # # # # 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


""" Required Plugin

Plugin 'VundleVim/Vundle.vim'


""" Custom Plugins

" Smooth Scrolling
Plugin 'psliwka/vim-smoothie' 

" Displays Indentation
Plugin 'Yggdroot/indentLine' 

" Bottom Displays
Plugin 'itchyny/lightline.vim' 

" Fuzzy Search Finder
Plugin 'junegunn/fzf' 
Plugin 'junegunn/fzf.vim' 

" RipGrep Search
Plugin 'jremmen/vim-ripgrep' " ripgrep search

" Toml Highliting
Plugin 'cespare/vim-toml' " toml highlighting

" Distraction Free Writing
Plugin 'junegunn/goyo.vim' " distraction free writing

" Highlights Paragraphs
Plugin 'junegunn/limelight.vim' " highlights paragraphs

" Prettier Formatting
Plugin 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 
        \         'typescript',
        \         'css', 
        \         'less', 
        \         'scss',
        \         'json', 
        \         'graphql', 
        \         'vue', 
        \         'svelte', 
        \         'yaml', 
        \         'html'] }

" Formatter for Python
Plugin 'psf/black' " Black for python formatting

" Plugin to help with Hugo
Plugin 'robertbasic/vim-hugo-helper'

" Plugin in for Markdown
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'

call vundle#end()
filetype plugin indent on


" # # # # # # # #
" Plugin settings
" # # # # # # # # 

""" lightline

let g:lightline = {
        \ 'colorscheme': 'powerline',
        \ 'active': {
        \ 'left': [['mode', 'paste' ], ['readonly', 'relativepath', 'modified']],
        \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
        \     }
        \ }
set laststatus=2
set t_Co=256
set noshowmode


""" indentLine

let g:indentLine_cat = "⦙"


""" fzf

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


""" ripgrep

if executable('rg')
	set grepprg=rg\ --color=never
endif
let g:rg_command = 'rg --vimgrep -S'
nnoremap <C-t> :Rg<CR>


""" goyo + limelight (focus mode)

let g:goyo_width = 90
let g:limelight_default_coefficient = 0.7

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

map <leader>gy :Goyo <CR>
map <leader>ll :Limelight!! <CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

""" line cursor

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

""" Prettier

let g:prettier#quickfix_enabled = 0


""" Black

autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 88

""" Vim Markdown
let g:vim_markdown_frontmatter = 1
autocmd FileType markdown normal zR

" # # # # # # # # 
" Extra settings
" # # # # # # # #

""" key remaps

noremap! <C-?> <C-H>

""" colour

set background=dark


""" opening new files

set nohidden

""" syntax and search

set nohlsearch
set incsearch
set ignorecase
set spell
syntax on


""" tab spacing

set expandtab
autocmd FileType python setlocal sw=4 ts=4 sts=4
autocmd FileType javascript,javascriptreact,lua,html,htmldjango,yaml setlocal ts=2 sw=2 sts=2 expandtab


""" 80 char vertical line and text wrapping

let &colorcolumn=81
highlight ColorColumn term=standout ctermbg=8


""" other

set shell=/bin/bash " don't need fish in vim
set confirm
set title
set number
set relativenumber
set guicursor=

