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
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set complete+=kspell
set clipboard+=unnamedplus
set completeopt=menuone,longest

" Columna para el linting
set signcolumn=yes

" Pep8 and the idea of no longer sentences like this one, which is really long 
highlight ColorColumn ctermbg=0 guibg=lightgrey

autocmd bufreadpre *.txt setlocal textwidth=0 linebreak

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Who does not use gruvbox
colorscheme seoul256

" Indentations the right way
vnoremap < <gv 
vnoremap > >gv 

let mapleader = " "
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bprevious<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>pp /^\# %%<CR>

" Taking notes on VIM? why?
nnoremap <leader>N :Note<CR>

" Insert current date useful for my notes
nnoremap <F6> "=strftime("%Y-%m %d")<CR>PI# <esc>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <F5>:e ~/.config/nvim/init.vim<CR>

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <leader>vwm :colorscheme seoul256<bar>:set background=dark<CR>

" Notes Folder
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
let g:slime_target = "tmux"

" Configurar la ubicación de python para usar en ambiente virtual
let g:python3_host_prog='~/virtual_envs/jc/bin/python'

" ˙
noremap <silent> ∆ :vertical resize -5<CR>
noremap <silent> ˚ :vertical resize +5<CR>

" Esta es de esas cosas donde el mouse definitivamente es más práctico
set mouse=n

let g:slime_no_mappings = 1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom-left}' }
let g:slime_dont_ask_default = 1

nmap <c-h> <c-o>
nmap <c-l> <c-i>

" Better search through file
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ?  "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ?  "m'" . v:count : "") . 'j'

" Moving Text
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>k :m .-2<CR>==

nmap t i
