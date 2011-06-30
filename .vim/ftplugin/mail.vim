setlocal spell
setlocal nosmartindent
setlocal textwidth=72  " max line length
setlocal formatoptions+=tcoqalw "added my stuff plus this other guys!-- I don't 
                              " think the w is good
setlocal comments+=n:\|  " '|' is a quote char.
setlocal comments+=n:% " '%' as well.


"----------------------------------------------------------------------------
""   Replacing empty quoted lines (e.g. "> $") with empty lines
""   (convenient to automatically reformat one paragraph)
"" ----------------------------------------------------------------------------

"function! Mail_Del_Empty_Quoted()
"    exe "normal :%s/^>[[:space:]\%\|\#>]\\+$//e\<CR>"
"  endfunction
"
"
"
"  "" ----------------------------------------------------------------------------
"  ""   Moving the cursor at the begining of the mail
"  "" ----------------------------------------------------------------------------
"
function! Mail_Begining()
  exe "normal gg"
    if getline (line ('.')) =~ '^From: '
          " if we use edit_headers in Mutt, then go after the headers
      exe "normal /^$\<CR>"
    endif
endfunction
"
"
""----------------------------------------------------------------------------
"""
"""   Initializations
"""
""" ----------------------------------------------------------------------------
"
""call Mail_Erase_Sig()
"call Mail_Del_Empty_Quoted()
call Mail_Begining()
