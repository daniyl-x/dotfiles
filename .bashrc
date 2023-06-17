#########################
### My custom .bashrc ###
#########################


# Enable fzf keybindings
source /usr/share/fzf/shell/key-bindings.bash


### DEFAULTS ###

# PATH variable
PATH="$HOME/.local/bin:$HOME/bin:/usr/bin:$PATH"
export PATH

# fzf default options
FDO="-m"                        # fzf enable multiple selection
FDO="$FDO --preview 'bat --color=always {}'"   # fzf text preview w/ highlighting
export FZF_DEFAULT_OPTS="$FDO"

# Other
export EDITOR=micro             # Default editor: micro
export CODEEDITOR=codium        # Default IDE: codium
export BAT_THEME=gruvbox-dark   # bat theme: gruvbox-dark


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
alias ip="ip --color=auto"

# Interactive mode
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Default commands flags
alias cd..="cd .."          # cd up without space
alias ll="ls -lah"          # ls all long human-readable
alias la="ls -A"            # ls w/ hidden files
alias l.="ls -d .*"         # ls only hidden
alias mkdir="mkdir -pv"     # mkdir make parents if needed, verbose output

# Editors
alias edit="$EDITOR"        # 'edit' for default editor
alias code="$CODEEDITOR"    # 'code' for default code editor
alias vi="vim"              # vi for fim

# Installed
alias speedtest="speedtest-cli"
