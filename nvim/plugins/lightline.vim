" =========
" Lightline
" =========
let g:lightline = {
		\'colorscheme': 'one',
		\'active': {
				\'left': [['mode', 'paste'],
				\['readonly', 'relativepath', 'modified']],
				\'right': [['lineinfo'], ['percent'],
				\['fileformat', 'fileencoding']]
				\},
		\'component_function': {
				\'gitbranch': 'FugitiveHead'
				\},
		\}
