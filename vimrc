" vundle
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles
" plugin for ack
Bundle "ack.vim"
" A tree explorer plugin for navigating the filesystem
Bundle "The-NERD-tree"
" provides syntax highlightling, indenting, and a filetype plugin for Cucumber
Bundle "cucumber.zip"
" Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Bundle "endwise.vim"
" Ruby refactoring tool
Bundle "http://github.com/ecomba/vim-ruby-refactoring.git"
" Clojure plugin
Bundle "VimClojure"
" Solarized colorscheme
Bundle "git://github.com/altercation/vim-colors-solarized.git"
" ctrlp
Bundle "git://github.com/kien/ctrlp.vim.git"
" syntastic
Bundle "git://github.com/scrooloose/syntastic.git"
" CoffeeScript plugin
Bundle "vim-coffee-script"
" Puppet
Bundle "git://github.com/rodjek/vim-puppet.git"
"Powerline
Bundle "git://github.com/Lokaltog/vim-powerline.git"

let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" let g:Powerline_symbols = 'fancy'

filetype plugin on " loads file type associated plugin 

let mapleader = ","

" file syntax color on
syntax enable
filetype on

" colors
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

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
"
" scrolling
set scrolloff=3
set shiftwidth=2

" shows when you are in insert mode
set showmode

" status line
set showcmd
set laststatus=2
"set statusline=%f\ %(%m%r%h\ %)%([%Y]%)%=%<%-20{getcwd()}\ [b%n]\ ~\ %L\ lines\

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

" Selected window wider than unselected one
set winwidth=81

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

" tab matches brackets
" in normal mode
nnoremap <tab> %
" in visual mode
vnoremap <tab> %

" change buffer mapping
nnoremap <leader>, :b#<CR>

" remove spaces mapping
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>T :%s/\t/  /<cr>

" NERDTree maping
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" ctrlp options
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 2
set wildignore+=*.o,*.obj,.git,*.swp,tmp
let g:ctrlp_custom_ignore = '\.git$\|\.svn$|\.swp$|\.o$'

" From here I have no idea what it means
set modelines=10

"Makes vim notice the rvm configuration
set shell=/bin/sh

"Find and replace (Not very good though)
function! FindAndReplace(...)
  let args =  a:000 + ['.']
  execute  join(['args `Ack ',join(['-l', args[0], args[2]]),'`'])
  execute join(['argdo %s', args[0], args[1], 'gec'], '/')
endfunction
command! -nargs=* -complete=file FindAndReplace call FindAndReplace(<f-args>)
