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
colorscheme palenight      " Set color scheme

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

"
" Enable italics
" https://github.com/drewtempelmeyer/palenight.vim#italics
"
let g:palenight_terminal_italics=1

"
" Enable true colors
" https://github.com/drewtempelmeyer/palenight.vim#true-colors
"
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
