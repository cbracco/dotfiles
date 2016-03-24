"
" .vimrc
"
" Default settings for the command line text editor.
"

"
" Syntax Highlighting
"
syntax on                  " Enable syntax highlighting
set background=dark        " Set dark background mode
colorscheme material-theme " Set color scheme

"
" Editor Settings
"
set autoread               " Watch for file changes
set cursorline             " Highlight the current line
set number                 " Show line numbers
set showmode               " Show INSERT, VISUAL, etc. mode
set showmatch              " Show matching brackets
set autoindent             " Auto indenting
set smartindent            " Smart indenting
set smarttab               " Better backspace and tab functionality
set expandtab              " Spaces instead of tabs
set tabstop=2              " 2 spaces for tabs
set shiftwidth=2           " 2 spaces for indentation
filetype on                " Enable filetype detection
