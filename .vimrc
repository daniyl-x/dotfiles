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
Plug 'preservim/nerdtree'                   " NerdTree file manager
Plug 'tpope/vim-commentary'                 " comment shortcut (gcc)
Plug 'dense-analysis/ale'                   " ALE linter

" Git
Plug 'airblade/vim-gitgutter'               " gitgutter diff
Plug 'tpope/vim-fugitive'                   " :Git commands

" Themes
Plug 'morhetz/gruvbox'			            " gruvbox
Plug 'sainnhe/everforest'                   " everforest
Plug 'dracula/vim',{'as':'dracula'}         " dracula
call plug#end()


""" ALE SETTINGS
let g:ale_completion_enabled = 1            " enable completion
let g:airline#extensions#ale#enabled = 1    " airline integration

" Messages format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


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

