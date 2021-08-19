	" COC SETTINGS
" let g:coc_global_extensions = ['coc-tabnine']
let g:coc_global_extensions = ['coc-clangd', 'coc-json', 'coc-pyright']

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
