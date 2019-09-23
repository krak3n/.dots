#
# Oh My ZSH
#

autoload -U colors; colors
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

###################
# Pre run scripts
###################

if [ -d $HOME/.zsh.pre.d ]; then
	for file in $HOME/.zsh.pre.d/**/*(.); do source $file; done
fi

###################
# Plugins
###################

# Zgen Plugin Manager
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/ssh
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/httpie
    zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/fzf

    zgen load superbrothers/zsh-kubectl-prompt
    zgen load krak3n/zsh-theme krak3n.zsh-theme

    zgen save
fi

###################
# General
###################

# Extra Completions
fpath=("$HOME/.completions" $fpath)
autoload -U compinit && compinit

# Set default Editor to Vim
export EDITOR='nvim'

# Pretty json
alias mjson='python -mjson.tool'

# Copy / Paste integration aliases
if (( $+commands[xclip] )); then
	alias cc='xclip -selection clipboard'
	alias cv='xclip -selection clipboard -o'
fi

# Generate a uuid and copy it to the clipboaed
uuidv4() {
	uuidgen | tr -d '\n' | xclip -selection clipboard
}

# direnv - autoenv alternative
eval "$(direnv hook zsh)"

###################
# Languages
###################

# Python
export DISABLE_VENV_CD=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

# Go
alias golm='go list -m -f '"'"'{{ .Path }} | {{ .Dir }}'"'"' all'
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

###################
# Opperations
###################

#
# GCloud SDk
#

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.google/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.google/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.google/google-cloud-sdk/completion.zsh.inc"; fi

#
# Helm
#

if (( $+commands[helm] )); then source <(helm completion zsh); fi

###################
# Post run scripts
###################

if [ -d $HOME/.zsh.post.d ]; then
	for file in $HOME/.zsh.post.d/**/*(.); do source $file; done
fi
