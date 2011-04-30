"setlocal formatoptions+=tcwa
" The a option is messed up for some reason
setlocal formatoptions+=twc
setlocal textwidth=70  " max line length

" This is what gets synctex working---thanks, David!
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline 
  \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>
"
" Open log in a split window:
map <leader>lo :sp <C-R>=expand("%:p:r").".log"<CR><CR>
