export PATH=~/.cabal/bin:$PATH
PS1="\n\
\[\033[0;34m\]\$PWD\[\033[0m\]\n\
$BOLD\u$DIM \[\033[0;31m\]\t\[\033[0m\] $ "; export PS1
PS2="more=> "; export PS2

alias ls='ls -G'
alias gl='git log --oneline --name-only'
