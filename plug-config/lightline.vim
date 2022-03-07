	" LIGHTLINE
if !has('gui_running')
	set t_Co=256
endif

let g:lightline = {'colorscheme' : 'tokyonight'}

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ],
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \ },
      \ }
