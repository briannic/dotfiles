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

# rbenv init
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

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
alias gst='git status'

# Nicer git diffs
# https://github.com/stevemao/diff-so-fancy
if ! type "diff-highlight" > /dev/null; then
  git config --global core.pager "diff-highlight | diff-so-fancy | less --tabs=1,5 -R"
fi
