"Test

"
"
"
		""""""""""""""""""""""""""""""""""""""""""""""""""
		""""" MACVIM SPECIFIC STUFF IS IN ~/.gvimrc """""
		""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme desert

		""""""""""""""""""""""""""""""""""""""""""""""
		"""""" SEARCH, HIGHLIGHT, SPELLING, ETC. """""
		""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
syntax on

" Vim window stuff
set linebreak
set number
set cursorline
"set cursorcolumn

"paragraph formatting stuff:
set formatprg=par

" Store temporary files in a central location (is this okay?)
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp


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
set foldmethod=marker "alternatives: indent, syntax, marker (uses `{{{` to open and `}}}` to close)

    """""""""""""""""""""""""""""""
    """" SPECIFIC PLUGIN STUFF """"
    """""""""""""""""""""""""""""""
" minibufexpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

      """""""""""""""""""""""""""""""""
      "                               " 
      " |LatexBox-stuff		      "
      "                               " 
      """""""""""""""""""""""""""""""""
" All .tex specific key mappings are in ~/.vim/ftplugin/tex.vim

let g:LatexBox_viewer = 'skim'
let g:LatexBox_latexmk_options = '-pvc' 
let g:LatexBox_cite_pattern = '\c\\\a*cite\a*\*\?\_\s*{'

" THIS IS THE CLUPRET

" Git stuff:
set laststatus=2
set statusline=%{GitBranch()}

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

" map for omnicomplete
inoremap <F9> <C-X><C-O>

"" These all come from http://jetpackweb.com/blog/2010/02/15/vim-tips-for-ruby/
"" and are for ruby development stuff
" bind control-l to hashrocket
imap <C-l> <Space>=><Space>"
" convert word into ruby symbol
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

" Still from jetpackweb, but this is not ruby specific:
" Easier non-interactive command insertion
nnoremap <Space> :

