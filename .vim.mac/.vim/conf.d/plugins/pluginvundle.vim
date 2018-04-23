" plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" completion
Plugin 'Valloric/YouCompleteMe'

" markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'kannokanno/previm'

" tex
Plugin 'lervag/vimtex'

" python
Plugin 'davidhalter/jedi-vim'

" code display
Plugin 'flazz/vim-colorschemes'

" bracket
Plugin 'cohama/lexima.vim'

call vundle#end()
filetype plugin indent on

" colorscheme
syntax enable
set background=dark
colorscheme jellybeans
