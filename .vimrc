set nocompatible

call pathogen#incubate()
call pathogen#helptags()
filetype plugin indent on

" Command-T
let g:CommandTMaxFiles=80000
let g:CommandTMaxDepth=25
let g:CommandTMaxCachedDirectories=300
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
map <leader>vs :split :CommandTFlush<cr>\|:CommandT app/views<cr>

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <leader>l :TagbarOpen fj<CR>
let g:tagbar_type_javascript = {
  \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }

" Showmarks
let g:showmarks_enable=1

set autoindent  "If you're indented, new lines will also be indented
set autoread "Reload file when changed.
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
set wildmenu
set wildmode=longest,list,full

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

"swaps out curor on insert for line
augroup CursorSwap
  autocmd!
  autocmd InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  autocmd InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  autocmd VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
augroup END


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
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
