"setlocal formatoptions+=tcwa
" The a option is messed up for some reason
setlocal formatoptions+=twc
setlocal textwidth=70  " max line length

" Open current file in skim
map <silent> <leader>ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf %<CR>

" Open log in a split window:
map <leader>lo :sp <C-R>=expand("%:p:r").".log"<CR><CR>
