set nocompatible
filetype off
set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My Bundles
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/jwhitley/vim-colors-solarized.git'
Plugin 'bling/vim-airline'
Plugin 'junegunn/goyo.vim'
Plugin 'https://github.com/amix/vim-zenroom2.git'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'kshenoy/vim-signature'

call vundle#end()            " required
filetype plugin indent on    " required

:let mapleader = ","

" Colors
colorscheme solarized
set background=dark
" Hacky
:let g:tog=0
nnoremap <leader>z :call ToggleDiff()<CR>
function! ToggleDiff()
    if g:tog==1
        set background=dark
        colorscheme solarized
        :let g:tog=0
        :Goyo!
    else
        set background=light
        colorscheme pencil256
        :let g:tog=1
        :Goyo 120
    endif
endfunction

syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowritebackup
set hlsearch
set incsearch
set autoindent
set backspace=indent,eol,start
set history=50
set ruler
set number
autocmd! GUIEnter * set vb t_vb=
if has('mouse')
  set mouse=a
endif
"set showcmd
"set nowrap
set incsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq


"CrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
    \}
let g:ctrlp_working_path_mode = 'r'
nmap <c-p> :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set hidden
nmap <leader>T :enew<cr>
nmap <leader>j :bnext<CR>
nmap <leader>k :bprevious<CR>
nmap <leader>wj :bp <BAR> bd #<CR>
nmap <leader>wk :ls<CR>

" Buffer Movement
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
