export PATH=$PATH:~/.cabal/bin/:~/.bin/

# Todo list function:
 t() {
   if [[ "$*" == "" ]] ; then
     cat ~/.t
   else 
     rm ~/.t ; echo "$*" > ~/.t 
   fi 
 }

# Set up aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias grep=egrep
alias ll='ls -l'
alias la='ls -a'
alias ls='ls -G'

# git aliases
alias gl='git log --oneline'
alias gln='git log --oneline --name-only'
alias gitx='gitx --all'

# Directory Aliases
alias zproof4d='cd ~/Documents/C/Proof4D'
alias zbib='cd ~/Library/texmf/bibtex/bib'
alias zwb='cd ~/Documents/C/web/blog'
alias zwl='cd ~/Documents/C/web/latex'
alias zdaup='cd ~/Documents/C/DAUP'
alias zuc='cd ~/Documents/C/vagueUC'

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# List only file beginning with "."
alias lsa='ls -ld .*'


# keybindings?
bindkey -v

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# PROMPT
# fancy pronpt functions from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
#
# Git repo function
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  echo '○'
}
#

# promptinit
autoload -U colors && colors
PROMPT="
%{${fg_no_bold[red]}%}%~%{${fg_no_bold[white]}%}
=> "


# complietions
autoload -U compinit
compinit

# directory navigation
setopt autocd autopushd pushdignoredups

# Change colors of ls
#export LS_COLORS=cxfxcxdxbxegedabagacad
