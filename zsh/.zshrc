#
# Oh My ZSH
#

# # Set custom zsh directory
# ZSH_CUSTOM=$HOME/.zsh-custom
#
# # Set Theme
# export ZSH_THEME="chris"

# zgen lightweight plugin manager for Zsh
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/ssh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/autoenv
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/virtualenvwrapper

    zgen load superbrothers/zsh-kubectl-prompt

    zgen load krak3n/.dots zsh/chris.zsh-theme

    zgen save
fi

autoload -U colors; colors
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# General
#

# Add ~/.local/bin to path
export PATH=$PATH:~/.local/bin:~/go/bin

# Extra Completions
fpath=("$HOME/.completions" $fpath)
autoload -U compinit && compinit

# Set default Editor to Vim
export EDITOR='vim'

# Pretty json
alias mjson='python -mjson.tool'

# Copy / Paste integration aliases
alias cc='xclip -selection clipboard'
alias cv='xclip -selection clipboard -o'

# kubectl
alias kctl='kubectl'
alias kns='kubens'
alias kctx='kubectx'

# Autoenv
[[ -s "/usr/local/bin/activate.sh" ]] && source "/usr/local/bin/activate.sh"
[[ -s "$HOME/.local/bin/activate.sh" ]] && source "$HOME/.local/bin/activate.sh"



#
# Python
#

# Virtualenv
export DISABLE_VENV_CD=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

#
# Go
#

[[ -s "/home/chris/.gvm/scripts/gvm" ]] && source "/home/chris/.gvm/scripts/gvm"


# Source oh my zsh
# source $ZSH/oh-my-zsh.sh

# Private Aliases
[ -f $HOME/.aliases ] && source $HOME/.aliases

#
# GCloud SDk
#

# The next line updates PATH for the Google Cloud SDK.


if [ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/completion.zsh.inc"; fi

#
# Kubernetes
#

# Enabled kubectl
if (( $+commands[kubectl] )); then source <(kubectl completion zsh); fi
# Minikube auto completion
if (( $+commands[minikube] )); then source <(minikube completion zsh); fi

#
# Helm
#

if type helm > /dev/null; then
    source <(helm completion zsh)
fi
