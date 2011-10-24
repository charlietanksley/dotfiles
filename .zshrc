# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="charlietanksley"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew heroku git)

source $ZSH/oh-my-zsh.sh
#source $HOME/.git-completion.bash

# Customize to your needs...

## PATH {{{

# RBENV
export PATH=$HOME/.rbenv/bin:$PATH
# HOMEBREW
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# HASKELL
export PATH=~/.cabal/bin/:$PATH
# NODE
export PATH=/usr/local/share/npm/bin:$PATH
# VARIOUS EXECUTABLES
export PATH=~/.bin/:~/bin:$PATH
# GIT ACHIEVEMENTS
export PATH=~/.git-achievements:$PATH

## END PATH }}}
## ALIASES {{{

alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
alias git='hub'

# Shortcut command aliases, generic
alias m='mutt'

# make bundle exec easer to use:
alias be='bundle exec'

## END ALIASES }}}
## VARIOUS COMMANDS {{{

if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
  . `brew --prefix`/etc/profile.d/z.sh
fi


## END VARIOUS COMMANDS }}}
# RBENV
eval "$(rbenv init -)"
