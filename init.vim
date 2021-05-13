" - - - - - - - - - - - - - - - - - - - - -
" this is what I used to set up the inital file
"   https://www.youtube.com/watch?v=ZEFXeRIFvN0
" used this for fzf fuzzy search
"   https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/
" - - - - - - - - - - - - - - - - - - - - -

set nocompatible		" be iMproved, required
filetype off			  " required

" - - - - - - - - - - - - - - - - - - - - -
" Plug in for this mean stuff
" - - - - - - - - - - - - - - - - - - - - -
call plug#begin('~/.config/nvim/plugged')
" theme stuff
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" github
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'

" I think there is a better way to search other then this ctrl p thing
" Plug 'ctrlpvim/ctrlp.vim' DELETE 
"
" Not sure about this one either, doesn't seem to work to well
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" s
" fzf search
" must install silver_searcher https://github.com/ggreer/the_silver_searcher
" brew install the_silver_searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" close brackets
Plug 'jiangmiao/auto-pairs'

" comment out code
Plug 'tpope/vim-commentary'

" add the end for ruby
Plug 'tpope/vim-endwise'

" adding dash docs to vim - leader d then watch the magic yo
Plug 'rizzatti/dash.vim'


" Initialize plugin system
call plug#end()

colorscheme gruvbox

" - - - - - - - - - - - - - - - - - - - - -
" Terminal
" - - - - - - - - - - - - - - - - - - - - -
" open a terminal in $PWD


" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 25
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
map <Leader>tt :terminal<CR>   

" - - - - - - - - - - - - - - - - - - - - -
" Commands
" - - - - - - - - - - - - - - - - - - - - -
let mapleader = ','

" move from insert to normal mode
inoremap nn <esc>

" Quicker window movement
" need to fix the iterm perferences on c-h and c-j
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

map <leader>w :w<CR>
map <leader>q :wq<CR>
map <leader>qq :q<CR>
map <leader>n :NERDTreeFocus<CR>
" the thing that sucks about GFiles as apose to Files is it will not inlcude
" new files unless they have been commited
map <leader>f :GFiles<CR>
map <leader>ff :Ag<CR>
map <leader>l :Buffers<CR>
"clear the highlight
map <leader><space> :noh<CR>
 " this does not work
map <leader>jj <esc><CR>
map <leader>d :Dash<CR>

" spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>

" - - - - - - - - - - - - - - - - - - - - -
" Set
" - - - - - - - - - - - - - - - - - - - - -
"   set system clipboard, need to have some sort of system clipboard installed
" - - - - - - - - - - - - - - - - - - - - -
" Basic settings
" - - - - - - - - - - - - - - - - - - - - -
set mouse=a
set termguicolors
set clipboard+=unnamedplus
set ruler
set colorcolumn=80
set background=dark
highlight ColorColumn ctermbg=0 guibg=#000000
set number
set nowrap
set smartcase
set hlsearch
set noerrorbells

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set smartindent
set cursorline
set cursorcolumn

set wildmode=longest,list,full

" status bar at the bottome
set noshowmode


" - - - - - - - - - - - - - - - - - - - - -
" Configure plugs YO
" - - - - - - - - - - - - - - - - - - - - -
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" set backspace=indent,eol,start  " Makes backspace key more powerful. I don't
" like this I don't think

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>


