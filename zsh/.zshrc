#
# Oh My ZSH
#

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
source /home/linuxbrew/.linuxbrew/opt/autoenv/activate.sh

#
# Linuxbrew
#

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

#
# GCloud SDk
#

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/chris/.google-cloud-sdk/path.zsh.inc' ]; then source '/home/chris/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/chris/.google-cloud-sdk/completion.zsh.inc' ]; then source '/home/chris/.google-cloud-sdk/completion.zsh.inc'; fi

#
# Python
#

# Virtualenv
export DISABLE_VENV_CD=1

#
# Go
#

# Default GOPATH
export GOPATH=~/.go
export PATH=$PATH:$GOPATH/bin

#
# Tilix Terminal Emulator
#

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

#
# ZShell
#

# ZSH Home
ZSH=$HOME/.oh-my-zsh

# Set Theme
export ZSH_THEME="chris"

# Set plugins
plugins=(git docker kubectl pip virtualenv virtualenvwrapper)

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Private Aliases
[ -f $HOME/.aliases ] && source $HOME/.aliases
