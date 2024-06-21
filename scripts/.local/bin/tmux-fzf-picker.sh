#!/bin/sh

# Dependencies: awk, tmux, fzf

windows="$(tmux list-windows -a | awk '{print $1,$2,$3,$4}')"
target_window="$(echo "$windows" | fzf --no-multi)"
target_window="$(echo "$target_window" | awk '{ print gensub(/:$/, "", "g", $1)}')"

if [ $target_window ]; then
    tmux attach-session -t "$target_window"
fi

