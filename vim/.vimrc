"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|

" SPDX-License-Identifier: BSD-2-Clause

" Copyright (c) 2023-2024, daniyl-x


" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim


""" BACKUP MANAGEMENT
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" Backup files location
call mkdir($HOME . "/.vim/backup", "p", 0700)
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/backup//
set undodir=$HOME/.vim/backup//


""" PLUGINS IMPORT
call plug#begin()
    Plug 'vim-airline/vim-airline'              " airline statusbar
    Plug 'tpope/vim-vinegar'                    " file manager

    " Git
    Plug 'airblade/vim-gitgutter'               " gitgutter diff

    " Themes
    Plug 'morhetz/gruvbox'			            " gruvbox
    Plug 'sainnhe/everforest'                   " everforest
    Plug 'dracula/vim',{'as':'dracula'}         " dracula
    Plug 'catppuccin/vim',{'as':'catppuccin'}   " catppuccin
call plug#end()


""" COLORSCHEME SETTINGS
let g:gruvbox_contrast_dark = 'medium'      " gruvbox dark contrast

set background=dark			                " dark mode
set termguicolors                           " correct colors
colorscheme catppuccin_frappe               " setting colorscheme


""" EDITOR SETTINGS
set number relativenumber                   " display relative line numbers
set splitbelow splitright                   " splits open at the bottom and right
set hlsearch                                " highlight search results
set cursorline                              " highlight the current line
set colorcolumn=80

" Tabulation
set expandtab                               " tab to spaces
set tabstop=4 softtabstop=4 shiftwidth=4    " tabulation size

" Autoindent
set autoindent

" Wrapping
set nowrap                                  " no line wrapping
set linebreak                               " don't break words

" Disable autocomment for new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Command line autocompletion
set wildmode=list:full,list:full


""" FILE SPECIFIC SETTINGS

" HTML Tabulation
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2


""" REMAPS
let mapleader = " "                         " space as a leader
nnoremap <Leader>q :confirm qall<CR>        " quit all with confirmation

