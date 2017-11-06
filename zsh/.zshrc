#
# Oh My ZSH
#

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# General
#

# Set default Editor to Vim
export EDITOR='vim'

# Pretty json
alias mjson='python -mjson.tool'

# Copy / Paste integration aliases
alias cc='xclip -selection clipboard'
alias cv='xclip -selection clipboard -o'

# Autoenv
[[ -s "/usr/local/bin/activate.sh" ]] && source "/usr/local/bin/activate.sh"



#
# Python
#

# Virtualenv
export DISABLE_VENV_CD=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

#
# Go
#

[[ -s "/home/chris/.gvm/scripts/gvm" ]] && source "/home/chris/.gvm/scripts/gvm"

#
# ZShell
#

# ZSH Home
ZSH=$HOME/.oh-my-zsh

# Set Theme
export ZSH_THEME="chris"

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Private Aliases
[ -f $HOME/.aliases ] && source $HOME/.aliases

#
# GCloud SDk
#

[ -f $HOME/.gcloud/google-cloud-sdk/path.zsh.inc ] && source $HOME/.gcloud/google-cloud-sdk/path.zsh.inc
[ -f $HOME/.gcloud/google-cloud-sdk/completion.zsh.inc ] && source $HOME/.gcloud/google-cloud-sdk/completion.zsh.inc
[ -f $HOME/.gcloud/google-cloud-sdk/bin/kubectl ] && source <(kubectl completion zsh)

# Set plugins
plugins=(ssh git go docker autoenv pip virtualenvwrapper)
