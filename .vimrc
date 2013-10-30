
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

set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set ts=2 sw=2 et "Tabstop spacing
set number  "Enables line numbering
set smarttab  "Improves tabbing
set smartcase
set noerrorbells
set nobackup
set ruler
set showcmd
set textwidth=80
set colorcolumn=+1
set guioptions+=a
set clipboard+=autoselect

set foldmethod=manual

"swaps out curor on insert for line
augroup CursorSwap
  autocmd!
  autocmd InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  autocmd InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  autocmd VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
augroup END


