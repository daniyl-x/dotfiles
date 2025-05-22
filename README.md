# Dotfiles
*This repository contains my personal configuration files (dotfiles).*

All dotfiles are configured for my needs and convinience, and should be used
rather as a base or an example.


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

- termux &mdash; the termux branch, unrelevant dotfiles are removed, paths are
fixed, other fixes applied


## Installation
> **Warning:**
> Make sure that all [requirements](REQUIREMENTS.md) for specific software or
script are installed (except those marked with \*).

Some configs may require to restart program or will have command to execute just
under their ASCII banner.

### Plain
Just clone the repo, copy required files or directories to your `$HOME`
and have fun!\
Example of installation for Neovim dotfiles:
```sh
# From this repo's directory
cp -r nvim/* $HOME
```

### GNU Stow
Execute the stow command with `$HOME` as your target directory and the names
of the programs you need dotfiles for.\
Example for linking Git, Neovim, tmux and Qtile dotfiles:
```sh
# From this repo's directory
mkdir $HOME/.config && stow -t $HOME git nvim tmux qtile
```

### Post-install and headless installation
After installing my Vim dotfiles, it's required to install plugins.\
This can be done with the next command (can be used in scripts):
```sh
vim -s ~/.vimrc +PlugUpdate +PlugClean +qa
```


## Scripts
This repo also contains my custom scripts that can be found in the `scripts`
directory.\
This is a separate Stow package, so they can be installed independently.


## Colorschemes
I try to keep colorschemes consistent between applications (at least for window
manager and terminal emulator).

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

