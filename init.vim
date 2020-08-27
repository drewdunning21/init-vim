syntax on

set mouse=c
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set clipboard=unnamedplus
set laststatus=2
set ignorecase
set ic
set formatoptions-=cro
" Remove trailing whitespace on save
autocmd BufwritePre * %s/\s\+$//e

call plug#begin('~/.config/nvim/plugged')
" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
"Theme
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
" Auto pairs ( [ {  } ] )
Plug 'jiangmiao/auto-pairs'
" Vim practice
Plug 'ThePrimeagen/vim-be-good', {'do': '.\install.sh'}
" JS
Plug 'pangloss/vim-javascript'
Plug 'dense-analysis/ale'
" Vim Wiki
Plug 'vimwiki/vimwiki'
" Prettier
Plug 'prettier/vim-prettier', {'do': 'yarn install'}
" thins curson on insert
Plug 'wincent/terminus'
" tope commenter
Plug 'tpope/vim-commentary'
" git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
" latex
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
" start screen for vim
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
call plug#end()

" Styling
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" no idea what this does
let g:newrw_winsize = 25

" leader key
let mapleader = " "

imap jj <ESC>

" creates a newline without insert
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" deletes/pastes without copying
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap p "_dP
nnoremap dw "_dw
nnoremap ci' "_ci'
nnoremap ci" "_ci"
nnoremap cw "_cw
nnoremap x "_x
nnoremap s "_s
nnoremap di' "_di'
nnoremap di" "_di"
nnoremap cc "_cc

" ctrl delete
inoremap <C-Backspace> <C-W>

" Changes window navigation keys
map <leader>h <C-W>h
map <leader>l <C-W>l
map <leader>v <C-W>v
map <leader>w <C-W>

" find and replace
nnoremap S :%s//gI<Left><Left><Left>

" terminal escape maps
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" tab switching
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprev<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabm

" access last file
map <C-l> <C-^>

" horizontal zz
nnoremap zh :<C-u>normal! zszH<CR>

" change working directory
nnoremap <leader>D :cd %:p:h<CR>

" don't select newline char with $
vnoremap $ g_

" quit remap
nnoremap <leader>q :q<CR>

" copy line down
nnoremap <leader>jp Yp
nnoremap <leader>kp YP

" Prettier
"let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#print_width = 1000
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'

" JS syntax highlighting pangloss
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" git maps
nnoremap <leader>gs :G<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nnoremap <leader>gc :GCheckout<CR>

" fzf maps
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>; :Files<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffer<CR>
nnoremap <C-g> :Rg!
let g:fzf_layout = { 'window' : { 'width': 0.8, 'height': 0.8 }}
let $FZF_DEFAULT_OPTS='--reverse'

" coc maps
nmap <leader>rr <Plug>(coc-rename)
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

let g:coc_snippet_next = '<tab>'
" eslint
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'jsx': ['eslint']
\}

" VimBeGood
let g:vim_be_good_floating = 0

"Vim wiki
" autocmd FileType vimwiki set ft=markdown
let wiki = {}
let wiki.syntax = 'default'
let wiki.path = '~/Notes'
" let wiki.path_html = '~/vw_tmp/wiki/html'
let wiki.syntax = 'default'
let wiki.ext = '.wiki'
let g:vimwiki_list = [{ 'path': '~/Notes' }]

" cursor settings
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

" shows list of things recently yanked
nnoremap <silent><leader>y :<C-u>CocList -A --normal yank<cr>

" latex "
" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" hi Conceal ctermbg=none
setlocal spell
set spelllang=en_us
inoremap <C-k> <c-g>u<Esc>[s1z=`]a<c-g>u
" preview
" g:neotex_enabled=2


" instantly go to init.vim
nmap <leader>E :e $HOME/.config/nvim/init.vim<cr>
nmap <leader><C-e> :tabnew <bar> :e $HOME/.config/nvim/init.vim<cr> <bar> :so %<cr> <bar> :tabc <cr> <bar> :tabprev <cr>

