set magic
set shell=/bin/sh
set modeline
set modelines=5
" filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dougireton/vim-chef'
Plugin 'edkolev/tmuxline.vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'justmao945/vim-clang'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx.git'
Plugin 'Shougo/neocomplete.vim'
Plugin 'skammer/vim-css-color'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'


call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
let base16colorspace=256
colorscheme base16-atelierdune
set background=dark
syntax enable

" Shortcut for disabling highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Shortcut for enabling and disabling paste mode
map <leader>pp :setlocal paste!<cr>

" Shortcut for enabling spelling
map <leader>ss :setlocal spell!<cr>

" Allow for macosx and tmux and vim clipboard sharing.
" Following this blog post: http://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set clipboard=unnamed

" Split 'correctly' for left-to-right readers.
set splitbelow
set splitright

set history=700

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Moving up and down faster than one row at a damn time.
"
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set noerrorbells
set novisualbell
set t_vb=

if has( 'gui_running' )

    set guifont="Inconsolata for Powerline Plus Nerd File Types Medium 11"

    set background=dark
    let g:airline_theme = 'kolor'

    let g:airline_powerline_fonts = 0
    if ! exists( 'g:airline_symbols' )
        let g:airline_symbols = {}
        let g:airline_left_sep = '»'
        let g:airline_right_sep = '«'
        let g:airline_symbols.space = "\ua0\ua0"
        let g:airline_symbols.crypt = '🔒'
        let g:airline_symbols.linenr = '␊'
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.whitespace = 'Ξ'
    endif

    autocmd! GUIEnter * set vb t_vb=

endif

set autoread "Reload file when changed.
set backspace=2  "This makes the backspace key function like it does.
set clipboard+=unnamed
set colorcolumn=80
set exrc
set expandtab
set completeopt=menuone
set foldmethod=manual
set ignorecase
set smartcase
set incsearch
set laststatus=2
set lazyredraw
set nobackup
set nowb
set noswapfile
set number  "Enables line numbering
set ruler
set showmatch "Highlights matching brackets in programming languages
set mat=2
set smartindent  "Automatically indents lines after opening a bracket
set smarttab  "Improves tabbing
set showcmd
set tm=500
set ffs=unix,dos,mac
set encoding=utf8
set ts=2 sw=2 et "Tabstop spacing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmenu
set wildmode=longest,list,full
set whichwrap+=<,>,h,l
set mouse=a
set lbr
set ai
set si

set listchars=eol:¬,tab:›·,trail:·,extends:›,precedes:‹
set list
map <leader>ll :set list!<cr>

let &path.="src/include,"

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"Key bindings
map 0 ^
if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif
nmap <leader>a :Ack<space>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call <SID>StripTrailingWhitespaces()
nmap <leader>g :GitGutterToggle<CR>
nmap <F8> :TagbarToggle<CR>
" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" replace selected text with register with r
vmap r "_dP
vmap ,d "_d

nnoremap <F5> :make!<cr>

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Plugin settings
let g:NERDSpaceDelims=1
let g:gitgutter_max_signs = 400
let g:EclimCompletionMethod = 'omnifunc'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules|bower_components|vendor)$',
    \ 'file': '\v\.(exe|o|a|so|dll)$'
    \ }
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_user_options="-std=c++11"
let g:clang_diagsopt = 'rightbelow'
let g:vim_markdown_folding_disabled = 1
let g:tmuxline_preset = {
  \'a'    : [ '#S:#I.#P', '#(/usr/local/bin/outatime)' ],
  \'b'    : [ '#(/usr/local/bin/current_itunes_song)' ],
  \'win'  : [ '#I #W' ],
  \'cwin' : [ '#I #W #F' ],
  \'x'    : [ '#(/usr/local/bin/battery -tp -g cyan -w magenta) ' ],
  \'z'    : ['%l:%M%p', '%a %m/%d'] }
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '»',
      \ 'right' : '',
      \ 'right_alt' : '«',
      \ 'space' : ' '}
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_exclude_patterns = [ 'fugitive://.*', 'scp://.*' ]

if isdirectory( expand( "~/.vim/bundle/vim-gitgutter" ) )


endif


au BufRead,BufNewFile *.jshintrc set ft=json
au BufRead,BufNewFile *.bowerrc set ft=json
au BufRead,BufNewFile *.pantheonrc set ft=json

au BufRead,BufNewFile *.txt set ft=markdown
au BufRead,BufNewFile *.text set ft=markdown

au BufRead,BufNewFile *.applescript set ft=applescript

au BufRead,BufNewFile *.eslintrc set ft=json

" syntastic default options
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:neocomplete#enable_at_startup = 1
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'

" syntax checking
let g:syntastic_python_checkers = ['pep8', 'pylint']
let g:syntastic_html_checkers = ['tidy5', 'tidy']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint']
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
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let guifont="Inconsolata for Powerline Plus Nerd File Types Medium 11"
