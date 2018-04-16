#!/bin/sh -eu
NPWD=`pwd`
ln -F -s ${NPWD}/.vimrc ~/.vimrc
mkdir -p ~/.vim
lndir ${NPWD}/.vim ~/.vim

mkdir -p ~/.vim/bundle
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim ; fi
cd ~/.vim/bundle/Vundle.vim && git pull

