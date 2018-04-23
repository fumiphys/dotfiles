#!/bin/bash -eu
NPWD=`pwd`
ln -F -s ${NPWD}/.vimrc ~/.vimrc
mkdir -p ~/.vim
lndir ${NPWD}/.vim ~/.vim

# vundle
mkdir -p ~/.vim/bundle
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim ; fi
cd ~/.vim/bundle/Vundle.vim && git pull

# YouCompleteMe
cd ~/.vim/bundle
if [ ! -e YouCompleteMe ]; then git clone --recursive https://github.com/Valloric/YouCompleteMe.git ; fi
cd YouCompleteMe
git pull
git submodule update --init --recursive
# mkdir -p YouCompleteMe/ycmbuild && cd YouCompleteMe/ycmbuild
# cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/
# make ycm_core
python install.py --clang-completer --system-libclang
cd ..

# python check
pip3 install pep8 pyflakes --upgrade
PYTHONSUPPORT=`vim --version | grep +python3`
if [ ! ${#PYTHONSUPPORT} -gt 0 ]; then
		echo "vim does not support python3. please reinstall by brew install vim --with-python3"
		exit
fi

# jedi-vim
cd ~/.vim/bundle
if [ ! -e ~/.vim/bundle/jedi-vim ]; then git clone https://github.com/davidhalter/jedi-vim ; fi
cd ~/.vim/bundle/jedi-vim && git submodule update --init

# vundle
vim +PluginInstall +qall
