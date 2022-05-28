" =======
" Plugins
" =======
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sharkdp/fd'
Plug 'BurntSushi/ripgrep'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'dpelle/vim-LanguageTool'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'godlygeek/tabular'
call plug#end()
