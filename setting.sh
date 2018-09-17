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
	echo -n "configuration files ~/.vimrc already exists. overwrite? [y/n] "
  read VIMRC_YN

  case $VIMRC_YN in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) echo "configuration files will be overwritten";;
    * ) echo "stop configuration!"
        exit 1;;
  esac
fi


# link configuration files
if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi
ln -F -s ${NPWD}/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/
mkdir -p ~/.vim/conf.d
mkdir -p ~/.vim/conf.d/bases

# base_options.vim
if [ -e ~/.vim/conf.d/bases/base_options.vim ]; then
  rm ~/.vim/conf.d/bases/base_options.vim
fi
ln -F -s ${NPWD}/vim/conf.d/bases/base_options.vim ~/.vim/conf.d/bases/base_options.vim

# keymap.vim
if [ -e ~/.vim/conf.d/bases/keymap.vim ]; then
  rm ~/.vim/conf.d/bases/keymap.vim
fi
ln -F -s ${NPWD}/vim/conf.d/bases/keymap.vim ~/.vim/conf.d/bases/keymap.vim

# gui.vim
if [ -e ~/.vim/conf.d/bases/gui.vim ]; then
  rm ~/.vim/conf.d/bases/gui.vim
fi
ln -F -s ${NPWD}/vim/conf.d/bases/gui.vim ~/.vim/conf.d/bases/gui.vim

mkdir -p ~/.vim/conf.d/plugins

# dein_root.vim
if [ -e ~/.vim/conf.d/plugins/dein_root.vim ]; then
  rm ~/.vim/conf.d/plugins/dein_root.vim
fi
ln -F -s ${NPWD}/vim/conf.d/plugins/dein_root.vim ~/.vim/conf.d/plugins/dein_root.vim

# dein.toml
if [ -e ~/.vim/conf.d/plugins/dein.toml ]; then
  rm ~/.vim/conf.d/plugins/dein.toml
fi
ln -F -s ${NPWD}/vim/conf.d/plugins/dein.toml ~/.vim/conf.d/plugins/dein.toml

# dein_lazy.toml
if [ -e ~/.vim/conf.d/plugins/dein_lazy.toml ]; then
  rm ~/.vim/conf.d/plugins/dein_lazy.toml
fi
ln -F -s ${NPWD}/vim/conf.d/plugins/dein_lazy.toml ~/.vim/conf.d/plugins/dein_lazy.toml

mkdir -p ~/.vim/conf.d/languages

# ccpp.vim
if [ -e ~/.vim/conf.d/languages/ccpp.vim ]; then
  rm ~/.vim/conf.d/languages/ccpp.vim
fi
ln -F -s ${NPWD}/vim/conf.d/languages/ccpp.vim ~/.vim/conf.d/languages/ccpp.vim

# markdown.css
if [ -e ~/.vim/conf.d/languages/markdown.css ]; then
  rm ~/.vim/conf.d/languages/markdown.css
fi
ln -F -s ${NPWD}/vim/conf.d/languages/markdown.css ~/.vim/conf.d/languages/markdown.css

mkdir -p ~/.vim/bundle

# setting for python3
pip3 install --upgrade neovim
# for ale
pip3 install --upgrade flake8
# for deoplete-jedi
pip3 install --upgrade jedi

# zsh
if [ -e ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -F -s ${NPWD}/zsh/.zshrc ~/.zshrc
