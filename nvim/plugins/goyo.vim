" ================
" Goyo + Limelight
" ================
let g:goyo_width = 90
let g:limelight_default_coefficient = 0.7
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
noremap <leader>gy :Goyo <CR>
noremap <leader>ll :Limelight!! <CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoExit Limelight!

