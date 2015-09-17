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
source ~/dotfiles/zshalias.zsh

# rbenv init
eval "$(rbenv init - zsh)"

# gvm init
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Customize to your needs...
export GOPATH=$HOME/go
export PATH=//anaconda/bin:/Users/bnichols/.rbenv/shims:/Users/bnichols/.rbenv/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/go/bin:$GOPATH/bin:$PATH

# EDITOR
export EDITOR='vim'

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

# ssh alias
if [ -f ~/dotfiles/zshalias.zsh ]; then
    source ~/dotfiles/zshalias.zsh
else
    print "404: ~/dotfiles/zshalias.zsh not found."
fi
