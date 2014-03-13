ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"

plugins=(autoenv brew git git-flow-avh heroku pip tmux vagrant virtualenv virtualenvwrapper)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"
export EDITOR='vim'

# Language
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Tmux
export DISABLE_AUTO_TITLE=true
export TERM="xterm-256color"
alias tmux="TERM=screen-256color-bce tmux"

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Tmuxp
source $HOME/.dots/zsh/tmuxp.sh

# Pretty json
alias pretty='python -mjson.tool'
