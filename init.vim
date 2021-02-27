" Remap bindings
let mapleader = " "
nnoremap <Leader>; A;<Esc>
nnoremap <Leader>h gT
nnoremap <Leader>l gt
nnoremap <Leader>s :w<Enter>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

inoremap jj <Esc>

" AUTOCOMMANDS

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

map <Leader>t :below terminal<CR>

" Install vim-plug if not already
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VIM PLUG
call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

" COC SETTINGS
let g:coc_global_extensions = ['coc-tabnine']
" Use <Tab> and <S-Tab> to navigate the completion list:

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()


" VIM SNEAK
source $HOME/.config/nvim/plug-config/sneak.vim

colorscheme gruvbox 
set nu rnu 
syntax enable
set cursorline
set undodir=$HOME/.config/nvim/undo
set undofile


