#
# Oh My ZSH
#

# Set Theme
# export ZSH_THEME="chris"

# Set plugins
plugins=(git)

# Source oh my zsh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

#
# Misc
#

# Set default Editor to Vim
export EDITOR='vim'

# Pretty json
alias mjson='python -mjson.tool'

# SFM Scores
alias sfmscores="http http://20.0.10.171:38000/scores/week | jq -c '.scores[]' | json2csv -k displayName,score -p | csvlook"
