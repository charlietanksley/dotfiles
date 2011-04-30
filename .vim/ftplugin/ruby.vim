setlocal textwidth=72
setlocal formatoptions+=c

map <leader>rss :!rspec <C-R>=expand("%")<CR> --format nested<CR>
map <leader>rsr :!rspec <C-R>=expand("%:p:h:h:h")<CR>/spec/<C-R>=expand("%:t:r")<CR>_spec.rb --format nested<CR>
"nmap <buffer> <leader>rs RunSpec
"nmap <buffer> <leader>rS RunSpecs
