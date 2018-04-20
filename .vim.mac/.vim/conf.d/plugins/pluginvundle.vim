" plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" completion
Plugin 'Valloric/YouCompleteMe'

" language
Plugin 'scrooloose/syntastic'

"" markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'kannokanno/previm'

" tex
Plugin 'lervag/vimtex'

" code display
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" colorscheme
syntax enable
set background=dark
colorscheme jellybeans
