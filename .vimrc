		""""""""""""""""""""""""""""""""""""""""""""""""""
		""""" MACVIM SPECIFIC STUFF IS IN ~/.gvimrc """""
		""""""""""""""""""""""""""""""""""""""""""""""""""

		""""""""""""""""""""""""""""""""""""""""""""""
		"""""" SEARCH, HIGHLIGHT, SPELLING, ETC. """""
		""""""""""""""""""""""""""""""""""""""""""""""
"set hlsearch
set incsearch
syntax on

		""""""""""""""""""""""""""""""""""
		""""" GENERIC PLUGIN BEHAVIOR """"
		""""""""""""""""""""""""""""""""""
filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete
set autoread




		""""""""""""""""""
		""""" SPACING """"
		""""""""""""""""""	
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab

    """""""""""""""
    """" FOLDS """"
    """""""""""""""

set foldcolumn=4
"set foldmethod=indent "alternatives: syntax, marker (uses `{{{` to open and `}}}` to close)

    """""""""""""""""""""""""""""""
    """" SPECIFIC PLUGIN STUFF """"
    """""""""""""""""""""""""""""""
" minibufexpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" General vim stuff

" aliases?


" Vim window stuff
set linebreak
set number
set cursorline
set cursorcolumn

" Store temporary files in a central location (is this okay?)
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp


" LaTeX stuff
let g:Tex_ViewRule_pdf='Preview'

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_BIBINPUTS="/Users/charlietanksley/Library/texmf/bibtex/bib/"

" Markdown stuff
augroup markdown
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

" Git stuff:
set laststatus=2
set statusline=%{GitBranch()}

" Project plugin stuff
set nocompatible

		""""""""""""""""""""""""""""""""
		""""""""" KEYMAP STUFF """"""""
		""""""""""""""""""""""""""""""""
" To remap ii to escape?
inoremap ;; <Esc>

" Cursor movement in word wrap stuff
noremap <Up> gk 
noremap <Down> gj
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
if &wrap
echo "Wrap OFF"
setlocal nowrap
set virtualedit=all
silent! nunmap <buffer> <Up>
silent! nunmap <buffer> <Down>
silent! nunmap <buffer> <Home>
silent! nunmap <buffer> <End>
silent! iunmap <buffer> <Up>
silent! iunmap <buffer> <Down>
silent! iunmap <buffer> <Home>
silent! iunmap <buffer> <End>
else
echo "Wrap ON"
setlocal wrap linebreak nolist
set virtualedit=
setlocal display+=lastline
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>
endif
endfunction

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

set mouse=a

" keymappings for :e
map <leader>ew :e <C-R>=expand("%:p:h")."/"<CR> 
map <leader>es :sp <C-R>=expand("%:p:h")."/"<CR>
map <leader>ev :vsp <C-R>=expand("%:p:h")."/"<CR>
map <leader>et :tabe <C-R>=expand("%:p:h")."/"<CR>

" Attempt to get cursor to move right when word wrapped (from Vimcasts)
nmap j gj
nmap k gk
