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

# Set VISUAL to available vim, and MANPAGER to nvim if present
if [ -x "$(command -v nvim)" ]; then
    export MANPAGER="nvim +Man!"
    export VISUAL=nvim
elif [ -x "$(command -v vim)" ]; then
    export VISUAL=vim
fi

export PAGER=less            	# Custom pager
export EDITOR=vi                # Default editor, should work everywhere


# Configure shell to use appropriate .*rc if present
if [ -n "$KSH_VERSION" ]; then
    export ENV="$HOME/.kshrc"
else
    export ENV="$HOME/.shrc"
fi

