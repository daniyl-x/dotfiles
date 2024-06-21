# **Dotfiles**
*This repository contains my personal dotfiles and configurations that I use
every day on my Linux machine.*

All text editors configurations may contain language-specific settings and/or
plugins. Some of this dotfiles (window managers configurations, for example)
are configured specifically for my needs and convinience, so you should use
them as a base or example.



## Table of contents
- [Requirements](REQUIREMENTS.md)
- [Branches](#branches)
- [Installation](#installation)
    - [Plain](#plain)
    - [GNU Stow](#gnu-stow)
- [Scripts](#scripts)
- [Colorschemes](#colorschemes)



## Requirements
See [REQUIREMENTS.md](REQUIREMENTS.md) for detailed information.


## Branches
- main &mdash; the main branch, **contains Xorg specific settings**, tested on
Linux distros (Fedora, Debian, Mint), should work for the most Unix-like OS's

- termux &mdash; the termux branch, unrelevant dotfiles are removed, path's are
fixed, other fixes applied


## Installation
> **Warning**
> Make sure that all [requirements](REQUIREMENTS.md) for specific program are
installed, except those marked with \*\

Some configs may require to restart app or will have command to execute just
under the ASCII art.

### Plain
Just clone repo, copy required files or dirs from inside of the corresponding
directory to your `$HOME` and have fun!\
Example for neovim dotfiles:
```sh
# From this repo's directory
cp -r nvim/* $HOME
```

### GNU Stow
Execute the stow command with the `$HOME` as your target directory and the names
of the programs you need dotfiles for.\
Example for linking git, neovim, tmux and qtile dotfiles:
```sh
# From this repo's directory
mkdir $HOME/.config && stow -t $HOME git nvim tmux qtile
```


## Scripts
This repo also contains my custom scripts that can be found in
[this directory](scripts).
They can be installed standalone or with any graphical environment,
using GNU Stow or in any other way.\
This is a separate stow package, because they're made to be portable.


## Colorschemes
I'm trying to keep colorschemes consistent between applications (at least for
window manager and terminal emulator).

Colorschemes are ported from different sources and customized to look better
in every application.

### Based on:
- [Palenight VSCode theme](https://github.com/whizkydee/vscode-palenight-theme)
- [Everforest Vim theme](https://github.com/sainnhe/everforest)
- [Doom One Doom Emacs theme](https://github.com/doomemacs/themes)
- [One Dark Vim theme](https://github.com/joshdick/onedark.vim)

