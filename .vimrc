set nocompatible
filetype off

set rtp +=~/.dotfiles/.vim/vundle.git/
call vundle#rc()
" Key commands:
" :BundleInstall for main install
" :BundleInstall! will install/update all
" :Bundle "foo" searches for foo.
" :BundleClean will remove deleted bundles

" Bundles!

" Trial
Bundle "duskhacker/sweet-rspec-vim"
" |sweet-rspec-vim-keybindings|
Bundle 'Lokaltog/vim-easymotion.git'
" |easymotion-keybindings|
Bundle 'sjbach/lusty.git'
Bundle 'thinca/vim-quickrun.git'
Bundle 'chrisbra/NrrwRgn.git'
" I'm not sure about this one.  Look into it more:
" http://www.vim.org/scripts/script.php?script_id=3664#1.1
" Bundle 'tlavi/SnipMgr.git'

"" ORGMODE TRIALS {{{
" I want to try orgmode. There are two versions.  I'm going to try and pick
" one here!
"
" The following plugins are added *just* to make the vim-orgmode plugin work:
"Bundle 'tpope/vim-speeddating.git'
"Bundle 'vim-scripts/utl.vim.git'
"Bundle 'tpope/vim-repeat.git'
"Bundle 'jceb/vim-orgmode.git'
"
" So I didn't *love* vim-orgmode.  Mostly I didn't love it because the
" documentation was terrible.  I had to do a lot of work to figure out the
" keybindings, and even after that I'm not sure I had them all or had them
" right.  Maybe the plugin is just too young?
"
" This is another option: VimOrganizer
Bundle 'hsitz/VimOrganizer.git'

" END ORMODE TRIALS }}}

" My forks/scripts
Bundle "charlietanksley/snipmate.vim.git"
Bundle "charlietanksley/slimv.vim.git"
Bundle "charlietanksley/simplefold.git"
Bundle 'charlietanksley/Rainbow-Parenthsis-Bundle.git'
" |Rainbow-Parenthesis-keybindings|

" Utilities
Bundle "tpope/vim-endwise.git"
Bundle "tpope/vim-fugitive.git"
Bundle "tpope/vim-surround.git"
Bundle "tpope/vim-unimpaired.git"
Bundle "scrooloose/nerdcommenter.git"
Bundle "vim-scripts/taglist.vim"
Bundle "vim-scripts/Align.git"
Bundle "ervandew/supertab.git"
Bundle "vim-scripts/bufexplorer.zip.git"
Bundle "scrooloose/nerdtree.git"
Bundle "scrooloose/syntastic.git"
" |syntastic_configuration|

" Ruby
Bundle "tpope/vim-rake.git"
Bundle "tpope/vim-rails.git"

" HTML, CSS, JavaScript, CoffeeScript
Bundle "mattn/zencoding-vim"
Bundle "bbommarito/vim-slim"
Bundle "tpope/vim-ragtag"
Bundle "kchmck/vim-coffee-script.git"
Bundle "pangloss/vim-javascript"
Bundle "juvenn/mustache.vim.git"

" Colorschemes
Bundle "tpope/vim-vividchalk.git"
Bundle "vim-scripts/up.vim.git"
Bundle "vim-scripts/ScrollColors.git"
Bundle "vim-scripts/devbox-dark-256.git"
Bundle "vim-scripts/chance-of-storm.git"
Bundle "altercation/vim-colors-solarized"

" LaTeX, Textile, Etc.
Bundle "vim-scripts/LaTeX-Box.git"
Bundle "timcharper/textile.vim.git"


filetype plugin indent on

" TRIAL STUFF
nnoremap <silent> <leader>mtl :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1






" various things lifted from Steve Losh:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
"set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
"set laststatus=2
"set relativenumber
"set undofile

		""""""""""""""""""""""""""""""""""""""""""""""""""
		""""" MACVIM SPECIFIC STUFF IS IN ~/.gvimrc """""
		""""""""""""""""""""""""""""""""""""""""""""""""""

" I don't like the menu (m) and toolbar (T).  They waste space.
set guioptions-=m
set guioptions-=T

" NEED TO ORGANIZE:
" this comes from stevelosh.com/blog/2010/09/coming-home-to-vim/
"
  " change the way line numbering works
set relativenumber
  " use Perl/Python compatible regex formatting, not Vim's version 
nnoremap / /\v
vnoremap / /\v
  " make regex searching work better w/cases--assume mixed case unless using
  " caps in search string
set ignorecase
set smartcase
		""""""""""""""""""""""""""""""""""""""""""""""
		"""""" SEARCH, HIGHLIGHT, SPELLING, ETC. """""
		""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
syntax on

" Vim window stuff
set linebreak
"set number
"set cursorline
"set cursorcolumn

"paragraph formatting stuff:
set formatprg=par

" Store temporary files in a central location (is this okay?)
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

" hidden character stuff
nmap <leader>si :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" let me switch buffers with unsaved changes
set hidden

		""""""""""""""""""""""""""""""""""
		""""" GENERIC PLUGIN BEHAVIOR """"
		""""""""""""""""""""""""""""""""""
"filetype plugin on
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

"------------"
" bufferlist "
"------------"
"map <silent> <F3> :call BufferList()<CR>
"let g:BufferListWidth = 25
"let g:BufferListMaxWidth = 50
"hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold
"hi BufferNormal term=NONE ctermfg=black ctermbg=darkcyan cterm=NONE


"----------------"
" LatexBox-stuff
"----------------"
" All .tex specific key mappings are in ~/.vim/ftplugin/tex.vim

let g:LatexBox_viewer = 'skim'
let g:LatexBox_latexmk_options = '-pvc' 
let g:LatexBox_cite_pattern = '\c\\\a*cite\a*\(\[.*\]\)\{0,2}\*\?\_\s*{'

"----------------"
" |Git-fugitive| "
"----------------"
" These keybindings are all modified from the git-vim plugin:
" http://github.com/motemen/git-vim/blob/master/plugin/git.vim
nnoremap <Leader>gd :Gdiff!<Enter>
"nnoremap <Leader>gD :GitDiff --cached<Enter>
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gl :Glog<Enter>
"nnoremap <Leader>ga :Gadd<Enter>
nnoremap <Leader>ga :Git add %<CR><CR>
nnoremap <Leader>gc :Gcommit<Enter>
nnoremap <Leader>gC :Gcommit -v<Enter>
"nnoremap <Leader>gp :GitPullRebase<Enter>


"-----------"
" Git stuff "
"-----------"
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"--------------"
"--------------"
" KEYMAP STUFF "
"--------------"
"--------------"
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
set mouse=a

" map for omnicomplete
inoremap <F9> <C-X><C-O>

"" These all come from http://jetpackweb.com/blog/2010/02/15/vim-tips-for-ruby/
"" and are for ruby development stuff
" bind control-l to hashrocket
imap <C-l> <Space>=><Space>
" convert word into ruby symbol
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

" Still from jetpackweb, but this is not ruby specific:
" Easier non-interactive command insertion
nnoremap <Space> :

" some mappings
nmap Q gwip
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" NERDTree stuff
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=20
nmap <leader>tr :NERDTree<CR>

" *sweet-rspec-vim-keybindings*
set macmeta
"(CMD-r)  or (Apple-r)
map <D-r> :SweetVimRspecRunFile<CR>
"(SHIFT-CMD-r) 
map <D-R> :SweetVimRspecRunFocused<CR>
"(OPT-CMD-r)
map <M-D-r> :SweetVimRspecRunPrevious<CR>

" *syntastic_configuration*
"let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
" Tell Syntastic to ignore Sass:
let g:syntastic_disabled_filetypes = ['sass']

" *Rainbow-Parenthesis-keybindings*
function RainbowParenthesesOn()
  "call rainbow_parenthsis#LoadSquare ()
  call rainbow_parenthsis#LoadRound ()
  call rainbow_parenthsis#Activate ()
endfunction

nmap <leader>mr :call RainbowParenthesesOn()<CR>

" *easymotion-keybindings*
let g:EasyMotion_leader_key = '<Leader>e'

" *orgmode-keybindings*
nmap <leader>mtd :e ~/Dropbox/orgmode.org<CR>
