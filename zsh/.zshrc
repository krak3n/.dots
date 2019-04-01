#
# Oh My ZSH
#

autoload -U colors; colors
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# Pre Scripts - Not Version Controlled
# Run BEFORE plugins are loaded
#

if [ -d $HOME/.zsh.pre.d ]; then
	for file in $HOME/.zsh.pre.d/**/*(.); do source $file; done
fi

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
    zgen oh-my-zsh plugins/aws

    zgen load superbrothers/zsh-kubectl-prompt
    zgen load krak3n/.dots zsh/chris.zsh-theme

    zgen save
fi

#
# General
#

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

# Add Go bin to Path
export PATH="$HOME/go/bin":"$PATH"
alias golm='go list -m -f '"'"'{{ .Path }} | {{ .Dir }}'"'"' all'
# Execute GVM scripts
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

#
# GCloud SDk
#

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.google/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.google/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.google/google-cloud-sdk/completion.zsh.inc"; fi

#
# Kubernetes
#

# Enabled kubectl
# if (( $+commands[kubectl] )); then
# 	alias kctl='kubectl'
# 	source <(kubectl completion zsh)
# fi
# # kubectx / kubens
# if (( $+commands[kubectx] )); then
# 	alias kctx='kubectx'
# fi
# if (( $+commands[kubens] )); then
# 	alias kns='kubens'
# fi

#
# Helm
#

if (( $+commands[helm] )); then source <(helm completion zsh); fi

#
# GMux
#

if [ -f "$HOME/.gmux.zsh" ] && [ -f "$HOME/.gmux/autocomplete/zsh_autocomplete" ] && (( $+commands[gmux] )); then
	source "$HOME/.gmux.zsh"
fi


#
# direnv - autoenv alternative
#

eval "$(direnv hook zsh)"

#
# Post Sciprs - Not Version Controlled
#

if [ -d $HOME/.zsh.post.d ]; then
	for file in $HOME/.zsh.post.d/**/*(.); do source $file; done
fi
