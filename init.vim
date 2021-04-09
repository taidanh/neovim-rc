	" Remap bindings
let mapleader = " "
nnoremap <Leader>; A;<Esc>
nnoremap <Leader>h gT
nnoremap <Leader>l gt
nnoremap <Leader>s :w<Enter>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

inoremap jj <Esc>

map <Leader>t :below terminal<CR>

	" AUTOCOMMANDS
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

	" Install vim-plug if not already
if empty(glob('~/.vim/autoload/plug.vim'))
   if has('nvim')
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   else
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
endif

	" VIM PLUG
call plug#begin('~/.vim/plugged')

Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'

Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'

call plug#end()
"
	" CONFIG SOURCE
source $HOME/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/coc.vim

	" COLORSCHEMES
let g:seoul256_background = 235
let g:seoul256_light_background = 256
colorscheme nord 

	" SETTINGS
set nu rnu 
syntax enable
set cursorline
set undodir=$HOME/.config/nvim/undo
set undofile
set scrolloff=5 " Keep 3 lines below and above the cursor
