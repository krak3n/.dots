ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"

# Base 16
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.colours/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

plugins=(aws autoenv brew docker git pip tmux vagrant virtualenv virtualenvwrapper)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export EDITOR='vim'

# Language
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Virtualenv
export DISABLE_VENV_CD=1

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

## Docker
if [ ! -n "$DOCKER_IP" ]; then
    echo "Setting up Docker..."
    eval "$(docker-machine env default)"
    export DOCKER_IP=$(docker-machine ip default)
fi;

# GO
export PATH=$PATH:/usr/local/go/bin

# Docker Compose Alias
alias compose='docker-compose'

# Default Vagrant
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/chrisreeves/.gcloud/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/chrisreeves/.gcloud/google-cloud-sdk/completion.zsh.inc'
