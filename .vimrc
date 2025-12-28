se nocompatible
filetype off

""" line cursor

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" # # # # # # # # 
" Extra settings
" # # # # # # # #

""" key remaps

noremap! <C-?> <C-H>

""" colour

se background=dark

""" opening new files

se nohidden

""" syntax and search

se nohlsearch
se incsearch
se ignorecase
se spell
syntax on


""" 80 char vertical line and text wrapping

let &colorcolumn=81
highlight ColorColumn term=standout ctermbg=8


""" other

se shell=/bin/bash " don't need fish in vim
se confirm
se title
se nonumber
se guicursor=
