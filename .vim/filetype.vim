" markdown filetype file
if exists("did\_load\_filetypes")
finish
endif
augroup markdown
au! BufRead,BufNewFile *.markdown   setfiletype markdown
augroup END

" tumblr theme filetype file
au BufRead,BufNewFile *.tumblr.html setfiletype tumblr

" mutt
au BufRead,BufNewFile /tmp/mutt-* setfiletype mail

" Make .treetop files color/act like .rb files
au BufRead,BufNewFile *.treetop setfiletype ruby

" tex files
au BufRead,BufNewFile *.tex setfiletype tex

" Php files
"au BufRead,BufNewFile *.php setfiletype php

" CSV files
if exists ("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1
au! BufRead,BufNewFile *.csv,*.dat setfiletype csv
