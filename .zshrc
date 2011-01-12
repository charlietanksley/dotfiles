#export PATH=/usr/local/bin:$PATH:~/.cabal/bin/:~/.bin/:/usr/local/sbin
export PATH=$PATH:~/.cabal/bin:~/.bin
export PATH=/usr/local/bin:$PATH:~/.cabal/bin/:~/.bin/:/usr/local/sbin:~/.git-achievements
source ~/.git-completion.bash

#----------------#
# Set up aliases #
#----------------#

# Generic aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
#alias grep=egrep
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

# Shortcut command aliases, generic
alias m='mutt'

# keybindings?
bindkey -v

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# PROMPT

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
#
#The Ruby Version Manager stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
