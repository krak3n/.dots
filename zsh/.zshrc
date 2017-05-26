#
# Oh My ZSH
#

# ZSH Home
ZSH=$HOME/.oh-my-zsh

# Set Theme
export ZSH_THEME="chris"

# Set plugins
plugins=(git autoevnv)

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

#
# GCloud SDk
#

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/chris/google-cloud-sdk/path.zsh.inc' ]; then source '/home/chris/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/chris/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/chris/google-cloud-sdk/completion.zsh.inc'; fi

#
# Misc
#

# Set default Editor to Vim
export EDITOR='vim'

# Pretty json
alias mjson='python -mjson.tool'

# SFM Scores
alias sfmscores="http http://localhost:5000/scores/week | jq -c '.scores[]' | json2csv -k position,displayName,score -p | csvlook"

# Linuxbrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

# Autoenv
source /home/linuxbrew/.linuxbrew/opt/autoenv/activate.sh

# Copy / Paste integration aliases
alias cc='xclip -selection clipboard'
alias cv='xclip -selection clipboard -o'

# Private Aliases
[ -f .aliases ] && source .aliases

# Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
