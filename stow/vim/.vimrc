set nocompatible
filetype off
if has("autocmd")
  filetype indent on
endif

if has ("autocmd")
  filetype indent on
endif

" Vundle {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'elixir-lang/vim-elixir'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'mnick/vim-pomodoro'
Plugin 'ngmy/vim-rubocop'
Plugin 'nono/vim-handlebars'
Plugin 'noprompt/vim-yardoc'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/tComment'
Plugin 'w0ng/vim-hybrid'

call vundle#end()

" }}}

let mapleader = ","
syntax enable
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
set background=dark
set laststatus=2

" Mappings {{{

" Insert mode mappings {{{
inoremap <C-l> <space>=><space>
inoremap <C-s> <Esc>:w<CR>a
" }}}

" Normal mode mappings {{{
nnoremap <C-s> :w<CR>
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>gs :Gstatus<CR><C-W>15+
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>rs :!clear;time bundle exec rake<CR>
nnoremap <leader>v :RuboCop<CR>
nnoremap <leader>a :Ack
nnoremap <leader>d :bd<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><cr> :noh<CR>
nnoremap <leader>l :ls<CR>:b
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>x :%s:^\s\+$::<CR>:%s:	:  :<CR>
nnoremap <leader><space> :b#<CR>
nnoremap n nzz
nnoremap N Nzz
" }}}

" Visual mode mappings {{{
vnoremap < <gv
vnoremap > >gv

" Execute dot in the selection
vnoremap . :norm.<CR>
" }}}

" }}}

" General settings {{{
set t_Co=256
set autoindent
set backspace=indent,eol,start
set colorcolumn=81
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set guifont=Fira\ Mono\ 10.5
set guioptions-=Be
set guioptions=aAc
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set noswapfile
set number
set shell=/bin/bash
set showmatch
set smartcase
"set smartindent
set term=screen-256color
set ts=2 sts=2 sw=2 expandtab
set novisualbell
set winheight=999
set winheight=5
set winminheight=5
set winwidth=84
" }}}

" Autocommands {{{

".ru files are Ruby.
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile [vV]agrantfile set filetype=ruby

" Markdown gets auto textwidth
au Bufread,BufNewFile *.md set filetype=markdown textwidth=80
au Bufread,BufNewFile *.markdown set textwidth=80

" .feature files are Cucumber.
au Bufread,BufNewFile *.feature set filetype=cucumber
au BufRead,BufNewFile *.pug set filetype=pug
" }}}

" Specific configurations {{{
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
let base16colorspace=256

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CtrlP ignore mechanism
set wildignore+=*tmp*,*/node_modules/*
" }}}

" Airline configs {{{
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
" }}}

" vim: foldmethod=marker foldmarker={{{,}}}
