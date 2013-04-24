# PATH {{{
# HASKELL
export PATH=~/.cabal/bin:$PATH
# NODE
export PATH=/usr/local/share/npm/bin:/usr/local/lib/node_modules:$PATH
# VARIOUS EXECUTABLES
export PATH=~/.bin:~/bin:$PATH
# GIT ACHIEVEMENTS
export PATH=~/.git-achievements:$PATH

# POSTGRESQL.APP
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
# TEXLIVE
export PATH=/usr/texbin:$PATH
# HOMEBREW
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# RBENV
# export PATH="$HOME/.rbenv/bin:$PATH"

# PATH }}}
# VARIABLES {{{

export EDITOR='vim'
export EMACS_VERSION='24.3'

# VARIABLES }}}
# export PATH=$PATH:/usr/local/bin:~/.cabal/bin:~/.bin:/usr/local/sbin:/usr/local/share/npm/bin:~/.git-achievements:~/bin
# export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
# export RBXOPT=-Xrbc.db=$HOME/.rbx
# export NODE_PATH=/usr/local/lib/node_modules:$PATH

# source ~/.git-completion.bash
source ~/.inputrc

## Prompt {{{
## git function lifted from RVM contrib file {{{
ps1_git_status()
{
  local git_status="$(git status 2>/dev/null)"

  [[ "${git_status}" = *deleted* ]]                    && printf "%s" "-"
  [[ "${git_status}" = *Untracked[[:space:]]files:* ]] && printf "%s" "+"
  [[ "${git_status}" = *modified:* ]]                  && printf "%s" "*"
}

altered_ps1_git()
{
  local branch="" sha1="" line="" attr="" color=0

  shopt -s extglob # Important, for our nice matchers :)

  command -v git >/dev/null 2>&1 || {
    printf " \033[1;37m\033[41m[git not found]\033[m "
    return 0
  }

  branch=$(git symbolic-ref -q HEAD 2>/dev/null)

  (( $? > 0 )) && return 0 # Not in a git repo, no need to continue.

  branch=${branch##refs/heads/}

  # Now we display the branch.
  sha1=$(git rev-parse --short --quiet HEAD)

  case "${branch:-"(no branch)"}" in
   production|prod) attr="1;37m\033[" ; color=41 ;; # red
   master|deploy)   color=31                     ;; # red
   stage|staging)   color=33                     ;; # yellow
   dev|develop|development) color=34             ;; # blue
   next)            color=36                     ;; # gray
   *)
     if [[ -n "${branch}" ]] ; then # Feature Branch :)
       color=32 # green
     else
       color=0 # reset
     fi
     ;;
  esac

  [[ $color -gt 0 ]] &&
    # printf "\033[${attr}${color}m(git:${branch}$(ps1_git_status):$sha1)\033[0m "
    printf "\033[${attr}${color}m${branch}$(ps1_git_status)\033[0m "
}

#}}}
function cwt_rbenv_version {
  rbenv version-name
}

# export PS1='\n$(rbenv version-name) \[\033[1;33m\]\W\[\033[0m\] $(altered_ps1_git)\n$ '
export PS1='\n\[\033[1;33m\]\W\[\033[0m\] $(altered_ps1_git)\n$ '
export PS2='more => '

# }}}
## Aliases {{{

# must have color ls output
alias ls='ls -G'

# When do you not want tig --all
alias tig='tig --all'

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
# binstubs!
alias bi='bundle install --binstubs b'

# Padrino
if [ -e "$(pwd)/bin/padrino" ]; then
  alias p="$(pwd)/bin/padrino"
else
  alias p="bundle exec padrino"
fi

# alias cd='my-cd'

# Alias git to hub, because Github is our friend
alias git='hub'

# I can't remember the lousy commands for working on Rubinius

alias failing='bin/mspec tag --list fails :files'
alias incomplete='bin/mspec tag --list incomplete :files'

function znc_webadmin {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --explicitly-allowed-ports=6666
}
# }}}
## Various commands {{{

#if [ -f . `brew --prefix`/etc/profile.d/z.sh ]; then
  # . `brew --prefix`/etc/profile.d/z.sh
#fi

# }}}
# OPTIONS {{{

shopt -s autocd
shopt -s histappend

# export CDPATH=~/code/demandbase:~/code:$CDPATH

# }}

## DEVELOPMENT
export ADMIN_PASSWORD='password'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# export PATH="$HOME/.rbenv/bin:$PATH"
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
chruby 1.9.3-p194
