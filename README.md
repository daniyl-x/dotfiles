# **Dotfiles**
> *This repository contains my personal dotfiles and configurations that I use every day on my Linux machine.*


## Table of contents
- [Requirements](#requirements)
    - [.bashrc](#bashrc)
    - [.vimrc](#vimrc)
    - [micro](#micro)
- [Usage](#usage)
&nbsp;


## Requirements
> **Note**
> \*&mdash; Is not required, but is used and recommended
&nbsp;

### **.bashrc**
- **bat** &mdash; cat alternative with syntax highlighting
- **fzf** &mdash; fuzzy-finder for convenient search and auto-completion of commands from the terminal
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


## Usage
> **Warning**
> Make sure that all [requirements](#requirements) are installed, except those marked with \*
&nbsp;

1. Clone git repository to your machine:
    ``` bash
    git clone https://github.com/Daniiiiiiil/dotfiles
    ```
2. Move files to your home directory:
    ```bash
    mv dotfiles/.*rc ~/
    mv dotfiles/micro/* ~/.config/micro/
    ```
3. Reopen terminal emulator or execute .bashrc to the changes work:
    ```bash
    source ~/.bashrc
    ```

    OR

    ```bash
    . ~/.bashrc
    ```
4. Open vim and install plugins:
    ```bash
    vim
    ```
    Execute `:PlugInstall`
