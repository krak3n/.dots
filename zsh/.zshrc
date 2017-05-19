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
# Misc
#

# Set default Editor to Vim
export EDITOR='vim'

# Pretty json
alias mjson='python -mjson.tool'

# SFM Scores
alias sfmscores="http http://20.0.10.171:38000/scores/week | jq -c '.scores[]' | json2csv -k displayName,score -p | csvlook"

# Linuxbrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

# Autoenv
source /home/linuxbrew/.linuxbrew/opt/autoenv/activate.sh
