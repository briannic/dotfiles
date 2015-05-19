# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="ys"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew colorize colored-man git osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# vi mode customization
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

vim_ins_mode="%{$fg_no_bold[yellow]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg_no_bold[red]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

RPROMPT='${vim_mode}'

# Use modern completion system
autoload -U compinit
compinit

# rbenv init
eval "$(rbenv init - zsh)"

# gvm init
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Customize to your needs...
export GOPATH=$HOME/go
export PATH=//anaconda/bin:/Users/bnichols/.rbenv/shims:/Users/bnichols/.rbenv/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/go/bin:$GOPATH/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# EDITOR
export EDITOR='vim'

# aliases
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias emacs='/usr/local/bin/emacs'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias ls='ls -lhaf -G'
alias cat='pygmentize -O style=monokai -f console256 -g'
alias sniff="ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias pullconsole="git pull && bundle && rake db:migrate"
alias gitdiff='git icdiff'

# ssh alias
[[ -r ./alias.zsh ]] && . ./alias.zsh
alias vim='/usr/local/opt/macvim/MacVim.app/Contents/MacOS/Vim'
# zsh options
# avoid rm * mistakes
setopt RM_STAR_WAIT

# Functions
pman () {
     man -t "${1}" | open -f -a /Applications/Preview.app
}

# Docker config
export automodeler_repo_dir=/Users/bnichols/civis
export large_tmpdir=/Users/bnichols/civis/tmp
eval $(boot2docker shellinit 2>/dev/null)

