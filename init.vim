source ~/.config/nvim/vim-plug/plugins.vim

syntax on
syntax enable
filetype plugin indent on

set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set nolist
set wrap
set showbreak=++
set textwidth=79
set colorcolumn=79
set backup
set backupdir=/tmp/
set indentexpr=GetPythonPEPIndent(v:lnum)
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Pep8 and the idea of no longer sentences like this one, which is really long 
highlight ColorColumn ctermbg=0 guibg=lightgrey

autocmd bufreadpre *.txt setlocal textwidth=0 linebreak

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Who does not use gruvbox
colorscheme seoul256

" Indentations the right way
vnoremap < <gv 
vnoremap > >gv 

let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bprevious<CR>
nnoremap <leader>d :bdelete<CR>

" Taking notes on VIM? why?
nnoremap <leader>N :Note<CR>

" Insert current date useful for my notes
nnoremap <F6>"=strftime("%Y-%m %A %d %H:%M:%S")<CR>P

" Toggle NERDTree plugin
let g:NERDTreeWinPos = "right"
" nnoremap <Leader>n :NERDTreeToggle<CR>

" CrtrlP with control-p
nnoremap <C-p> :CtrlP<CR>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <F5>:e ~/.config/nvim/init.vim<CR>

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
noremap K :m '<-2<CR>gv=gv
nnoremap <leader>vwm :colorscheme seoul256<bar>:set background=dark<CR>
vnoremap x "_d

set clipboard+=unnamedplus

" Notes Folder
:let g:notes_directories = ['~/Documents/Notes']
:let g:notes_suffix = '.txt'

nmap <D-/> <plug>NERDCommenterToggle
xmap <D-/> <plug>NERDCommenterToggle

autocmd bufreadpre *.py let @q = '<C-v>'
let g:slime_target = "tmux"

" Configurar la ubicación de python para usar en ambiente virtual
let g:python3_host_prog='~/virtual_envs/universidad/bin/python3'
noremap <silent> <C-S-h> :vertical resize +5<CR>
noremap <silent> <C-S-l> :vertical resize -5<CR>

" Esta es de esas cosas donde el mouse definitivamente es más práctico
set mouse=n

let g:slime_no_mappings = 1
let g:slime_python_ipython = 1
let g:python_pep8_indent_hang_closing=0

let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom-left}' }
let g:slime_dont_ask_default = 1

xmap <c-c><c-c> <Plug>SlimeRegionSend gvh<ESC>
imap <c-c><c-c> <ESC><Plug>SlimeParagraphSend i
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v <Plug>SlimeConfig

nmap <c-h> <c-o>
nmap <c-l> <c-i>

autocmd bufreadpre *.csv setlocal textwidth=0 linebreak ft=csv
