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
# source ~/dotfiles/zshalias.zsh
export TERM='xterm-256color'

# docker-machine setup
eval "$(docker-machine env default)"

# rbenv init
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# Go setup
export GOPATH=$HOME/go
export PATH="$HOME/go/bin:$PATH"
# Python Setup
export PATH="$HOME/miniconda3/bin:$PATH"
# EDITOR
export EDITOR='nvim'

# aliases
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias emacs='/usr/local/bin/emacs'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
#alias vim='nvim'
alias ls='ls -lhaf -G'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias sniff="ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias pullconsole="git pull && bundle && rake db:migrate"
alias gitdiff='git icdiff'
alias gst='git status'

# Nicer git diffs
# https://github.com/stevemao/diff-so-fancy
if ! type "diff-highlight" > /dev/null; then
  git config --global core.pager "diff-highlight | diff-so-fancy | less --tabs=1,5 -R"
fi

# VIM Mode Keybindings
bindkey -v

# Adding preferred shortcut to enter Normal mode
bindkey jk vi-cmd-mode

# Common operations
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source "$HOME/.secrets"
source activate civis
