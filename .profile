#export PATH=$PATH:~/.cabal/bin:~/.bin
export PATH=/usr/local/bin:$PATH:~/.cabal/bin/:~/.bin/:/usr/local/sbin:/usr/local/share/npm/bin:~/.git-achievements:~/bin
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

# Emacs from Homebrew
alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"

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
alias bep='bundle exec padrino'
alias p='padrino'

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
## git function lifted from RVM contrib file {{{
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
    #printf "\[\033[${attr}${color}m\](git:${branch}$(ps1_git_status):$sha1)\[\033[0m\] "
    printf "\033[${attr}${color}m(git:${branch}$(ps1_git_status):$sha1)\033[0m "
}

#}}}

## TMUXINATOR
export EDITOR='vim'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

## DEVELOPMENT
export ADMIN_PASSWORD='password'

## RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source "$rvm_path/contrib/ps1_functions"
export PS1='\n[$(ps1_rvm)] $(altered_ps1_git)$(ps1_git_status)\n\[\033[1;33m\]\w\[\033[0m\]\n$ ' 
export PS2='more => '
