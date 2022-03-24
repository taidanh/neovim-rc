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

map <Leader>t :sp term://zsh<CR>
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
    Plug 'ghifarit53/tokyonight-vim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'ms-jpq/coq_nvim'
    Plug 'github/copilot.vim'
    Plug 'wfxr/minimap.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'justinmk/vim-sneak'
    Plug 'itchyny/lightline.vim'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'akinsho/bufferline.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    Plug 'voldikss/vim-floaterm'
endif
Plug 'tweekmonster/startuptime.vim'

call plug#end()

if !exists('g:vscode') " if not using vim in vscode

    " CONFIG SOURCE
    source $HOME/.config/nvim/plug-config/coq.vim
    source $HOME/.config/nvim/plug-config/lightline.vim
    source $HOME/.config/nvim/plug-config/sneak.vim
    source $HOME/.config/nvim/plug-config/bufferline.vim
    source $HOME/.config/nvim/plug-config/floaterm.vim
    source $HOME/.config/nvim/plug-config/indent-blankline.vim
    source $HOME/.config/nvim/plug-config/lsp.lua
    source $HOME/.config/nvim/plug-config/tree-sitter.lua
    source $HOME/.config/nvim/plug-config/nvim-tree.vim

    " COLORSCHEMES
    if has('termguicolors')
            set termguicolors
    endif
    let g:seoul256_background = 235
    let g:seoul256_light_background = 252
    let g:sonokai_style = 'shusia'
    "let g:sonokai_transparent_background = 1
    let g:tokyonight_style = 'night'
    let g:tokyonight_enable_italic = 1
    let g:tokyonight_current_word = 'bold'
    colorscheme tokyonight
endif

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
au FIleType php setl sw=4 sts=4 tw=80 et
au FileType sql setl sw=2 sts=2 tw=80 et
au FileType tex setl sw=2 sts=2 tw=80 et
au FileType vim setl sw=4 sts=4 tw=80 et commentstring=" %s
