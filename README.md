# **Dotfiles**
> *This repository contains my personal dotfiles and configurations that I use every day on my Linux machine.*

> **Note**
> Both, micro and vim configuration files contain language-specific settings and/or plugins, currently for Python and HTML.



## Table of contents
- [Requirements](#requirements)
    - [.bashrc](#bashrc)
    - [.vimrc](#vimrc)
    - [micro](#micro)
- [Installation](#installation)
    - [Full Installation](#full-installation)
    - [File-specific Installation](#file-specific-installation)
        - [.bashrc](#bashrc-1)
        - [.gitignore-global](#gitignore-global)
        - [.vimrc](#vimrc-1)
        - [micro](#micro-1)
&nbsp;



## Requirements
> **Note**
> \*&mdash; Is not required, but is used and recommended
&nbsp;

### **.bashrc**
- **bat** &mdash; cat alternative with syntax highlighting
- **fzf** &mdash; fuzzy-finder for convenient search and auto-completion of commands from the terminal
- **git** &mdash; a free and open source distributed version control system
- **gvim** &mdash; vim graphical mode & clipboard buffer integration
- **micro\*** &mdash; simple and convenient text editor for the terminal with syntax highlighting, plug-ins and flexible settings
- **speedtest-cli** &mdash; a command-line tool for testing the speed of an Internet connection
- **vscodium** &mdash; community-driven, freely-licensed binary distribution of Microsoft’s editor VS Code
&nbsp;

### **.vimrc**
- [**vim-plug**](https://github.com/junegunn/vim-plug) &mdash; a minimalist Vim plugin manager
&nbsp;

### **micro**
- **filemanager\*** &mdash; filemanager plugin
- **fzf\*** &mdash; fuzzy-finder plugin
- **quoter\*** &mdash; plugin to add quotes or brackets around a text selection
&nbsp;



## Installation
> ### **Warning**
> Make sure that all [requirements](#requirements) for specific file are installed, except those marked with \*
&nbsp;

[Clone git repository to your machine](#clone-git-repository-to-your-machine) and follow [full](#install-all-dotfiles) or file-specific installation
&nbsp;


### **Clone git repository to your machine:**
``` bash
git clone https://github.com/Daniiiiiiil/dotfiles
```
&nbsp;


### **Full Installation:**
Full dotfiles installation. All dotfiles from this repository will be automatically installed for current user.

```bash
cd dotfiles && sudo chmod +x install.sh && source install.sh && cd ..
```
&nbsp;


### **File-specific installation:**
Installation instructions for specific dotfiles.


#### **.bashrc**
1. Move file to your home directory:

    ```bash
    cp dotfiles/.bashrc ~/
    ```
2. Reopen terminal emulator or execute .bashrc to apply the changes:

    ```bash
    source ~/.bashrc
    ```

    OR

    ```bash
    . ~/.bashrc
    ```
&nbsp;


#### **.gitignore-global**
1. Move file to your home directory:

    ```bash
    cp dotfiles/.gitignore-global ~/
    ```
2. Include .gitignore-global to the global git configuration:

    ```bash
    git config --global core.excludesfile ~/.gitignore-global
    ```
&nbsp;


#### **.vimrc**
1. Move file to your home directory:

    ```bash
    cp dotfiles/.vimrc ~/
    ```
2. Run vim and install plugins:
    > **Note** at the first start of the vim you will get some errors, which you can ignore, they appear due to the presence of settings related to not yet installed plug-ins
    &nbsp;

    ```bash
    vim +Pluginstall
    ```
&nbsp;


#### **micro**
1. Copy all files from `micro/` to `~/.config/micro/`:

    ```bash
    mkdir -p ~/.config/micro/
    cp dotfiles/micro/* ~/.config/micro/
    ```
