#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
                              

# PATH variable
PATH="$HOME/.local/bin:$HOME/bin:/usr/bin:$PATH"
export PATH


### FUNCTIONS ###

# Print out message dependent on result of last command
check_last_status(){
    [ $? -eq 0 ] && echo "Success :)" || echo "Fail :("
}


# Git branch function for prompt
get_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# Vim update plugins in background
update_vim_plug(){
 printf "Vim-Plug: Cleaning unused plugins...\n"
 vim +PlugClean +q! +q! > /dev/null 2>&1
 check_last_status
 
 printf "\nVim-Plug: Updating plugins...\n"
 vim +PlugInstall +q! +q! > /dev/null 2>&1
 check_last_status
}



### PROMPT ###

# Colors
WHITE='\[\033[0m\]'
GREEN='\[\033[32m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'

# Git Bash Style Prompt
# export PS1=$GREEN'\u@\h'$WHITE':'$CYAN'\w'$PURPLE'$(get_git_branch)'$WHITE'\n\$ '

# One Long Line Prompt
# export PS1=$GREEN'\u@\h'$WHITE':'$CYAN'\w'$PURPLE'$(get_git_branch)'$WHITE'\$ '

# Fedora Style Prompt
export PS1=$BLUE'['$GREEN'\u@\h'$WHITE': '$CYAN'\W'$BLUE']'$PURPLE'$(get_git_branch)'$WHITE'\$ '


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

# Default commands flags
alias cd..="cd .."              # cd up without space
alias ll="ls -lAh"              # ls all long human-readable
alias la="ls -A"                # ls w/ hidden files
alias l.="ls -d .*"             # ls only hidden
alias mkdir="mkdir -pv"         # mkdir make parents & verbose output
alias diff="diff -s"            # report identical files

# Editors
alias edit="$EDITOR"            # edit for default editor
alias code="$CODEEDITOR"        # code for default code editor
alias vim="vimx"                # gvim: vim + system clipboard
alias nv="nvim"                 # nv for nvim

# Installed
alias speedtest="speedtest-cli"

# Functions / Scripts
alias lstatus="check_last_status"   # echo last execution status
alias vimup="update_vim_plug"       # update function for vim plugins


### DEFAULTS ###
export EDITOR=nvim              # Default editor
export CODEEDITOR=codium        # Default IDE
export BAT_THEME=gruvbox-dark   # bat theme


### FZF SETTINGS ###

# Enable fzf keybindings
source /usr/share/fzf/shell/key-bindings.bash

# Enable fzf bash completion
source /usr/share/fzf/shell/completion.bash

