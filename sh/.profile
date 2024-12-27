#                     __ _ _      
#    _ __  _ __ ___  / _(_) | ___ 
#   | '_ \| '__/ _ \| |_| | |/ _ \
#  _| |_) | | | (_) |  _| | |  __/
# (_) .__/|_|  \___/|_| |_|_|\___|
#   |_|                           

# SPDX-License-Identifier: BSD-2-Clause

# Copyright (c) 2024, daniyl-x


# Add user's bin directories to PATH
export PATH="$HOME/.local/bin:$HOME/bin:${PATH}"

# Set VISUAL to available vim, and PAGER to less, or nvim if installed
PAGER=less
if [ -x "$(command -v nvim)" ]; then
    PAGER="nvim +Man!"
    VISUAL=nvim
elif [ -x "$(command -v vim)" ]; then
    VISUAL=vim
fi

export PAGER                 	# Custom pager (for man, etc)
export VISUAL                   # Fullscreen fancy editor
export EDITOR=vi                # Default editor, should work everywhere

# Configure shell to use .shrc if present
if [ -f "$HOME/.shrc" ]; then
    export ENV="$HOME/.shrc"
fi

