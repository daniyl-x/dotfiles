#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|

# SPDX-License-Identifier: BSD-2-Clause

# Copyright (c) 2023-2025, daniyl-x
                              

### FUNCTIONS ###

is_present(){
    command -v $1 > /dev/null 2>&1
}

# Git branch function for prompt
git_branch(){
    if is_present git; then
        git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
    fi
}


### VARIABLES ###

export HISTSIZE=10000           # history size
export HISTCONTROL=ignoredups 	# Ignore continuous duplicates
export HISTFILESIZE=$HISTSIZE 	# Bash history file size
export HISTTIMEFORMAT="%F %T "	# Add date and timestamp to history

export GPG_TTY=$(tty)           # gpg-agent tty


### PROMPT ###

# Colors
ESC="\033[0;"
RST="\[${ESC}0m\]"
RED="\[${ESC}31m\]"
GREEN="\[${ESC}32m\]"
BLUE="\[${ESC}34m\]"
PURPLE="\[${ESC}35m\]"
CYAN="\[${ESC}36m\]"

# Unicode symbols
BOX_H="\342\224\200"
BOX_DR="\342\224\214"
BOX_UR="\342\224\224"

# Set of 'user@host' and prompt symbol for root/non-root
IDCOL=$GREEN
IDSYM="\$"
if [ "$(id -u)" -eq 0 ]; then
    IDCOL=$RED
    IDSYM="#"
fi

# Git Bash Style Prompt
GIT_BASH_PS1="\n${IDCOL}\u@\h${RST}:${CYAN}\w${PURPLE}\$(git_branch)${RST}\n${IDSYM} "
# One Long Line Prompt
ONE_LINE_PS1="${IDCOL}\u@\h${RST}:${CYAN}\w${PURPLE}\$(git_branch)${RST}${IDSYM} "
# Fedora Style Prompt
FEDORA_PS1="${BLUE}[${IDCOL}\u@\h${RST}: ${CYAN}\W${BLUE}]${PURPLE}\$(git_branch)${RST}${IDSYM} "
# Two line, square box
TWO_LINE_PS1="\n${BOX_DR}${BOX_H}${BLUE}[${IDCOL}\u@\h${RST}: ${CYAN}\w${BLUE}]${PURPLE}\$(git_branch)\n${RST}${BOX_UR}${BLUE}${IDSYM}${RST} "

# Choose PS1 from above options
export PS1="$TWO_LINE_PS1"
export PROMPT_DIRTRIM=4


### INPUT & MISC ###

# Set vi mode
set -o vi

# Autocorrect cd
shopt -s cdspell

# Ignore completion case
bind "set completion-ignore-case on"

# Aliases
source "${HOME}/.aliases"


### SCRIPTS EXECUTION ###

# Bash completion
source /etc/profile.d/bash_completion.sh

# Execute fzf scripts if installed
if $(is_present fzf); then
    source /usr/share/fzf/shell/key-bindings.bash
    source /usr/share/fzf/shell/completion.bash
fi

