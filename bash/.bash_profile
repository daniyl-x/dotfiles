# Source shared profile
if  [ -f "$HOME/.profile" ]; then
    . ~/.profile
fi

# Source .bashrc if interactive
if  [[ -t 0 && -f "$HOME/.bashrc" ]]; then
    . ~/.bashrc
fi

