" -------------------------------------------------------------
" URL: http://color-thought.net
" Author: Jacob Reske
" -------------------------------------------------------------

set nocompatible             " reset options when .vimrc gets sourced
filetype plugin indent on    " for file-based indent rules
set t_Co=256                 " terminal colors are always 256 color mode

set rtp+=~/.vim/bundle/neobundle.vim  " location on NeoBundle file
call neobundle#begin(expand('~/.vim/bundle/'))

" File browsing and search plugins
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/neomru.vim.git'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'

" Text helper plugins
NeoBundle 'https://github.com/tpope/vim-surround.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/sheerun/vim-polyglot.git'
NeoBundle 'junegunn/vim-easy-align'

" Interface plugins
NeoBundle 'bling/vim-airline'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'https://github.com/amix/vim-zenroom2.git'
NeoBundle 'https://github.com/jwhitley/vim-colors-solarized.git'

" Command execution plugins
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call neobundle#end()               " required
filetype plugin indent on          " required


" --------------
"    Settings
" --------------

" Leader key
:map <Space> <leader>

" Colors
colorscheme seoul256
set background=dark
let g:seoul256_background = 236
let g:gruvbox_termcolors=256
let g:airline_theme='gruvbox'

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Switch between dark and Goyo + Zenroom light with leader mapping
:let g:tog=0
nnoremap <leader>z :call ToggleDiff()<CR>
function! ToggleDiff()
    if g:tog==1
        set background=dark
        colorscheme seoul256
        :let g:tog=0
        :execute ":Goyo!"
    else
        set background=light
        colorscheme pencil256
        :let g:tog=1
        :execute ":Goyo 50"
    endif
endfunction

" Tab commands and defaults
set tabstop=4        " tab width is 4 spaces
set softtabstop=4    " backspace key removes tabs as as spaces
set shiftwidth=4     " shifting with < > keys is also 4 spaces
set expandtab        " tabs always become spaces

"Searching
set hlsearch   " adds highlighting to searched terms
set incsearch  " moves cursor to string while searching
set ignorecase " ignore case in searches
set smartcase  " if there is an uppercase letter in search, case-sensitive
set wildmenu   " tab completion on commands

"Other
syntax enable                     " turn on color syntax highlighting
set nowritebackup                 " imo those private .vim backup files are dumb
set clipboard=unnamed             " all vim instances use the same clipboard
set backspace=indent,eol,start    " backspace now deletes over line breaks
if &history < 1000
  set history=1000                " fixed undo history
endif
set ruler                         " shows line and column numbers
set number                        " sets line numbers in botton right
autocmd! GUIEnter * set vb t_vb=  " disable beeping
if has('mouse')
  set mouse=a                     " allows mouse (if available)
endif
set showcmd                       " shows the result of the command in the lower bar

" Word wrapping and indenting
set autoindent   " indents according to syntax in Insert mode
set wrap         " Vim wraps lines visually
set linebreak    " don't wrap between characters
set nolist       " with list on, linebreak is disabled
set textwidth=0  " keeps Vim from inserting line breaks unless you ask for them
set wrapmargin=0 " keeps Vim from inserting line breaks unless you ask for them
set breakindent  " indents wrapped lines! Finally!!


" --------------
"    Mappings
" --------------

" don't use Ex mode, that's dumb
nnoremap Q <nop>
" save current buffer
nnoremap <leader>w :w<CR>
" yank to system clipboard
nnoremap <leader>y "*y
" paste from system clipboard
nnoremap <leader>p "*p
" paste above from system clipboard
nnoremap <leader>P "*P
" delete (cut) to system clipboard
nnoremap <leader>d "*d
" remove all highlighting
nnoremap <leader>/ :noh<CR>

" left split
nmap gh <C-w>h
" up split
nmap gj <C-w>j
" down split
nmap gk <C-w>k
" right split
nmap gl <C-w>l
" close a split
nmap gq <C-w>q
" vertical split
nmap gs <C-w>s
" horizontal split
nmap gv <C-w>v

" new buffer
nmap <leader>T :enew<cr>
" previous buffer
nmap <leader>j :bprevious<CR>
" next buffer
nmap <leader>k :bnext<CR>
" close buffer
nmap <leader>q :bd<CR>
" close buffer (without changes)
nmap <leader>Q :bd!<CR>

" delete all trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" -------------------
"   Plugin Settings
" -------------------

"CrlP settings
let g:tctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
    \}
let g:ctrlp_working_path_mode = 'r'     " CtrlP searches for nearest .git, .svn, .hg, etc
" start CtrlP with the leader key
nmap <leader>c :CtrlP<CR>

" Unite mappings with ack-grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
nnoremap <silent> <Leader>ag :Unite -silent -auto-resize
        \ -buffer-name=ag grep<CR>

" Airline settings
set laststatus=2
let g:airline_powerline_fonts             = 1    " use Powerline fonts (for OSX Terminal)
let g:airline#extensions#tabline#enabled  = 1    " shows all buffers with tab
let g:airline#extensions#tabline#fnamemod = ':t' " differentiate buffers
set hidden

" NERDTree
nnoremap <leader>n :NERDTree<CR>
let NERDTreeQuitOnOpen=1            " NERDTree closes when you open a file
let g:NERDTreeWinSize = 20          " good size for a file explorer

" Easy-Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
