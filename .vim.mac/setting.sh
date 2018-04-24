#!/bin/bash -eu
NPWD=`pwd`
ln -F -s ${NPWD}/.vimrc ~/.vimrc
mkdir -p ~/.vim
lndir ${NPWD}/.vim ~/.vim
mkdir -p ~/.vim/bundle

# python check
PYTHONSUPPORT=`vim --version | grep +python3`
if [ ! ${#PYTHONSUPPORT} -gt 0 ]; then
		echo "vim does not support python3. please reinstall by brew install vim --with-python3"
		exit
fi
pip3 install neovim --upgrade

# dein.vim
vim +"call dein#install()" +qall
vim +"call dein#update()" +qall

# jedi-vim
cd ~/.vim/bundle
if [ ! -e ~/.vim/bundle/jedi-vim ]; then git clone https://github.com/davidhalter/jedi-vim ; fi
cd ~/.vim/bundle/jedi-vim && git submodule update --init
