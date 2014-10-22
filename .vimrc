set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/csv.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'dougireton/vim-chef'
Plugin 'edkolev/tmuxline.vim'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'jmcantrell/vim-virtualen'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe'


call vundle#end()            " required
filetype plugin indent on    " required

set autoread "Reload file when changed.
set background=dark
set backspace=2  "This makes the backspace key function like it does.
set clipboard+=unnamed
set colorcolumn=+1
set directory-=. "Don't store swap files in dir
set encoding=utf-8
set expandtab
set foldmethod=manual
set guioptions+=a
set ignorecase
set incsearch
set laststatus=2
set mouse=a  "Allows you to click around the text editor with your mouse to move
set noerrorbells
set nobackup
set number  "Enables line numbering
set ruler
set showmatch "Highlights matching brackets in programming languages
set smartcase
set smartindent  "Automatically indents lines after opening a bracket
set smarttab  "Improves tabbing
set showcmd
set textwidth=80
set ts=2 sw=2 et "Tabstop spacing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildmenu
set wildmode=longest,list,full
set mouse=a


"Key bindings
nmap <leader>a :Ack<space>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>


" Plugin settings
let g:NERDSpaceDelims=1
let g:gitgutter_max_signs = 400  
let g:EclimCompletionMethod = 'omnifunc'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|exe|so|dll|pyc)$'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" syntax checking
let g:syntastic_html_checkers = ['w3']
let g:syntastic_less_options = "--no-color"

