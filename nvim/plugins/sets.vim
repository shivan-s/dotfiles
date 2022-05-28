" ========
" Settings
" ========
let mapleader = " "
set hidden
set nohlsearch
set incsearch
set confirm
set title
set number
set relativenumber
set nu
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set colorcolumn=81
set signcolumn=yes
set termguicolors
set tabstop=4 softtabstop=4
set expandtab
set laststatus=2
set noshowmode
set cursorline
set guicursor=i:hor100

" Dealing with Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal spell spell=en_gb 
                        \set wrap linebreak nolist
                        \set conceallevel=2
                        \:Goyo

