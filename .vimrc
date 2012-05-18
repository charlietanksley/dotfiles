" VUNDLE {{{
" VUNDLE SETUP {{{

set nocompatible
filetype off

"set rtp +=~/.dotfiles/.vim/vundle.git/
set rtp +=~/.dotfiles/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle.git'

" END VUNDLE SETUP }}}
" BUNDLES {{{

" Key commands:
" :BundleInstall for main install
" :BundleInstall! will install/update all
" :Bundle "foo" searches for foo.
" :BundleClean will remove deleted bundles

" Utilities

" fugitive {{{
" These keybindings are all modified from the git-vim plugin:
" http://github.com/motemen/git-vim/blob/master/plugin/git.vim
Bundle 'tpope/vim-fugitive.git'

nnoremap <leader>gd :Gdiff!<Enter>
nnoremap <leader>gs :Gstatus<Enter>
nnoremap <leader>gl :Glog<Enter>
nnoremap <leader>ga :Git add %<CR><CR>
nnoremap <leader>gc :Gcommit<Enter>
nnoremap <leader>gC :Gcommit -v<Enter>

" fugitive }}}
" LatexBox {{{
" All .tex specific key mappings are in ~/.vim/ftplugin/tex.vim
Bundle 'vim-scripts/LaTeX-Box.git'

let g:LatexBox_viewer = 'skim'
let g:LatexBox_latexmk_options = '-pvc' 
let g:LatexBox_cite_pattern = '\c\\\a*cite\a*\(\[.*\]\)\{0,2}\*\?\_\s*{'

" LatexBox }}}
" taglist {{{
Bundle 'vim-scripts/taglist.vim'

nnoremap <silent> <leader>mtl :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1

" taglist }}}
" Lusty (Explorer & Juggler) {{{
Bundle 'sjbach/lusty.git'
"map <leader>ff :LustyFilesystemExplorerFromHere<CR>
"map <leader>fm :LustyFilesystemExplorer app/models<CR>
"map <leader>fc :LustyFilesystemExplorer app/controllers<CR>
"map <leader>fv :LustyFilesystemExplorer app/views<CR>
"map <leader>fh :LustyFilesystemExplorer app/helpers<CR>
"map <leader>fl :LustyFilesystemExplorer lib<CR>
"map <leader>fp :LustyFilesystemExplorer public<CR>
"map <leader>fs :LustyFilesystemExplorer specs<CR>
"map <leader>ft :LustyFilesystemExplorer test<CR>

" Lusty (Explorer & Juggler) }}}
" Rainbow Parenthesis {{{
Bundle 'charlietanksley/Rainbow-Parenthsis-Bundle.git'

function! RainbowOn()
  :call rainbow_parenthsis#LoadRound()
  :call rainbow_parenthsis#LoadSquare()
  :call rainbow_parenthsis#LoadBraces()
  :call rainbow_parenthsis#Activate()
endfunction

function! RainbowOff()
  :call rainbow_parenthsis#Clear()
endfunction

map <leader>mr :call RainbowOn()<CR>
map <leader>nr :call RainbowOff()<CR>

" Rainbow Parenthesis }}}
" Slimv {{{
Bundle 'charlietanksley/slimv.vim.git'

au BufNewFile,BufRead *.scm call PareditInitBuffer()

" Slimv }}}
" Textile {{{
Bundle 'vim-scripts/Textile-for-VIM.git'

" :TextilePreview     - Render the current buffer to a temp file, and open it in
" your web browser (OSX only)

" <Leader>rp

" :TextileRenderTab   - ... to a new tab

" <Leader>rt

" :TextileRenderFile  - ... to a file

"   <Leader>rf
 
"
" Textile }}}
" Commentary {{{
Bundle 'tpope/vim-commentary.git'
autocmd FileType scheme set commentstring=;\ %s

" }}}
" Ack {{{
Bundle 'mileszs/ack.vim.git'

" }}}
" Buffergator {{{
" Bundle 'jeetsukumaran/vim-buffergator.git'

" }}}
" Bufexplorer {{{
Bundle 'thisivan/vim-bufexplorer.git'

" }}}
" IO {{{

Bundle 'vim-scripts/Io-programming-language-syntax.git'

" }}}
" Vroom test runner {{{
Bundle 'skalnik/vim-vroom.git'

" unset existing mappings
let g:vroom_map_keys=0
let g:vroom_use_binstubs=1
let g:vroom_binstubs_path='./b'

" set some mappings
nmap <leader>tr :call vroom#RunTestFile()<CR>
nmap <leader>tR :call vroom#RunNearestTest()<CR>

" }}}

" Experiments
Bundle "michaeljsmith/vim-indent-object"
" Gundo {{{

Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" }}}
Bundle 'kikijump/tslime.vim.git'
Bundle 'jgdavey/vim-turbux.git'

" Bundle 'charlietanksley/simplefold'
Bundle 'tpope/vim-unimpaired.git'
" Bundle 'ervandew/supertab.git'
Bundle 'vim-scripts/Align.git'
Bundle 'charlietanksley/snipmate.vim.git'
Bundle 'tpope/vim-rails.git'

" HTML, CSS, JavaScript, CoffeeScript
Bundle 'bbommarito/vim-slim'
Bundle 'pangloss/vim-javascript'
Bundle 'juvenn/mustache.vim.git'
Bundle 'tpope/vim-ragtag'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'mattn/zencoding-vim.git'

" Colorschemes
Bundle 'vim-scripts/ScrollColors.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Mustang2.git'
Bundle 'vim-scripts/Ambient-Color-Scheme.git'
Bundle 'vim-scripts/BusyBee.git'
Bundle 'sjl/badwolf'

" END BUNDLES }}}
" END VUNDLE }}}
" GLOBAL/GENERIC SETTINGS {{{

filetype plugin indent on

" Use a colorscheme
colorscheme desert

" Non-relative line numbers
set number

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start

set mouse=a

" I don't like the menu (m) and toolbar (T).  They waste space.
set guioptions-=m
set guioptions-=T

" make regex searching work better w/cases--assume mixed case unless using
" caps in search string
set ignorecase
set smartcase

set incsearch
syntax on
set hlsearch
map - :nohl<CR>

set linebreak

set formatprg=par

set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

" hidden characters
set listchars=tab:▸\ ,eol:¬

" let me switch buffers with unsaved changes
set hidden

set ofu=syntaxcomplete#Complete
set autoread

" Spacing
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab

" Folds
set foldcolumn=4
set foldmethod=syntax "alternatives: indent, syntax, marker (uses `{{{` to open and `}}}` to close)
autocmd FileType tex set foldmethod=marker

" Public: Toggle between syntax and marker foldmethods.
let b:currently_using_synatx_folding=1
function! ToggleFoldMethod()
  if exists("b:currently_using_synatx_folding")
    set foldmethod=marker
    unlet b:currently_using_synatx_folding
  else
    set foldmethod=syntax
    let b:currently_using_synatx_folding=1
  endif
endfunction
noremap <silent> <Leader>mf :call ToggleFoldMethod()<CR>

" Git stuff "
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let mapleader = "\\"
let g:mapleader = "\\"

" END GLOBAL/GENERIC SETTINGS }}}
" GLOBAL/GENERIC (NON-PLUGIN SPECIFIC) KEYBINDINGS {{{

nmap <leader>si :set list!<CR>

inoremap ;; <Esc>

" Cursor movement in word wrap stuff {{{
noremap <Up> gk 
noremap <Down> gj
noremap <silent> <Leader>wl :call ToggleWrap()<CR>
function! ToggleWrap()
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
"}}}

" map for omnicomplete
inoremap <F9> <C-X><C-O>

" Clean those paragraphs easily
nmap Q gwip

" Why doesn't Y work like D and C?
nmap Y y$

" I think $ should work like g_
nnoremap $ g_

" Easier split navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" END GLOBAL/GENERIC (NON-PLUGIN SPECIFIC) SETTINGS/KEYBINDINGS }}}
" PLUGIN SPECIFIC BINDINGS AND CONFIGURATIONS {{{


" END PLUGIN SPECIFIC BINDINGS AND CONFIGURATIONS }}}
" STUFF I GRABBED FROM DESTROY ALL SOFTWARE {{{
" https://www.destroyallsoftware.com/file-navigation-in-vim.html

"" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
"map <leader>e :edit %%
"map <leader>v :view %%
"

" Make the current window big, but leave others context
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" END STUFF I GRABBED FROM DESTROY ALL SOFTWARE }}}
