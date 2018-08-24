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
pip3 install pep8 --upgrade
pip3 install pyflakes --upgrade

# rust
set +e
cargo install racer
set -e

# clang check
brew update
set +e
brew install llvm --with-clang
brew install clang-format
set -e

# dein.vim
vim +"call dein#install()" +qall
vim +"call dein#update()" +qall
