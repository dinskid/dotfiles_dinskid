filetype plugin on
set nocompatible

syntax on

set encoding=utf-8
set shell=/bin/zsh
set mouse=a
set noshowmatch
set rnu
set nohlsearch
set hidden
set noerrorbells
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set shiftwidth=2
set autoindent
set smartindent
set clipboard=unnamedplus
set splitright
set splitbelow

inoremap <C-c> <esc>

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'dracula/vim', { 'as':'dracula' }
call plug#end()

lua << EOF
require'lspconfig'.clangd.setup{}
EOF

set termguicolors
colorscheme dracula

let mapleader = " "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>Q :wq<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>t :vsplit <bar> :term<CR>
nnoremap <leader>T :term<CR>
nnoremap <leader>y :%y+<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>. <cmd>Telescope find_files<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>+ :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Terminal config
au TermOpen * startinsert!

" au BufNewFile  *.cpp 0r ~/.config/nvim/template/template.cpp
au filetype c 	setlocal shiftwidth=2 expandtab!
au filetype cpp setlocal shiftwidth=2 expandtab!

" CPP Compilation
" let $CXXFLAGS='-std=c++17 -O2 -Wshadow -Wall -g -DLOCAL'
" nnoremap <F3> :!mkdir .outputs<CR><CR>
" nnoremap <F4> :vsplit<bar>:term bash -c .outputs/%<<CR>
" nnoremap <buffer> <F5> :w <bar> :vsplit <bar> :term make %< && mv %< .outputs/ && .outputs/%<<CR>
" nnoremap <buffer> <F6> :w <bar> :vsplit <bar> :term g++ -std=c++17 -O2 -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -DLOCAL % -o %< && mv %< .outputs/ && .outputs/%<<CR>

