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

#--------#
# Prompt #
#--------#
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
# I'm not using this prompt, but one inspired by it you can find from this link
function parse_git_branch {
  [ -d .git ] || return 1
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="*"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " <${branch}${state}${remote}>"
  fi
}
export PS1='\n\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)\n$ '
export PS2='more => '

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
alias ggraph='git log --oneline --graph --all --decorate'
alias gvimdiff='mvim -d'
alias tig='tig --all'

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
