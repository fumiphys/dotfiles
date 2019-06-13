#!/bin/bash
# written by fumiphys
# To use this script, execute
# $ chmod +x setting.sh
# $ ./setting.sh [--no-zsh, --no-zplug]

# os information
# if you use mac, brew will be used.
# if you use linux, apt will be used.
# if you use windows, I will think it later.

OS="" WZSH=true
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

install_essential() {
  if [ ${OS} = "Mac" ]; then
    set +e
    brew update
    brew upgrade
    brew install cmake
    set -e
  elif [ ${OS} = "Linux" ]; then
    sudo apt update
    sudo apt install -y build-essential
  fi
}

install_cpp() {
  brew install cppcheck
}

install_python() {
  if [ ${OS} = "Mac" ]; then
    set +e
    brew install python3
    set -e
  elif [ ${OS} = "Linux" ]; then
    sudo apt install -y python3-pip python3-dev
  fi

  # setting for python3
  pip3 install --upgrade pip
  # for vim
  pip3 install --upgrade neovim
  # for ale
  pip3 install --upgrade flake8
  # for deoplete-jedi
  pip3 install --upgrade jedi
  # for lsp
  pip3 install --upgrade autopep8
  pip3 install --upgrade pydocstyle
  pip3 install --upgrade pylint
  pip3 install --upgrade rope
  pip3 install --upgrade yapf
  pip3 install --upgrade python-language-server
  pip3 install --upgrade 'python-language-server[pycodestyle]'
  # for denite
  pip3 install --upgrade pynvim
}

install_cquery() {
  mkdir -p ~/github
  cd ~/github
  if [ ! -e ~/github/cquery ]; then
    git clone --recursive https://github.com/cquery-project/cquery.git
  fi
  cd cquery
  mkdir -p build && cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES -DCMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk
  cmake --build .
  cmake --build . --target install
  cd ${NPWD}
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

  # snippets
  mkdir -p ~/.vim/bundle/neosnippet-snippets/snippets/
  if [ -e ~/github/programming_contest ]; then
    ln -F -s ~/github/programming_contest/vim/cpp.snip ~/.vim/bundle/neosnippet-snippets/snippets/cpp.snip
    ln -F -s ~/github/programming_contest/utils/vim/programming_contest.vim ~/.vim/conf.d/languages/programming_contest.vim
  fi

  vim +"call dein#update()!" +qall
}

link_sublime_settings(){
  if [ ${OS} = "Mac" ]; then
    if [ -e ~/github/programming_contest ]; then
      if [ -e "/Users/fkiyozawa/Library/Application Support/Sublime Text 3/Packages/User/Snippets" ]; then
        rm -rf "/Users/fkiyozawa/Library/Application Support/Sublime Text 3/Packages/User/Snippets"
      fi
      mkdir -p "/Users/fkiyozawa/Library/Application Support/Sublime Text 3/Packages/User/Snippets"
      cd ~/github/programming_contest/sublime
      ls *.sublime-snippet | xargs -I{} ln -F -s ~/github/programming_contest/sublime/{} "/Users/fkiyozawa/Library/Application Support/Sublime Text 3/Packages/User/Snippets/"{}
      cd ${NPWD}
    fi
  fi
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
      if [ ! -e ~/.zplug ]; then
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
      fi
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
    sudo apt install -y mupdf
    ln -F -s ${NPWD}/latex/.latexmkrc.linux ~/.latexmkrc
  fi
}

link_tmux() {
  if [ -e ~/.tmux.conf ]; then
    rm ~/.tmux.conf
  fi
  ln -F -s ${NPWD}/tmux/.tmux.conf ~/.tmux.conf
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

# install essential libraryes
printf "\e[32mInstalling essential libraries ...\e[m\n"
install_essential

# install c++ packages
install_cpp

# install python and depending packages
printf "\e[32mInstalling python3 and depending packages ...\e[m\n"
install_python

# install cquery
printf "\e[32mConfiguration for cquery ...\e[m\n"
install_cquery

# link vim settings
printf "\e[32mConfiguration for vim ...\e[m\n"
link_vim_settings
patch_markdown

# link sublime settings
printf "\e[32mConfiguration for sublime ...\e[m\n"
link_sublime_settings

# link zsh
printf "\e[32mConfiguration for zsh ...\e[m\n"
link_zsh

# link tex
printf "\e[32mConfiguration for tex ...\e[m\n"
link_tex

# link tmux
printf "\e[32mConfiguration for tmux ...\e[m\n"
link_tmux

# config github
printf "\e[32mConfiguration for github ...\e[m\n"
config_github

printf "\e[32mDone!\e[m\n"
