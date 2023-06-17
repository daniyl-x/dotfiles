"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|


" Backup management
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif


" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim


""" PLUGINS IMPORT
call plug#begin()
Plug 'vim-airline/vim-airline'              " airline statusbar
Plug 'tpope/vim-commentary'                 " comment shortcut (gcc)

" Git
Plug 'airblade/vim-gitgutter'               " gitgutter diff

" Themes
Plug 'morhetz/gruvbox'			            " gruvbox
Plug 'sainnhe/everforest'                   " everforest
Plug 'dracula/vim',{'as':'dracula'}         " dracula
call plug#end()


""" COLORSCHEME SETTINGS
let g:gruvbox_contrast_dark = 'medium'      " gruvbox dark contrast

set background=dark			                " dark mode
colorscheme everforest 		                " setting colorscheme


""" EDITOR SETTINGS
set number relativenumber                   " display relative line numbers
set splitbelow splitright                   " splits open at the bottom and right
set hlsearch                                " highlight search results

" Tabulation
set expandtab                               " tab to spaces
set tabstop=4 softtabstop=4 shiftwidth=4    " tabulation size

" Code folding :TODO, don't works now
set foldmethod=syntax                       " fold by indent
set nofoldenable                            " open files without folding

" Autoindent
set autoindent

" Wrapping
set wrap                                    " wrap at the edge of the screen
set linebreak                               " don't break words

" Disable autocomment for new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Command line autocompletion
set wildmode=list:full,list:full


""" FILE SPECIFIC SETTINGS

" Colorcolumn 81 for python
autocmd FileType python setlocal colorcolumn=81

" HTML Tabulation
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2

