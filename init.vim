" Remap bindings
let mapleader = " "
nnoremap <Leader>; A;<Esc>
nnoremap <Leader>h gT
nnoremap <Leader>l gt
nnoremap <Leader>s :w<Enter>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>cc :Codi!!
nnoremap <Leader><Tab> cc
nnoremap <Leader>ct :call ToggleCopilot()<Enter>
nnoremap <Leader>n :bnext<Enter>
nnoremap <Leader>p :bprev<CR>
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>/ :s/^/\/\//g<Enter>

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

" Terminal remaps
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-W>h
tnoremap <C-j> <C-\><C-n><C-W>j
tnoremap <C-k> <C-\><C-n><C-W>k
tnoremap <C-l> <C-\><C-n><C-W>l

map <Leader>t :below terminal<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map - <C-W>-
map + <C-W>+

" AUTOCOMMANDS
augroup remember_folds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END

" VIM PLUG
call plug#begin('~/.vim/plugged')

if !exists('g:vscode') " if not using vim in vscode
	Plug 'sickill/vim-monokai'
	Plug 'morhetz/gruvbox'
	Plug 'arcticicestudio/nord-vim'
	Plug 'junegunn/seoul256.vim'
	Plug 'sainnhe/sonokai'

	Plug 'justinmk/vim-sneak'
"	Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'ms-jpq/coq_nvim'
        Plug 'neovim/nvim-lspconfig'
	Plug 'itchyny/lightline.vim'
	Plug 'metakirby5/codi.vim'
	Plug 'github/copilot.vim'
endif
Plug 'tweekmonster/startuptime.vim'

call plug#end()

if !exists('g:vscode') " if not using vim in vscode

	" Install vim-plug if not already
	" if empty(glob('~/.vim/autoload/plug.vim'))
	"    if has('nvim') && !has('vim-plug')
	" 	silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	"    else
	" 	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	" 	    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	"    endif
	" endif

	" CONFIG SOURCE
	source $HOME/.config/nvim/plug-config/sneak.vim
	source $HOME/.config/nvim/plug-config/lightline.vim
	" source $HOME/.config/nvim/plug-config/coc.vim
        source $HOME/.config/nvim/plug-config/lsp.lua

	" COLORSCHEMES
	if has('termguicolors')
		set termguicolors
	endif
	let g:seoul256_background = 235
	let g:seoul256_light_background = 252
	let g:sonokai_style = 'shusia'
	"let g:sonokai_transparent_background = 1
	colorscheme seoul256
endif


" function to toggle the status of Copilot
function! ToggleCopilot()
    if has('nvim')
        if !exists(b:copilot_enabled)
            let b:copilot_enabled = v:true
        elseif b:copilot_enabled
            let b:copilot_enabled = v:false
        else 
            let b:copilot_enabled = v:true
        endif
    endif
endfunction!

" functions! ToggleCommentString()
"     
" endfunction!

" SETTINGS
set nu rnu 
syntax enable
set cursorline
set undodir=$HOME/.config/nvim/undo
set undofile
set mouse=a
set scrolloff=7 " Keep 7 lines below and above the cursor
set splitright
set splitbelow
set nowrap

" FILE SETTINGS
au FileType c setl sw=2 sts=2 tw=80 et commentstring=//\ %s
au FileType cpp setl sw=4 sts=4 tw=80 et commentstring=//\ %s
au FileType html setl sw=2 sts=2 tw=80 et
au FileType javascript setl sw=2 sts=2 tw=80 et
au FileType julia setl sw=4 sts=4 tw=80 et
au FileType lilypond setl sw=2 sts=2 tw=100 et commentstring=%\ %s
au FileType lua setl sw=4 sts=4 tw=80 et commentstring=--\ %s
au FileType python setl sw=4 sts=4 tw=80 et
au FileType sql setl sw=2 sts=2 tw=80 et
au FileType tex setl sw=2 sts=2 tw=80 et
au FileType vim setl sw=4 sts=4 tw=80 et commentstring=" %s
