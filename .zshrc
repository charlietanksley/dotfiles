autoload -U compinit
compinit

# Navigation completion with arrow keys?
# zstyle ':completion:*' menu select
# zstyle ':completion::complete:*:git:*' ignored-patterns directories files

setopt completealiases                    # complete commandline switches

# CHANGING DIRECTORIES
setopt autocd                             # `dir` works like `cd dr`
setopt autopushd                          # make cd push directories onto stack
setopt pushdignoredups                    # don't push dirs multiple times
setopt pushdsilent                        # omit printing directory stack
alias d='dirs -v'

# HISTORY
setopt histfindnodups                     # don't show duplicates in history search

# KEYBINDINGS
bindkey -e                                # use emacs keybindings

alias ls='ls -G'                          # always use colors in ls

setopt auto_resume                        # resume bg jobs by name

# ZSH! WITH ANTIGEN {{{

source ~/.zsh/antigen/antigen.zsh

# A few choice bits from the oh-my-zsh library:
# bundle https://github.com/robbyrussell/oh-my-zsh.git lib/git.zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle heroku
antigen-bundle brew
antigen-bundle gem
antigen-bundle zsh-users/zsh-completions.git

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen-apply

# ANTIGEN }}}
# PATH {{{

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

# PATH }}}
# VARIABLES {{{

export EDITOR='vim'

# VARIABLES }}}
# PROMPT {{{

# Git in the prompt (http://briancarper.net/blog/570/git-info-in-your-zsh-prompt)
autoload -Uz vcs_info
 
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr         '%F{28}*%F{blue}'
zstyle ':vcs_info:git:*' unstagedstr       '%F{11}!%F{blue}'
zstyle ':vcs_info:git:*' formats           ' %s(%b%c%u)'
zstyle ':vcs_info:git:*' actionformats     ' [%b|%a]'

precmd () {
  vcs_info
}

function cwt_ruby_version() {
  echo $(rbenv version-name)
}

setopt prompt_subst
PROMPT='%F{yellow}%c${vcs_info_msg_0_}%F{blue} $ %F{green}%F{white}'
RPROMPT='$(cwt_ruby_version)'

# color changing prompt!: %(?/%F{blue}/%F{red})%%

# PROMPT }}}
## ALIASES {{{

alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
alias git='hub'

# Shortcut command aliases, generic
alias m='mutt'

# make bundle exec easer to use:
alias bi='bundle install --binstubs b'

# TMUX!!!

# alias tmux-buffer-to-clipboard='tmux save-buffer -|pbcopy'
# alias tmux-buffer-from-clipboard='tmux set-buffer "$(pbpaste)"'

## END ALIASES }}}
## VARIOUS COMMANDS {{{

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

## END VARIOUS COMMANDS }}}
# RBENV {{{

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# RBENV }}}
# ZAW {{{

source ~/.zsh/zaw/zaw.zsh
zstyle ':filter-select:highlight' matched fg=yellow,standout
zstyle ':filter-select' max-lines 10      # use 10 lines for filter-select
zstyle ':filter-select' max-lines -10     # use $LINES - 10 for filter-select
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search

# ZAW }}}
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/charlietanksley/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
#
export PLUGIN_DIRECTORY_PATH='/Users/charlietanksley/.dotfiles/.vim/bundle'
