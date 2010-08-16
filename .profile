#export PATH=$PATH:~/.cabal/bin:~/.bin
export PATH=/usr/local/bin:$PATH:~/.cabal/bin/:~/.bin/:/usr/local/sbin
source ~/.git-completion.bash
source ~/.inputrc

# Todo list function:
 t() {
   if [[ ”$*” == ”” ]] ; then
     cat ~/.t
   else 
     rm ~/.t ; echo ”$*” > ~/.t 
   fi 
 }

###
# Prompt
###
PS1="\n\
\[\033[0;34m\]\$PWD\[\033[0m\]\n\
\[\033[0;31m\]\T\[\033[0m\] => "; export PS1
PS2="more=> "; export PS2

###
# Generic aliases
###
alias ll='ls -l'
alias la='ls -a'
alias ls='ls -G'

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# List only file beginning with "."
alias lsa='ls -ld .*'

# git aliases
alias gl='git log --oneline'
alias gln='git log --oneline --name-only'
alias gitx='gitx --all'
alias ggraph='git log --oneline --graph'
alias gvimdiff='mvim -d'

# Directory Aliases
alias zbib='cd ~/Library/texmf/bibtex/bib'
alias zwt='cd ~/Documents/C/web/blog'
alias zuc='cd ~/Documents/C/vagueUC'
alias zjoy='cd ~/Documents/C/web/joy_site'
alias zpt='cd ~/Documents/C/web/philtex'
alias zpn='cd ~/Documents/C/web/philnews'
alias zms='cd ~/Documents/C/web/mysite'

# Shortcut command aliases, generic
alias m='mutt'

# Change colors of ls
#export LS_COLORS=cxfxcxdxbxegedabagacad

#The Ruby Version Manager stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
