ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"

plugins=(aws autoenv brew docker git pip tmux virtualenv virtualenvwrapper)

# Base 16
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.colours/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

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
export VIRTUAL_ENV_DISABLE_PROMPT=1
source "/usr/local/bin/virtualenvwrapper.sh"

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

# The next line updates PATH for the Google Cloud SDK.
source '/Users/chrisreeves/.gcloud/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/chrisreeves/.gcloud/google-cloud-sdk/completion.zsh.inc'

alias sfmscores="http http://20.0.10.171:38000/scores/week | jq -c '.scores[]' | json2csv -k displayName,score -p | csvlook"
