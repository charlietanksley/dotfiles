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
"Bundle "mikewest/vimroom"
"Bundle "gregsexton/gitv"
"Bundle "vim-scripts/Specky.git"
Bundle "duskhacker/sweet-rspec-vim"
" |sweet-rspec-vim-keybindings|
Bundle "vim-scripts/L9.git"
Bundle "vim-scripts/FuzzyFinder.git"
" |FuzzyFinder-keybindings|

" My forks/scripts
Bundle "charlietanksley/snipmate.vim.git"
Bundle "charlietanksley/slimv.vim.git"
Bundle "charlietanksley/simplefold.git"

" Utilities
Bundle "tpope/vim-endwise.git"
Bundle "tpope/vim-fugitive.git"
Bundle "tpope/vim-surround.git"
Bundle "scrooloose/nerdcommenter.git"
Bundle "vim-scripts/taglist.vim"
"Bundle "tpope/vim-unimpaired.git"
"Bundle "chrismetcalf/vim-yankring.git"
Bundle "vim-scripts/Align.git"
Bundle "ervandew/supertab.git"
Bundle "vim-scripts/bufexplorer.zip.git"
Bundle "scrooloose/nerdtree.git"
"Bundle "vim-scripts/TaskList.vim.git"
Bundle "scrooloose/syntastic.git"
Bundle "majutsushi/tagbar.git"

" Ruby
"Bundle "vim-shoulda.git"
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
nnoremap <silent> <leader>mtb :TagbarToggle<CR>
let g:tagbar_width = 30





" Rainbows!
" From Steve Losh
nmap <leader>R :RainbowParenthesesToggle<CR>

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
" Background
"function! ToggleBackground()
"  if (w:solarized_style=="dark")
"    let w:solarized_style="light"
"    colorscheme solarized
"  else
"    let w:solarized_style="dark"
"    colorscheme solarized
"  endif
"endfunction
"command! Togbg call ToggleBackground()
"noremap <leader>tb :call ToggleBackground()<CR>
"inoremap <leader>tb :call ToggleBackground()<CR>
"vnoremap <leader>tb :call ToggleBackground()<CR>

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
map <silent> <F3> :call BufferList()<CR>
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold
hi BufferNormal term=NONE ctermfg=black ctermbg=darkcyan cterm=NONE


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

" from http://nvie.com/posts/how-i-boosted-my-vim/
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clojure stuff (from writequit.org)
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

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

" *FuzzyFinder-keybindigs*
" FuzzyFinder stuff:
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> sj     :FufBuffer<CR>
nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> s<C-k> :FufFile<CR>
nnoremap <silent> sl     :FufCoverageFileChange<CR>
nnoremap <silent> sL     :FufCoverageFileChange<CR>
nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> s.     :FufBufferTagAll<CR>
nnoremap <silent> s>     :FufBufferTagAll!<CR>
vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> sg     :FufTaggedFile<CR>
nnoremap <silent> sG     :FufTaggedFile!<CR>
nnoremap <silent> so     :FufJumpList<CR>
nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sy     :FufLine<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
nnoremap <silent> sr     :FufRenewCache<CR>

" *sweet-rspec-vim-keybindings*
set macmeta
"(CMD-r)  or (Apple-r)
map <D-r> :SweetVimRspecRunFile<CR>
"(SHIFT-CMD-r) 
map <D-R> :SweetVimRspecRunFocused<CR>
"(OPT-CMD-r)
map <M-D-r> :SweetVimRspecRunPrevious<CR>

" My functions and commands
"function AddBlankLinesAbove()
"  let s:blank_counter = 0
"  let s:save_cursor = getpos(".")
"  while s:blank_counter < v:count1
"    call append(line('.'), '')
"    let s:blank_counter += 1
"  endwhile
"  "call setpos('.', s:save_cursor)
"endfunction
"
"function AddBlankLinesBelow()
"  let s:blank_add_to_line = line('.') + 1
"  let s:save_cursor = getpos(".")
"  let s:blank_counter = 0
"  call setpos('.', [v:beval_bufnr, s:blank_add_to_line, 0, 0])
"  call setpos('.', s:save_cursor)
"endfunction

function AddBlankLinesBelow()
  let s:blank_counter = 0
  while s:blank_counter < v:count1
    call append(line('.'), '')
    let s:blank_counter += 1
  endwhile
endfunction

"function AddBlankLinesAbove()
"  let s:blank_current_line = getpos(".")
"  let s:blank_list = ['', '', '', '']
"  call set
"  call add(s:blank_list, 'this text')
"  call setpos('.', s:blank_current_line)
"
"  "let s:blank_one_above = line('.') - 1
"  "call setpos('.', [v:beval_bufnr, s:blank_one_above, 0, 0])
"  "call AddBlankLinesBelow()
"  "call setpos('.', s:blank_current_line
"endfunction
"
"nnoremap <silent> [<space> :<C-U>call AddBlankLinesAbove()<CR>
nnoremap <silent> ]<space> :<C-U>call AddBlankLinesBelow()<CR>


function CrazyTest()
  echo line('.')
endfunction
