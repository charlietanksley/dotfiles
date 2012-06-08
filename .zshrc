autoload -U compinit
compinit


# Navigation completion with arrow keys?
zstyle ':completion:*' menu select

# complete commandline switches
setopt completealiases

# use emacs keybindings
bindkey -e


# ZSH! WITH ANTIGEN {{{

source ~/.zsh/antigen/antigen.zsh

# A few choice bits from the oh-my-zsh library:
# bundle https://github.com/robbyrussell/oh-my-zsh.git lib/git.zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
bundle heroku
bundle brew
bundle gem

# Syntax highlighting bundle.
bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
bundle-apply

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
PROMPT='%F{yellow}%c${vcs_info_msg_0_}%F{blue} %(?/%F{blue}/%F{red})%% %{$reset_color%}'
RPROMPT='$(cwt_ruby_version)'

# PROMPT }}}
## ALIASES {{{

alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
alias git='hub'

# Shortcut command aliases, generic
alias m='mutt'

# make bundle exec easer to use:
alias bi='bundle install --binstubs b'

## END ALIASES }}}
## VARIOUS COMMANDS {{{


## END VARIOUS COMMANDS }}}
# RBENV {{{

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# RBENV }}}
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/charlietanksley/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
