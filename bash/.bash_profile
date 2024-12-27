# Source shared profile
if  [ -f ~/.profile ]; then
    . ~/.profile
fi

# Source .bashrc if interactive
if  [[ -t 0 && -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

