
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

