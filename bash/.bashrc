#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|

# SPDX-License-Identifier: BSD-2-Clause

# Copyright (c) 2023-2025, daniyl-x
                              

# Using shared POSIX sh config
source "${HOME}/.shrc"


### VARIABLES ###

export HISTCONTROL=ignoredups 	# Ignore continuous duplicates
export HISTFILESIZE=$HISTSIZE 	# Bash history file size
export HISTTIMEFORMAT="%F %T "	# Add date and timestamp to history


### INPUT ###

# Autocorrect cd
shopt -s cdspell

# Ignore completion case
bind "set completion-ignore-case on"


### SCRIPTS EXECUTION ###

# Bash completion
source /etc/profile.d/bash_completion.sh

# Execute fzf scripts if installed
if $(is_present fzf); then
    source /usr/share/fzf/shell/key-bindings.bash
    source /usr/share/fzf/shell/completion.bash
fi
