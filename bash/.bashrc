#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|

# SPDX-License-Identifier: BSD-2-Clause

# Copyright (c) 2023-2024, daniyl-x
                              

### FUNCTIONS ###

is_present(){
    command -v $1 &> /dev/null
}

# Git branch function for prompt
git_branch(){
    if $(is_present git); then
        git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
    fi
}


### VARIABLES ###

# History settings
export HISTCONTROL=ignoredups 	# Ignore continuous duplicates
export HISTSIZE=10000           # Bash history size
export HISTFILESIZE=$HISTSIZE 	# Bash history file size
export HISTTIMEFORMAT="%F %T "	# Add date and timestamp to history

export GPG_TTY=$(tty)           # gpg-agent tty


### PROMPT ###

# Colors
WHITE="\[\033[0m\]"
RED="\[\033[31m\]"
GREEN="\[\033[32m\]"
BLUE="\[\033[34m\]"
PURPLE="\[\033[35m\]"
CYAN="\[\033[36m\]"

# Set prompt identifier color for root and non-root
IDCOL=$GREEN
if [ "$(id -u)" -eq 0 ]; then
    IDCOL=$RED
fi

# Unicode symbols
#BOX_H=$'\u2500'
#BOX_DR=$'\u250c'
#BOX_UR=$'\u2514'

BOX_H='\342\224\200'
BOX_DR='\342\224\214'
BOX_UR='\342\224\224'

# Git Bash Style Prompt
GIT_BASH_PS1="\n${IDCOL}\u@\h${WHITE}:${CYAN}\w${PURPLE}$(git_branch)${WHITE}\n\$ "
# One Long Line Prompt
ONE_LINE_PS1="${IDCOL}\u@\h${WHITE}:${CYAN}\w${PURPLE}$(git_branch)${WHITE}\$ "
# Fedora Style Prompt
FEDORA_PS1="${BLUE}[${IDCOL}\u@\h${WHITE}: ${CYAN}\W${BLUE}]${PURPLE}$(git_branch)${WHITE}\$ "
# Two line, square box
TWO_LINE_SQUARE_PS1="\n${WHITE}${BOX_DR}${BOX_H}${BLUE}[${IDCOL}\u@\h${WHITE}: ${CYAN}\w${BLUE}]${PURPLE}\$(git_branch)\n${WHITE}${BOX_UR}${BLUE}\$ ${WHITE}"

# Choose PS1 from above options
PS1="$TWO_LINE_SQUARE_PS1"

export PS1
export PROMPT_DIRTRIM=4         # trim \w in prompt to 'n' dirs 


### INPUT ###

# Autocorrect cd
shopt -s cdspell

# Ignore completion case
bind "set completion-ignore-case on"

# Set vi mode
set -o vi


### ALIASES ###

source "$HOME/.aliases"


### SCRIPTS EXECUTION ###

# Bash completion
source /etc/profile.d/bash_completion.sh

# Execute fzf scripts if installed
if $(is_present fzf); then
    source /usr/share/fzf/shell/key-bindings.bash
    source /usr/share/fzf/shell/completion.bash
fi
