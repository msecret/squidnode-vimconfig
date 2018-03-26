set magic
set shell=/bin/sh
set modeline
set modelines=5

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
" Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'chemzqm/vim-jsx-improve'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elmcast/elm-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'
Plug 'reedes/vim-pencil'
if !has('nvim')
Plug 'aghareza/vim-gitgrep'
  Plug 'benmills/vimux'
  Plug 'blueyed/vim-resize'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'elzr/vim-json'
  Plug 'gko/vim-coloresque'
  Plug 'fatih/vim-go'
  Plug 'godlygeek/tabular'
  Plug 'henrik/vim-qargs'
  Plug 'Konfekt/FastFold'
  "Plug 'justmao945/vim-clang'
  Plug 'leafgarland/typescript-vim'
  Plug 'majutsushi/tagbar'
  Plug 'marijnh/tern_for_vim'
  Plug 'mileszs/ack.vim'
  Plug 'mxw/vim-jsx'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'Shougo/neocomplete.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'skammer/vim-css-color'
  Plug 'plasticboy/vim-markdown'
  " Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'wting/gitsessions.vim'
endif
if has('nvim')
  " Plug 'euclio/vim-markdown-composer'
  " Plug 'cazador481/fakeclip.neovim'
  Plug 'bagrat/vim-workspace'
  Plug 'brooth/far.vim'
  Plug 'BurningEther/nvimux'
  Plug 'carlitux/deoplete-ternjs'
  Plug 'challenger-deep-theme/vim'
  Plug 'eugen0329/vim-esearch'
  Plug 'jsfaint/gen_tags.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'mhartington/nvim-typescript'
  Plug 'mhinz/vim-grepper'
  Plug 'mhinz/vim-startify'
  Plug 'neomake/neomake'
  Plug 'othree/yajs.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
  Plug 'reedes/vim-pencil'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'ternjs/tern_for_vim', { 'do': 'yarn add && yarn global add tern' }
  Plug '/usr/local/opt/fzf'
endif

call plug#end()


if !has('nvim')
  filetype plugin indent on    " required
endif
set t_Co=256
let base16colorspace=256
colorscheme base16-eighties
set background=dark
syntax enable

" Shortcut for disabling highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Shortcut for enabling and disabling paste mode
map <leader>pp :setlocal paste!<cr>

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3

" Resize mappings
nnoremap <silent> <C-Up> :call ResizeUp()<cr>
nnoremap <silent> <C-Down> :call ResizeDown()<cr>
nnoremap <silent> <C-Right> :call ResizeRight()<cr>
nnoremap <silent> <C-Left> :call ResizeLeft()<cr>

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
        let g:airline_powerline_fonts = 1
    endif

    autocmd! GUIEnter * set vb t_vb=

endif

set autoread "Reload file when changed.

if !has('nvim')
  set backspace=2  "This makes the backspace key function like it does.
endif
set clipboard+=unnamed
set colorcolumn=80
set exrc
set secure
set expandtab
set completeopt=menuone
set foldmethod=manual
set nofoldenable
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

if has('nvim')
endif

let &path.="/usr/include/,/usr/local/include/,/usr/local/bin/,/usr/bin/"

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

if !has('nvim')
  nmap <leader>a :Ack<space>
  nmap <leader>d :NERDTreeToggle<CR>
  nmap <leader>f :NERDTreeFind<CR>
  nmap <leader>t :CtrlP<CR>
  nmap <leader>] :TagbarToggle<CR>
  nmap <leader><space> :call <SID>StripTrailingWhitespaces()
  nmap <leader>g :GitGutterToggle<CR>
  nmap <F8> :TagbarToggle<CR>
endif
" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" replace selected text with register with r
vmap r "_dP
vmap ,d "_d
autocmd VimEnter * noremap <C-l> <C-W><C-L>

nnoremap <F5> :make!<cr>

nnoremap <leader>gss :GitSessionSave<cr>
nnoremap <leader>gsl :GitSessionLoad<cr>
nnoremap <leader>gsd :GitSessionDelete<cr>


func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Plug settings
if !has('nvim')
  let g:NERDSpaceDelims=1
  let g:gitgutter_max_signs = 400
  let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules|bower_components|vendor)$',
      \ 'file': '\v\.(exe|o|a|so|dll)$'
      \ }
  "let g:clang_c_options = '-std=gnu11'
  "let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
  "let g:clang_user_options="-std=c++11"
  "let g:clang_diagsopt = 'rightbelow'
  let g:cpp_class_scope_highlight = 1

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
endif

au BufRead,BufNewFile *.jshintrc set ft=json
au BufRead,BufNewFile *.bowerrc set ft=json
au BufRead,BufNewFile *.pantheonrc set ft=json

au BufRead,BufNewFile *.txt set ft=markdown
au BufRead,BufNewFile *.text set ft=markdown

au BufRead,BufNewFile *.applescript set ft=applescript

au BufRead,BufNewFile *.eslintrc set ft=json

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

if !has('nvim')
  " let g:syntastic_debug = 3
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_loc_list_height = 4
  let g:syntastic_enable_balloons = 1
  let g:syntastic_echo_current_error = 1
  let g:syntastic_cursor_columns = 1
  let g:neocomplete#enable_at_startup = 1

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
  let g:syntastic_md_checkers = ['mdl']
  let g:syntastic_less_checks = ['lessc']
  let g:syntastic_less_options = "--no-color"
  let g:syntastic_ruby_checkers = ['mri', 'rubylint']
  let g:syntastic_scss_checkers = ['stylelint']
  let g:syntastic_ts_checkers = ['tsc', 'tslint']
  let g:syntastic_cpp_checkers = ['gcc']
  let g:syntastic_cpp_compiler = 'g++'

  let g:webdevicons_enable_ctrlp = 1
  let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '

endif

if has('nvim')
  set shell=/usr/local/bin/zsh
  let g:deoplete#enable_at_startup = 1
  let g:neomake_open_list = 2
  call neomake#configure#automake('nw', 750)
  set termguicolors
  " Javascript pllugins
  let g:deoplete#enable_ignore_case = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_camel_case = 1
  let g:deoplete#enable_refresh_always = 1
  let g:deoplete#max_abbr_width = 0
  let g:deoplete#max_menu_width = 0
  let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
  call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
  let g:tern_request_timeout = 1
  let g:tern_request_timeout = 6000
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
  let g:deoplete#sources#tss#javascript_support = 1
  let g:tsuquyomi_javascript_support = 1
  let g:tsuquyomi_auto_open = 1
  let g:tsuquyomi_disable_quickfix = 1
  let g:neomake_javascript_enabled_makers = ['eslint']
  autocmd! BufWritePost * Neomake
  let g:neomake_warning_sign = {
  \ 'text': '?',
  \ 'texthl': 'WarningMsg',
  \ }
  let g:neomake_error_sign = {
  \ 'text': 'X',
  \ 'texthl': 'ErrorMsg',
  \ }

  " don't resize shit

  " fzf plugin options
  set rtp+=/usr/local/opt/fzf
  let g:fzf_layout = { 'down': '~40%' }
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  command! -nargs=* TermSplit split | terminal <args>
  command! -nargs=* TermVSplit vsplit | terminal <args>
  command! -nargs=* TermTab tabnew | terminal <args>

  function! GFilesFallback()
    let output = system('git rev-parse --show-toplevel')
    let prefix = get(g:, 'fzf_command_prefix', '')
    if v:shell_error == 0
      exec "normal :" . prefix . "GFiles\<CR>"
    else
      exec "normal :" . prefix . "Files\<CR>"
    endif
    return 0
  endfunction

  " Auto close fzf on q
  autocmd! FileType fzf tnoremap <buffer> <leader>q <c-c>

  nnoremap <leader>t :call GFilesFallback()<CR>
  nmap <leader>c :Commits<CR>
  nnoremap <leader>x :TermSplit<CR> \| :set winfixheight<CR>
  nmap <leader>v :TermVSplit<CR> \| :set winfixwidth<CR>
  nmap <leader>n :TermTab<CR>
  nnoremap <leader>, :tabprevious<CR>
  nnoremap <leader>. :tabnext<CR>
  nnoremap <leader>[ :tabprevious<CR>
  nnoremap <leader>] :tabnext<CR>
  tnoremap <Esc> <C-\><C-n>

  nnoremap <S-J> :res +2<CR>
  nnoremap <S-K> :res -2<CR>
  nnoremap <S-H> :vertical resize -2<CR>
  nnoremap <S-L> :vertical resize +2<CR>

  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " vim-workspace
  function! g:WorkspaceSetCustomColors()
    hi! WorkspaceBufferTruncDefault cterm=bold ctermbg=10 ctermfg=8 guibg=#999999 guifg=#000000
    hi! WorkspaceIconDefault cterm=NONE ctermbg=5 ctermfg=10 guibg=#FF0000 guifg=#999999

    highlight WorkspaceBufferCurrent ctermbg=darkred ctermfg=black guibg=darkred
    highlight WorkspaceBufferActive ctermbg=darkred ctermfg=black guibg=darkred
    highlight WorkspaceBufferHidden ctermbg=black ctermfg=white guibg=black
    highlight WorkspaceTabHidden ctermbg=darkyellow ctermfg=black guibg=darkyellow
    highlight WorkspaceTabCurrent ctermbg=yellow ctermfg=white guibg=black
    highlight WorkspaceFill ctermbg=black ctermfg=white guibg=black
  endfunction

  let g:workspace_powerline_separators = 1
  let g:workspace_tab_icon = "\uf00a"
  let g:workspace_left_trunc_icon = "\uf0a8"
  let g:workspace_right_trunc_icon = "\uf0a9"
endif

let guifont="Inconsolata for Powerline Plus Nerd File Types Medium 11"

let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

