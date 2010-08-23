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
#PS1='\n\
#\[\033[0;34m\]\$PWD\[\033[0m\]\n\
#\[\033[0;31m\]\T\[\033[0m\] => '; export PS1
#PS2="more=> "; export PS2
# Will this do git?
#PS1='\h:\@$(__git_ps1 "(%s)" \u\$'; export PS1
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

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

###############################
# Hopefully fix slideshow gem #
###############################
alias slideshow="slideshow -o slides/"

#The Ruby Version Manager stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
