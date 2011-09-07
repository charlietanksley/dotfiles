" VUNDLE {{{
" VUNDLE SETUP {{{

set nocompatible
filetype off

set rtp +=~/.dotfiles/.vim/vundle.git/
call vundle#rc()

" END VUNDLE SETUP }}}
" BUNDLES {{{

" Key commands:
" :BundleInstall for main install
" :BundleInstall! will install/update all
" :Bundle "foo" searches for foo.
" :BundleClean will remove deleted bundles

" Utilities
Bundle 'tpope/vim-fugitive.git'
" |fugitive| 
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'vim-scripts/taglist.vim'
" |taglist|
Bundle 'vim-scripts/Align.git'
Bundle 'ervandew/supertab.git'
Bundle 'vim-scripts/bufexplorer.zip.git'
Bundle 'scrooloose/nerdtree.git'
" |NERDTree|
Bundle 'scrooloose/syntastic.git'
" |syntastic|
Bundle 'Lokaltog/vim-easymotion.git'
" |easymotion|
Bundle 'sjbach/lusty.git'
Bundle 'roman/golden-ratio.git'
" |golden_ratio|
Bundle 'charlietanksley/snipmate.vim.git'
Bundle 'charlietanksley/simplefold.git'

" Ruby
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-rails.git'
Bundle 'duskhacker/sweet-rspec-vim'
" |sweet_rspec_vim|
Bundle 'fousa/vim-flog.git'
" |vim_flog|

" Scheme
Bundle 'charlietanksley/slimv.vim.git'
Bundle 'charlietanksley/Rainbow-Parenthsis-Bundle.git'
" |Rainbow_Parenthesis|

" HTML, CSS, JavaScript, CoffeeScript
Bundle 'mattn/zencoding-vim'
Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-ragtag'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'pangloss/vim-javascript'
Bundle 'juvenn/mustache.vim.git'

" Colorschemes
Bundle 'vim-scripts/up.vim.git'
Bundle 'vim-scripts/ScrollColors.git'

" LaTeX, Textile, Etc.
Bundle 'vim-scripts/LaTeX-Box.git'
Bundle 'timcharper/textile.vim.git'

" END BUNDLES }}}
" END VUNDLE }}}
" GLOBAL/GENERIC SETTINGS {{{

filetype plugin indent on

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

" use Perl/Python compatible regex formatting, not Vim's version 
nnoremap / /\v
vnoremap / /\v
" make regex searching work better w/cases--assume mixed case unless using
" caps in search string
set ignorecase
set smartcase

set incsearch
syntax on

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
set foldmethod=marker "alternatives: indent, syntax, marker (uses `{{{` to open and `}}}` to close)

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
"}}}

" map for omnicomplete
inoremap <F9> <C-X><C-O>

"" These all come from http://jetpackweb.com/blog/2010/02/15/vim-tips-for-ruby/
" bind control-l to hashrocket
imap <C-l> <Space>=><Space>
" convert word into ruby symbol
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

" Easier non-interactive command insertion
nnoremap <Space> :

nmap Q gwip
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" END GLOBAL/GENERIC (NON-PLUGIN SPECIFIC) SETTINGS/KEYBINDINGS }}}
" PLUGIN SPECIFIC BINDINGS AND CONFIGURATIONS {{{

"----------"
" LatexBox "
"----------"
" All .tex specific key mappings are in ~/.vim/ftplugin/tex.vim

let g:LatexBox_viewer = 'skim'
let g:LatexBox_latexmk_options = '-pvc' 
let g:LatexBox_cite_pattern = '\c\\\a*cite\a*\(\[.*\]\)\{0,2}\*\?\_\s*{'

"----------"
" fugitive "
"----------"
" These keybindings are all modified from the git-vim plugin:
" http://github.com/motemen/git-vim/blob/master/plugin/git.vim
nnoremap <Leader>gd :Gdiff!<Enter>
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gl :Glog<Enter>
nnoremap <Leader>ga :Git add %<CR><CR>
nnoremap <Leader>gc :Gcommit<Enter>
nnoremap <Leader>gC :Gcommit -v<Enter>

"----------"
" NERDTree "
"----------"
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=20
nmap <leader>tr :NERDTree<CR>

"-----------------"
" sweet_rspec_vim "
"-----------------"
set macmeta
"(CMD-r)  or (Apple-r)
map <D-r> :SweetVimRspecRunFile<CR>
"(SHIFT-CMD-r) 
map <D-R> :SweetVimRspecRunFocused<CR>
"(OPT-CMD-r)
map <M-D-r> :SweetVimRspecRunPrevious<CR>

"-----------"
" syntastic "
"-----------"
"let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
" Tell Syntastic to ignore Sass:
let g:syntastic_disabled_filetypes = ['sass', 'rb']

"---------------------"
" Rainbow_Parenthesis "
"---------------------"
function RainbowParenthesesOn()
  "call rainbow_parenthsis#LoadSquare ()
  call rainbow_parenthsis#LoadRound ()
  call rainbow_parenthsis#Activate ()
endfunction

nmap <leader>mr :call RainbowParenthesesOn()<CR>

"------------"
" easymotion "
"------------"
let g:EasyMotion_leader_key = '<Leader>e'

"----------"
" vim_flog "
"----------"
"silent exe 'g:flog_enable'

"--------------"
" golden_ratio "
"--------------"
" to turn off
"let g:loaded_golden_ratio = 1
" to turn off autocommand events
"let g:golden_ratio_autocommand = 0

"---------"
" taglist "
"---------"
nnoremap <silent> <leader>mtl :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1

" END PLUGIN SPECIFIC BINDINGS AND CONFIGURATIONS }}}
