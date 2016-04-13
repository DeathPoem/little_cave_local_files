set nocompatible    " Use Vim defaults (much better!)  
" vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tomasr/molokai'

Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'

Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on
"vundle


set wildmenu
set ignorecase
set laststatus=2
set ruler
set number
syntax enable
syntax on
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set t_Co=256
set tags=./tags;/
"set tags+=/usr/local/share/ctags/qt4
"you can add directories to your ctags lookup
set background=dark
colorscheme molokai
