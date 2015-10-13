set nocompatible
filetype off
set t_Co=256

set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" My NeoBundles
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/jwhitley/vim-colors-solarized.git'
NeoBundle 'bling/vim-airline'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'https://github.com/amix/vim-zenroom2.git'
NeoBundle 'https://github.com/xolox/vim-misc.git'
NeoBundle 'https://github.com/tpope/vim-surround.git'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/neomru.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.vim.git'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call neobundle#end()            " required
filetype plugin indent on    " required

":let mapleader = "\<Space>"
:map <Space> <leader>

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
set showcmd
"set nowrap
set incsearch
set ignorecase
set smartcase

" General mappings
nnoremap Q <nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>/ :noh<CR>

"CrlP
let g:tctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
    \}
let g:ctrlp_working_path_mode = 'r'
nmap <leader>c :CtrlP<cr>


" Unite mappings with ack-grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
nnoremap <silent> <Leader>ag :Unite -silent -auto-resize
        \ -buffer-name=ag grep<CR>

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set hidden

" Buffer Movement
nmap <leader>T :enew<cr>
nmap <leader>j :bnext<CR>
nmap <leader>k :bprevious<CR>
nmap <leader>q :bd<CR>
nmap <leader>Q :bd!<CR>

" Split/Window Movement
nmap gh <C-w>h                      "left split
nmap gj <C-w>j                      "up split
nmap gk <C-w>k                      "down split
nmap gl <C-w>l                      "right split
nmap gq <C-w>q                      "close a split
nmap gs <C-w>s                      "close a split
nmap gv <C-w>v                      "close a split

" NERDTree
nnoremap <leader>n :NERDTree<CR>      "Default Nerdtree Open
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize = 20 

" Tab Movement
"nnoremap <leader>q :QuitTab<cr>
command! QuitTab call s:QuitTab()
function! s:QuitTab()
  try
    tabclose
  catch /E784/ " Can't close last tab
    qall
  endtry
endfunction
