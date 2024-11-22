# Dotfiles
*This repository contains my personal dotfiles and configurations that I use
every day on my Linux machine.*

All text editors configurations may contain language-specific settings and/or
plugins. Some of this dotfiles (window managers configurations, for example)
are configured specifically for my needs and convinience, so you should use
them rather as a base or an example.


## Table of contents
- [Branches](#branches)
- [Requirements](REQUIREMENTS.md)
- [Installation](#installation)
    - [Plain](#plain)
    - [GNU Stow](#gnu-stow)
    - [Post-install and headless installation](#post-install-and-headless-installation)
- [Scripts](#scripts)
- [Colorschemes](#colorschemes)
- [Credits](#credits)
- [License](#license)


## Branches
- main &mdash; the main branch, **contains Xorg specific settings**, tested on
multiple Linux distros (Fedora, Debian, Mint)

- termux &mdash; the termux branch, unrelevant dotfiles are removed, path's are
fixed, other fixes applied


## Installation
> **Warning:**
> Make sure that all [requirements](REQUIREMENTS.md) for specific software or
script are installed, except those marked with \*

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

### Post-install and headless installation
After installing Vim dotfiles, it's required to install plugins.
It can be done by executing Vim commands manually but the next command
is optimized to work in scripts or tools like Ansible:
```sh
vim -s ~/.vimrc +PlugUpdate +PlugClean +qa
```


## Scripts
This repo also contains my custom scripts that can be found
in the scripts directory.
They can be installed standalone or with any graphical environment,
using GNU Stow or in any other way.\
This is a separate stow package, so thwy can be ibstalled independently.


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


## Credits
- DistroTube for inspiration to create this repo
- typecraft for his [GNU Stow guide](https://youtu.be/NoFiYOqnC4o?si=wD7fsb7WJtI_Na1u)


## License
- All the original code and configuration files written by me are licensed
under BSD-2-Clause License, which can be found in the [LICENSE](LICENSE) file.

- All the 3rd-party code and configuration files contain explicit license
and either copyright notices or an attribution to the original source.
Detailed information on specific files or directories can be found in
the [LICENSE-3RD-PARTY.md](LICENSE-3RD-PARTY.md) file.

