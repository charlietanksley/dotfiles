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
" vim_flog {{{
"Bundle 'fousa/vim-flog.git'

"silent exe 'g:flog_enable'

" vim_flog }}}
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
" ctrlp {{{

"Bundle 'kien/ctrlp.vim.git'
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" ctrlp }}}
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
" HaskellMode {{{
"Bundle 'ehamberg/haskellmode-vim.git'
"
"au Bufenter *.hs compiler ghc
"" Configure browser for haskell_doc.vim
"let g:haddock_browser = "open"
"let g:haddock_browser_callformat = "%s %s"

" END HaskellMode }}}
" Superior Haskell Interaction Mode {{{
"Bundle 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM.git'
"
""let g:shim_quickfix = "true"
""let g:shim_defaultWindowSize = 15
"
"autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
"autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>

" Superior Haskell Interaction Mode }}}
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

Bundle 'charlietanksley/simplefold'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'ervandew/supertab.git'
Bundle 'vim-scripts/Align.git'
Bundle 'charlietanksley/snipmate.vim.git'
Bundle 'tpope/vim-rails.git'
Bundle 'vim-scripts/bufexplorer.zip.git'
Bundle 'sjbach/lusty.git'

" HTML, CSS, JavaScript, CoffeeScript
Bundle 'bbommarito/vim-slim'
Bundle 'pangloss/vim-javascript'
Bundle 'juvenn/mustache.vim.git'
Bundle 'tpope/vim-ragtag'
Bundle 'kchmck/vim-coffee-script.git'

" Colorschemes
Bundle 'vim-scripts/ScrollColors.git'
Bundle 'altercation/vim-colors-solarized'

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


" END PLUGIN SPECIFIC BINDINGS AND CONFIGURATIONS }}}
" STUFF I GRABBED FROM DESTROY ALL SOFTWARE {{{
" https://www.destroyallsoftware.com/file-navigation-in-vim.html

"" I don't use Command-T right now, maybe I will though?
"" Open files with <leader>f
"map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
"" Open files, limited to the directory of the current file, with <leader>gf
"" This requires the %% mapping found below.
"map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
"map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
"map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
"map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
"map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
"map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
"map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
"map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>

"" Rails specific bindings
"map <leader>gr :topleft :split config/routes.rb<cr>
"map <leader>gg :topleft 100 :split Gemfile<cr>
"
"" Current routes in a split
"function! ShowRoutes()
"  " Requires 'scratch' plugin
"  :topleft 100 :split __Routes__
"  " Make sure Vim doesn't write __Routes__ as a file
"  :set buftype=nofile
"  " Delete everything
"  :normal 1GdG
"  " Put routes output in buffer
"  :0r! rake -s routes
"  " Size window to number of lines (1 plus rake output length)
"  :exec ":normal " . line("$") . "_ "
"  " Move cursor to bottom
"  :normal 1GG
"  " Delete empty trailing line
"  :normal dd
"endfunction
"map <leader>gR :call ShowRoutes()<cr>
"
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

"" Run only the tests you want while moving around
"function! RunTests(filename)
"    " Write the file and run tests for the given filename
"    :w
"    :silent !echo;echo;echo;echo;echo
"    exec ":!bundle exec rspec " . a:filename
"endfunction
"
"function! SetTestFile()
"    " Set the spec file that tests will be run for.
"    let t:grb_test_file=@%
"endfunction
"
"function! RunTestFile(...)
"    if a:0
"        let command_suffix = a:1
"    else
"        let command_suffix = ""
"    endif
"
"    " Run the tests for the previously-marked file.
"    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
"    if in_spec_file
"        call SetTestFile()
"    elseif !exists("t:grb_test_file")
"        return
"    end
"    call RunTests(t:grb_test_file . command_suffix)
"endfunction
"
"function! RunNearestTest()
"    let spec_line_number = line('.')
"    call RunTestFile(":" . spec_line_number)
"endfunction
"
"" Run this file
"map <leader>t :call RunTestFile()<cr>
"" Run only the example under the cursor
"map <leader>T :call RunNearestTest()<cr>
"" Run all test files
"map <leader>a :call RunTests('spec')<cr>
"
"" Switch between the last two files	
""nnoremap <leader><leader> <c-^> 

" END STUFF I GRABBED FROM DESTROY ALL SOFTWARE }}}
