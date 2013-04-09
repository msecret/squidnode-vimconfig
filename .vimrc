
call pathogen#runtime_append_all_bundles()
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

