#!/bin/bash
# written by fumiphys
# To use this script, execute
# $ chmod +x setting.sh
# $ ./setting.sh [--no-zsh, --no-zplug]

# os information
# if you use mac, brew will be used.
# if you use linux, apt will be used.
# if you use windows, I will think it later.

OS=""

WZSH=true
WZPLUG=true

# script dir
NPWD="$(cd $(dirname $0); pwd)"

check_os() {
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
}

check_opt() {
  for opt in "$@"; do
    case "${opt}" in
      '--no-zsh' )
        WZSH=false;
        ;;
      '--no-zplug' )
        WZPLUG=false;
        ;;
    esac
  done

  if [ ${WZSH} = "true" ]; then
    echo "Configuration for zsh: True"
  else
    echo "Configuration for zsh: False"
  fi
  if [ ${WZPLUG} = "true" ]; then
    echo "Configuration for zplug: True"
  else
    echo "Configuration for zplug: False"
  fi
}

ask_resetting() {
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
}

install_python() {
  if [ ${OS} = "Mac" ]; then
    set +e
    brew install python3
    set -e
  elif [ ${OS} = "Linux" ]; then
    sudo apt install python3-pip python3-dev
  fi

  # setting for python3
  pip3 install --upgrade neovim
  # for ale
  pip3 install --upgrade flake8
  # for deoplete-jedi
  pip3 install --upgrade jedi
}

link_vim_settings() {
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

  # tex.vim
  if [ -e ~/.vim/conf.d/languages/tex.vim ]; then
    rm ~/.vim/conf.d/languages/tex.vim
  fi
  ln -F -s ${NPWD}/vim/conf.d/languages/tex.vim ~/.vim/conf.d/languages/tex.vim

  # markdown.css
  if [ -e ~/.vim/conf.d/languages/markdown.css ]; then
    rm ~/.vim/conf.d/languages/markdown.css
  fi
  ln -F -s ${NPWD}/vim/conf.d/languages/markdown.css ~/.vim/conf.d/languages/markdown.css

  mkdir -p ~/.vim/bundle
}

patch_markdown() {
  # markdown
  # this will be fixed if previm module has some changes
  cd ~/.vim/bundle/repos/github.com/kannokanno/previm
  git checkout .
  patch -u preview/_/index.html < "${NPWD}/vim/conf.d/languages/mathjax_html.patch"
  patch -u preview/_/js/previm.js < "${NPWD}/vim/conf.d/languages/mathjax_js.patch"
  cd ${NPWD}
}

link_zsh() {
  if [ ${WZSH} = "true" ]; then
    set +e
    if [ ${OS} = "Mac" ]; then
      brew install peco
    fi
    set -e
    # zsh
    if [ -e ~/.zshrc ]; then
      rm ~/.zshrc
    fi
    ln -F -s ${NPWD}/zsh/.zshrc ~/.zshrc
    if [ ${WZPLUG} = "true" ]; then
      curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    fi
    mkdir -p ~/.zprezto
    ln -sf ~/.zplug/repos/sorin-ionescu/prezto ~/.zprezto
    if [ -e ~/.zlogin ]; then
      rm ~/.zlogin
    fi
    ln -s ~/.zprezto/prezto/runcoms/zlogin ~/.zlogin
    if [ -e ~/.zlogout ]; then
      rm ~/.zlogout
    fi
    ln -s ~/.zprezto/prezto/runcoms/zlogout ~/.zlogout
    if [ -e ~/.zpreztorc ]; then
      rm ~/.zpreztorc
    fi
    ln -s ~/.zprezto/prezto/runcoms/zpreztorc ~/.zpreztorc
    if [ -e ~/.zprofile ]; then
      rm ~/.zprofile
    fi
    ln -s ~/.zprezto/prezto/runcoms/zprofile ~/.zprofile
    if [ -e ~/.zshenv ]; then
      rm ~/.zshenv
    fi
    ln -s ~/.zprezto/prezto/runcoms/zshenv ~/.zshenv
  else
    printf "\e[32mSkip configuration for zsh ...\e[m\n"
  fi
}

link_tex() {
  if [ -e ~/.latexmkrc ]; then
    rm ~/.latexmkrc
  fi
  if [ ${OS} = "Mac" ]; then
    set +e
    brew install evince
    set -e
    # latexmkrc
    ln -F -s ${NPWD}/latex/.latexmkrc.mac ~/.latexmkrc
  elif [ ${OS} = "Linux" ]; then
    # latexmkrc
    sudo apt install mupdf
    ln -F -s ${NPWD}/latex/.latexmkrc.linux ~/.latexmkrc
  fi
}

config_github() {
  if [ -e ~/.gitignore_global ]; then
    rm ~/.gitignore_global
  fi
  ln -F -s ${NPWD}/github/.gitignore_global ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
}

# check os is valid
check_os
echo "OS: $OS"

# check option
check_opt $@

printf "\e[32mConfiguration for ${OS} Start!\e[m\n"

# ask whether to reinstall setting if setting already exists
ask_resetting

# install python and depending packages
printf "\e[32mInstalling python3 and depending packages ...\e[m\n"
install_python


# link vim settings
printf "\e[32mConfiguration for vim ...\e[m\n"
link_vim_settings
patch_markdown

# link zsh
printf "\e[32mConfiguration for zsh ...\e[m\n"
link_zsh

# link tex
link_tex
printf "\e[32mConfiguration for tex ...\e[m\n"

# config github
printf "\e[32mConfiguration for github ...\e[m\n"
config_github

printf "\e[32mDone!\e[m\n"
