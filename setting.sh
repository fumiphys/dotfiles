#!/bin/bash
# written by fumiphys
# To use this script, execute
# $ chmod +x setting.sh
# $ ./setting.sh

# os information
# if you use mac, brew will be used.
# if you use linux, apt will be used.
# if you use windows, I will think it later.
if [ "$(uname)" = 'Darwin' ]; then
	OS="Mac"
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
	OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" = 'MINGW32_NT' ]; then
	OS='Cygwin'
else
	echo "Unsupported platform: ($(uname -a))"
	echo "Supported platform is: [Mac, Linux, Cygwin]"
	exit 1
fi

# vim configuraion
NPWD="$(cd $(dirname $0); pwd)"

# check original .vimrc
if [ -e ~/.vimrc ]; then
	echo -n "file ~/.vimrc already exists. overwrite? [y/n] "
  read VIMRC_YN

  case $VIMRC_YN in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) echo "~/.vimrc will be overwritten";;
    * ) echo "stop configuration!"
        exit 1;;
  esac
fi


# link configuration files
ln -F -s ${NPWD}/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/
mkdir -p ~/.vim/conf.d
mkdir -p ~/.vim/conf.d/bases
ln -F -s ${NPWD}/vim/conf.d/bases/base_options.vim ~/.vim/conf.d/bases/base_options.vim
ln -F -s ${NPWD}/vim/conf.d/bases/keymap.vim ~/.vim/conf.d/bases/keymap.vim
ln -F -s ${NPWD}/vim/conf.d/bases/gui.vim ~/.vim/conf.d/bases/gui.vim
mkdir -p ~/.vim/conf.d/languages
mkdir -p ~/.vim/conf.d/plugins
mkdir -p ~/.vim/bundle
