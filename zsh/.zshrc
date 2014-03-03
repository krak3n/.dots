ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"

plugins=(autoenv brew git git-flow-avh pip tmux virtualenv virtualenvwrapper)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"
export EDITOR='vim'

# Language
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Tmux Bug
export DISABLE_AUTO_TITLE=true

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Autoenv
