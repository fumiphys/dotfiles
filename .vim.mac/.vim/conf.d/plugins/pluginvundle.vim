" plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" code display
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" colorscheme
syntax enable
set background=dark
colorscheme jellybeans
