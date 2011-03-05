" vundle
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundles
" Ruby on Rails: easy file navigation, enhanced syntax highlighting, and more
Bundle "rails.vim"
" plugin for ack
Bundle "ack.vim"
" A tree explorer plugin for navigating the filesystem
Bundle "The-NERD-tree"
" provides syntax highlightling, indenting, and a filetype plugin for Cucumber
Bundle "cucumber.zip"
" provides haml syntax highlightling
Bundle "Haml"
" Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Bundle "endwise.vim"
" Delete/change/add parentheses/quotes/XML-tags/much more with ease
Bundle "surround.vim"
" Pairs of handy bracket mappings
Bundle "unimpaired.vim"
" Ruby refactoring tool
Bundle "http://github.com/ecomba/vim-ruby-refactoring.git"


filetype plugin on " loads file type associated plugin 

let mapleader = ","

" file syntax color on
syntax on
filetype on

" colors
set t_Co=256
colorscheme tir_black

" encoding
set encoding=utf-8

" indentation and tabs
filetype indent on
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set autoindent
  " no expand tab for make and python
  autocmd FileType make     set noexpandtab
  autocmd FileType python   set noexpandtab

" scrolling
set scrolloff=3
set shiftwidth=2

" shows when you are in insert mode
set showmode

" status line
set showcmd
set laststatus=2
set statusline=%f\ %(%m%r%h\ %)%([%Y]%)%=%<%-20{getcwd()}\ [b%n]\ %l/%L\ ~\ %p%%\ \

" shows line numbers
set number

" intuitive backspacing in insert mode
set backspace=indent,eol,start

" highlight the line containing the cursor
set cursorline

" case insensitive searching but, any search with an uppercase character becomes a case sensitive search
set ignorecase
set smartcase

" highlight search terms...
set incsearch
set hlsearch
  " remove highlighting mapping
  nnoremap <leader><space> :noh<cr>

" shows unwanted whitespace
set listchars=tab:-✈,trail:,extends:>
set list!

" enable unsaved buffers
set hidden

" file name completion completes only the longest possible part (bash style)
set wildmode=list:longest
set wildmenu

" sets how many lines of history VIM has to remember
set history=1000

" indicates a fast terminal connection
set ttyfast

" no vi compatibility
set nocompatible

" as rails IDE
" From http://biodegradablegeek.com/2007/12/using-vim-as-a-complete-ruby-on-rails-ide/
  " ask what to do about unsaved/read-only files
  set cf  " Enable error files & error jumping.
  " save the file when you change buffers
  set autowrite  " Writes on make/shell commands
  " Show matching brackets
  set showmatch

" remove swap and backup files from your working directory
set backupdir=~/.vim/backups,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/backups,~/.tmp,~/tmp,/var/tmp,/tmp

" understands :W as :w
command! W :w

" tab matches brackets
  " in normal mode
  nnoremap <tab> %
  " in visual mode
  vnoremap <tab> %

" change buffer mapping
nnoremap <leader>6 :b#<CR>

" remove spaces mapping
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>T :%s/\t/  /<cr>

" change symbol key hashes to ruby 1.9 syntax mapper
map <leader>H :%s/:\(\w\+\) =>/\1:<CR>``

" Ack maping
nnoremap <leader>a :Ack 

" NERDTree maping
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" git commands mapping
map <leader>gd :GitDiff<CR>
map <leader>gs :GitStatus<CR>
map <leader>gc :GitCommit<CR>

" change line for formatted date mapping
map <leader>id !!date +'\%Y-\%m-\%d \%T \%z'<CR>

" lets you insert hex or RGB color codes directly into the buffer by using OS
" X's color picker
map <leader>pc :ColorHEX<CR>

" From here I have no idea what it means
set modelines=10

"Save on losing focus
"au FocusLost * :wa
