#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
                              

### VARIABLES ###

# PATH variable
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# History settings
export HISTCONTROL=ignoredups 	# Ignore continuous duplicates
export HISTSIZE=10000           # Bash history size
export HISTFILESIZE=$HISTSIZE 	# Bash history file size
export HISTTIMEFORMAT="%F %T "	# Add date and timestamp to history

export MANPAGER="nvim +Man!"    # Display manpages with neovim
export VISUAL=nvim              # Fullscreen fancy editor
export EDITOR=vi                # Default editor, should work everywhere


### FUNCTIONS ###

# Git branch function for prompt
get_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


### PROMPT ###

# Colors
WHITE='\[\033[0m\]'
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'

# Unicode symbols
BOX_H=$'\u2500'
BOX_DR=$'\u250c'
BOX_UR=$'\u2514'

# Git Bash Style Prompt
#PS1='\n'$GREEN'\u@\h'$WHITE':'$CYAN'\w'$PURPLE'$(get_git_branch)'$WHITE'\n\$ '

# One Long Line Prompt
#PS1=$GREEN'\u@\h'$WHITE':'$CYAN'\w'$PURPLE'$(get_git_branch)'$WHITE'\$ '

# Fedora Style Prompt
#PS1=$BLUE'['$GREEN'\u@\h'$WHITE': '$CYAN'\W'$BLUE']'$PURPLE'$(get_git_branch)'$WHITE'\$ '

# Two line, square box
PS1='\n'$WHITE$BOX_DR$BOX_H$BLUE'['$GREEN'\u@\h'$WHITE': '$CYAN'\w'$BLUE']'$PURPLE'$(get_git_branch)\n'$WHITE$BOX_UR$BLUE'\$ '$WHITE

# Replace green color with red for root
if [ "$(id -u)" -eq 0 ]; then
    PS1=$(tr $GREEN $RED <<< $PS1)
fi

export PS1
export PROMPT_DIRTRIM=4         # trim \w in prompt to 'n' dirs 


### INPUT ###

# Shopt
shopt -s cdspell                # autocorrect cd

# Ignore completion case
bind "set completion-ignore-case on"

# Set vi mode
set -o vi


### ALIASES ###

# Colorization
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ip="ip --color=auto"
alias tree="tree -C"

# Set interactive mode
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Set human-readable mode
alias df="df -h"
alias du="du -h"

# Default commands flags
alias cd..="cd .."              # cd up without space
alias ll="ls -lh"               # ls all long human-readable
alias la="ls -lAh"              # ls w/ hidden files
alias l.="ls -d .*"             # ls only hidden
alias mkdir="mkdir -pv"         # mkdir make parents & verbose output

# Editors
#alias vim="vimx"               # vim w\ system clipboard (fedora)


### SCRIPTS EXECUTION ###

# Enable fzf keybindings
source /usr/share/fzf/shell/key-bindings.bash

# Enable fzf bash completion
source /usr/share/fzf/shell/completion.bash

# Bash completion
source /etc/profile.d/bash_completion.sh

