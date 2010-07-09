setlocal formatoptions+=wa

imap <buffer> [[ \begin{
"imap <buffer> <silent> ]] <C-R>=LatexBox_CloseLastEnv()<CR>
imap <buffer> <F11> <C-R>=LatexBox_FindLabelByNumberPrompt()<CR>
"vmap <buffer> <silent> <F7> <Esc>:call LatexBox_WrapSelection('')<CR>i
imap <buffer> ]] <Plug>LatexCloseLastEnv
nmap <buffer> <F5> <Plug>LatexChangeEnv
vmap <buffer> <F7> <Plug>LatexWrapSelection
vmap <buffer> <S-F7> <Plug>LatexWrapSelectionEnv
imap <buffer> ((\eqref{
map  <silent> <buffer> ¶ :call LatexBox_JumpToNextBraces(0)<CR>
map  <silent> <buffer> § :call LatexBox_JumpToNextBraces(1)<CR>
imap <silent> <buffer> ¶ <C-R>=LatexBox_JumpToNextBraces(0)<CR>
imap <silent> <buffer> § <C-R>=LatexBox_JumpToNextBraces(1)<CR>

" This is what gets synctex working---thanks, David!
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline 
  \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>
