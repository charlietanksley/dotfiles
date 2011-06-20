setlocal spell
setlocal nosmartindent
setlocal textwidth=72
setlocal formatoptions+=tcoqalw

" * <F1> to re-format the current paragraph correctly
" * <F2> to format a line which is too long, and go to the next line
" * <F3> to merge the previous line with the current one, with a correct
"        formatting (sometimes useful associated with <F2>)
"
" These keys might be used both in command mode and edit mode.
"
" <F1> might be smarter to use with the Mail_Del_Empty_Quoted() function
" defined below

nmap  <F1>  gqap
nmap  <F2>  gqqj
nmap  <F3>  kgqj
map!  <F1>  <ESC>gqapi
map!  <F2>  <ESC>gqqji
map!  <F3>  <ESC>kgqji
