colorscheme peaksea
set diffopt=filler
set diffopt+=iwhite

" All these come from comments on
" http://blog.objectmentor.com/articles/2008/04/30/vim-as-a-diff-merge-tool
nnoremap <Leader>u :diffupdate<cr>
nnoremap <Leader>g :diffget<cr>
nnoremap <Leader>p :diffput<cr>

nmap <F7> [czz
nmap <F8> ]czz
nmap <F2> do
nmap <F3> dp

" I made this one up:
nmap <F9> <C-w><C-w>


set columns=300
