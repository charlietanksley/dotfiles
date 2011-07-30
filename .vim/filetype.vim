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

" Mail using QuickCursor
au BufRead,BufNewFile *.mail setfiletype mail

" Make .treetop files color/act like .rb files
au BufRead,BufNewFile *.treetop setfiletype ruby

" tex files
au BufRead,BufNewFile *.tex setfiletype tex

" Php files
"au BufRead,BufNewFile *.php setfiletype php

" Scheme
au BufNewFile,BufRead *.scm call PareditInitBuffer()
au BufNewFile,BufRead *.scm setfiletype scheme

" CSV files
if exists ("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1
au! BufRead,BufNewFile *.csv,*.dat setfiletype csv

" ORGMODE
augroup org
  au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
  au BufRead,BufNewFile *.org            call org#SetOrgFileType()
  au BufRead *.org :PreLoadTags
  au BufWrite *.org :PreWriteTags
  au BufWritePost *.org :PostWriteTags
  "colorscheme org_dark
  "setlocal list
  let g:org_todo_setup='TODO | DONE'
  "let g:org_tag_setup='{@home(h) @work(w) @tennisclub(t)} \n {easy(e) hard(d)} \n {computer(c) phone(p)}'
augroup END
