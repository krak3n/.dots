#!/usr/bin/env zsh

#
# Chris ZSH Theme
#

# Colours
YELLOW=003
GREY=008
BLUE=004
RED=001
MAGENTA=005
GREEN=002

# Virtualenv
function virtualenv_info {
    if [[ -n $VIRTUAL_ENV ]] then
        echo "%{$FX[reset]%} %{$FG[$GREY]%}`basename $VIRTUAL_ENV`%{$FX[reset]%} %{$FG[$MAGENTA]%}⌁%{$FX[reset]%}"
    fi
}

# Return Status Hinting
local ret_status="%(?:%{$FG[$BLUE]%}➜:%{$FG[$RED]%}➜)"

# Git Prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%(?:%{$FG[$BLUE]%}➜:%{$FG[$RED]%}➜) %{$FG[$BLUE]%}❯%{$FX[reset]%} %{$FG[$YELLOW]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FX[reset]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[$RED]%}●%{$FX[reset]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[$GREEN]%}●%{$FX[reset]%}"

# Prompts
PROMPT_USER="%{$FG[$GREY]%}%n%{$FX[reset]%} %{$FG[$YELLOW]%}❯%{$FX[reset]%}"
PROMPT_END="
%{$FG[$MAGENTA]%}❯%{$FX[reset]%} "

# Define prompts.
PROMPT='${ret_status}$(virtualenv_info) $PROMPT_USER %{$FG[$GREY]%}%.%{$FX[reset]%}$(git_prompt_info) $PROMPT_END'
