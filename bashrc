#########################
### My custom .bashrc ###
#########################

# PATH variable
PATH="$HOME/.local/bin:$HOME/bin:/usr/bin:$PATH"
export PATH

shopt -s autocd             # Allow to cd without cd command


### DEFAULTS ###
export EDITOR=micro         # Default editor: micro
export CODEEDITOR=codium    # Default IDE: codium


### PROMPT ###

# Git branch script for prompt
. /usr/share/git-core/contrib/completion/git-prompt.sh

# Colors
WHITE='\[\033[0m\]'
GREEN='\[\033[32m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'

# Git Bash Style Prompt
export PS1=$GREEN'\u@\h'$WHITE':'$CYAN'\w'$PURPLE'$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")'WHITE'\n\$ '

# One Long Line Prompt
export PS1=$GREEN'\u@\h'$WHITE':'$CYAN'\w'$PURPLE'$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")'$WHITE'\$ '

# Fedora Style Prompt
export PS1=$BLUE'['$GREEN'\u@\h'$WHITE': '$CYAN'\W'$BLUE']'$PURPLE'$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")'$WHITE'\$ '


### ALIASES ###

# Colorization
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Interactive mode
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Default commands flags
alias ll="ls -lh"           # ls long human-readable
alias la="ls -lah"          # ls long human-readable w/ hidden files
alias mkdir="mkdir -pv"     # mkdir make parents if needed, verbose output

# Installed
alias speedtest="speedtest-cli"
