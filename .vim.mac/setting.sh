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

# clang check
brew update
brew install llvm --with-clang
brew install clang-format

# dein.vim
vim +"call dein#install()" +qall
vim +"call dein#update()" +qall
