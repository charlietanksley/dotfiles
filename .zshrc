export PATH=$PATH:~/.cabal/bin/
# MacPorts path stuff
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Pandoc alias
#alias pandoc='~/.cabal/bin/pandoc'
#alias hsmarkdown='~/.cabal/bin/hsmarkdown'
#alias markdown2pdf='~/.cabal/bin/markdown2pdf'

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

# prompt
autoload -U colors && colors
PS1="%{${fg[blue]}%}%# %{${fg[black]}%}"
RPS1="%{${fg[red]}%}%~%{${fg[black]}%}"

# complietions
autoload -U compinit
compinit

# directory navigation
setopt autocd autopushd pushdignoredups
