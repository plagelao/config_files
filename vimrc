" vundle
set rtp+=~/.vim/vundle.git/
let g:vundle_log = []
call vundle#rc()

" Bundles
" provides syntax highlightling, indenting, and a filetype plugin for Cucumber
Bundle "cucumber.zip"
" Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Bundle "endwise.vim"
" Ruby refactoring tool
Bundle "http://github.com/ecomba/vim-ruby-refactoring.git"
" Clojure plugin
Bundle "VimClojure"
" ctrlp
Bundle "git://github.com/kien/ctrlp.vim.git"
" CoffeeScript plugin
Bundle "vim-coffee-script"
" Puppet
Bundle "git://github.com/rodjek/vim-puppet.git"
" Scala
Bundle 'derekwyatt/vim-scala'

" no vi compatibility
set nocompatible
" enable unsaved buffers
set hidden
" remember more commands and search history
set history=1000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=85
"Makes vim notice the rvm configuration
set shell=/bin/sh
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" intuitive backspacing in insert mode
set backspace=indent,eol,start
" status line
set showcmd
" file syntax color on
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu

let mapleader = ","
" punish slow fingers, fix O lag
:set timeout timeoutlen=3000 ttimeoutlen=100

" colors
:set t_Co=256
:set background=dark

" encoding
set encoding=utf-8

" shows unwanted whitespace
set listchars=tab:-✈,trail:,extends:>
set list!

" indicates a fast terminal connection
set ttyfast

" save the file when you change buffers
set autowrite  " Writes on make/shell commands

" remove swap and backup files from your working directory
set backupdir=~/.vim/backups,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/backups,~/.tmp,~/tmp,/var/tmp,/tmp

" change buffer mapping
nnoremap <leader>, :b#<CR>

" remove spaces mapping
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>T :%s/\t/  /<cr>

" Escape with jj
imap jj <Esc>

" ctrlp options
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 2
set wildignore+=*.o,*.obj,.git,*.swp,tmp,node_modules
" let g:ctrlp_custom_ignore = '\.git$\|\.svn$|\.swp$|\.o$'
map <leader>b :CtrlPBuffer<cr>

if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
" Stolen from Gary Bernhardt
" (https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
" Stolen from Gary Bernhardt
" (https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
" Stolen from Gary Bernhardt
" (https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
" Stolen from Gary Bernhardt
" (https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
