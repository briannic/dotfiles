#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Aliases
alias ls='ls -la --color'
alias python='python3' 
alias gst='git status'
alias gco='git checkout'
alias dotfiles='/usr/bin/git --git-dir=$HOME/src/dotfiles/ --work-tree=$HOME'

# Adding preferred shortcut to enter Normal mode
bindkey jk vi-cmd-mode

# Common operations
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward

# Vim Mode Keybindings
bindkey -v

# Go settings
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# $PATH UPDATES
export PATH=/home/brian/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

# Autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Import Secrets 
source ~/.secrets
