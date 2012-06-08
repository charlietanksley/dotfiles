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

# PATH }}}
# PROMPT {{{
autoload -U promptinit
promptinit


# function cwt_rbenv_version {
#   rbenv version-name
# }
PROMPT='$ '
# PROMPT='\n$(rbenv version-name) '
# \[\033[1;33m\]\W\[\033[0m\] $(altered_ps1_git)\n$ '

# %{$fg_bold[green]%}%p%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# # $ '
# #RPROMPT='$(rbenv version-name)'
# RPROMPT='%{$fg[green]%}$(rbenv version-name)%{$reset_color%}'

# ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}*%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

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

eval "$(rbenv init -)"

# RBENV }}}
