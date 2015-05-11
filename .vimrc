set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chrisbra/csv.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'dougireton/vim-chef'
Plugin 'edkolev/tmuxline.vim'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'mileszs/ack.vim'
Plugin 'skammer/vim-css-color'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

Bundle 'lepture/vim-jinja'


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

" syntastic default options
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'

" syntax checking
let g:syntastic_python_checkers = ['pep8', 'pylint']
let g:syntastic_html_checkers = ['tidy5', 'tidy']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_js_checks = ['jshint', 'eslint']
let g:syntastic_es6_checks = ['eslint']
let g:syntastic_json_checks = ['jsonlint']
let g:syntastic_go_checks = ['golint', 'gofmt', 'go']
let g:syntastic_hs_checks = ['hlint', 'hdevtools']
let g:syntastic_md_checks = ['mdl']
let g:syntastic_less_checks = ['lessc']
let g:syntastic_less_options = "--no-color"
let g:syntastic_ruby_checks = ['mri', 'rubylint']
let g:syntastic_scss_checks = ['sassc', 'scss_lint']
let g:syntastic_ts_checks = ['tsc', 'tslint']

syntax on
colorscheme base16-eighties
let guifont="Sauce Code Powerline Plus Nerd File Types:h14"

