export PATH=/usr/local/bin:$PATH:~/.cabal/bin/:~/.bin/:/usr/local/sbin:/usr/local/share/npm/bin:~/.git-achievements:~/bin
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
#export RBXOPT=-Xrbc.db=$HOME/.rbx

source ~/.git-completion.bash
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
    printf "\033[${attr}${color}m(git:${branch}$(ps1_git_status):$sha1)\033[0m "
}

#}}}
function cwt_rbenv_version {
  rbenv version-name
}

#export PS1='\n$(cwt_rbenv_version) \[\033[1;33m\]\W\[\033[0m\] $(altered_ps1_git)\n$ '
export PS1='\n$(rbenv version-name) \[\033[1;33m\]\W\[\033[0m\] $(altered_ps1_git)\n$ '
export PS2='more => '

# }}}
## Aliases {{{

# Emacs from Homebrew
#alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
#alias memacs="open ~/Applications/Emacs.app"
# alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
#alias memacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs"

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

# Padrino
if [ -e "$(pwd)/bin/padrino" ]; then
  alias p="$(pwd)/bin/padrino"
else
  alias p="bundle exec padrino"
fi


# Alias git to hub, because Github is our friend
alias git='hub'

# I can't remember the lousy commands for working on Rubinius

alias failing='bin/mspec tag --list fails :files'
alias incomplete='bin/mspec tag --list incomplete :files'

# }}}
## Various commands {{{

#if [ -f . `brew --prefix`/etc/profile.d/z.sh ]; then
  . `brew --prefix`/etc/profile.d/z.sh
#fi

# }}}
## EMACS {{{

function se {
  /usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs --daemon
}

function me {
  /usr/local/Cellar/emacs/HEAD/bin/emacsclient -c -n -a '' $* &
  osascript -e "tell application \"System Events\" to set frontmost of process \"Emacs\" to true"
}

function e {
  /usr/local/Cellar/emacs/HEAD/bin/emacsclient -c -nw -a '' $*
}

function ke {
 kill `ps -A | grep emacs | grep -v grep | awk '{print $1}'`
}

# }}}


## TMUXINATOR
export EDITOR='vim'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

## DEVELOPMENT
export ADMIN_PASSWORD='password'
