# **Dotfiles**
*This repository contains my personal dotfiles and configurations that I use every day on my Linux machine.*

Both, micro and vim configuration files contain language-specific settings and/or plugins, currently for Python and HTML.



## Table of contents
- [Requirements](#requirements)
    - [.bashrc](#bashrc)
    - [.vimrc](#vimrc)
    - [micro](#micro)
- [Installation](#installation)
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
- **speedtest-cli\*** &mdash; a command-line tool for testing the speed of an Internet connection
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

### **Full Installation:**
Full dotfiles installation. All dotfiles from this repository will be automatically installed for current user.

```bash
git clone https://github.com/Daniiiiiiil/dotfiles && cd dotfiles && sudo chmod +x install.sh && source install.sh && cd ..
```
&nbsp;
