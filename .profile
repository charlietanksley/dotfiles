#export PATH=$PATH:~/.cabal/bin:~/.bin
export PATH=/usr/local/bin:$PATH:~/.cabal/bin/:~/.bin/:/usr/local/sbin:/usr/local/share/npm/bin:~/.git-achievements
#export PATH=/usr/local/bin:$PATH:~/.cabal/bin/:~/.bin/:/usr/local/sbin:~/.git-achievements
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
export RBXOPT=-Xrbc.db=$HOME/.rbx

source ~/.git-completion.bash
source ~/.inputrc

## Prompt {{{
# using version from: git://gist.github.com/47186.git
function parse_git_dirty {
  git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "*"
}
function parse_git_branch {
  local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
}

#export PS1='\n\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)\n$ '
#export PS2='more => '

# }}}
## Aliases {{{

# must have color ls output

alias ls='ls -G'

# git aliases
alias gl='git log --oneline'
alias gln='git log --oneline --name-only'
alias gitx='gitx --all'
alias ggraph='git log --oneline --graph --all --decorate'
alias gvimdiff='mvim -d'

# Shortcut command aliases, generic
alias m='mutt'

# make bundle exec easer to use:
alias be='bundle exec'

# }}}
## Various commands {{{

if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
  `brew --prefix`/etc/profile.d/z.sh
fi

# }}}





## RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source "$rvm_path/contrib/ps1_functions"
ps1_set
