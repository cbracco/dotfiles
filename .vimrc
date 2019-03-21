"
" .vimrc
"
" Default settings for the command line text editor.
"

"
" Install plugins with vim-plug
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

"
" Color scheme
"
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:palenight_terminal_italics=1

"
" Editor settings
"
set cursorline             " Highlight the current line
set laststatus=2           " Needed for lightline status bar
set noshowmode             " Do not show modes
set number                 " Show line numbers
set showmatch              " Show matching brackets
set autoindent             " Auto indenting
set smartindent            " Smart indenting
set smarttab               " Better backspace and tab functionality
set expandtab              " Spaces instead of tabs
set tabstop=4              " 4 spaces for tabs
set shiftwidth=4           " 4 spaces for indentation
