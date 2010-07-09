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

