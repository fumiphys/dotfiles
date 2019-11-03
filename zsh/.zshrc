# setting for zsh
# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# git
zplug 'mollifier/cd-gitroot'

# advenced completion
zplug 'zsh-users/zsh-completions'

# syntax highlight
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# powerline
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, as:theme

if ! zplug check > /dev/null 2>&1; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load > /dev/null 2>&1

# alias
if [ "$(uname)" = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

# keybind
bindkey -v

# powerline
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
ZSH_THEME="powerlevel9k/powerlevel9k"

# vim
export VIM_PYTHON3_PATH="$(which python3)"
if [ "$(uname)" = 'Darwin' ]; then
  alias vim='/usr/local/bin/vim'
  alias vi='vim'
  alias emacs='/usr/local/Cellar/emacs-plus/26.2/bin/emacs'
fi

# emacs
alias spacemacs='emacs -nw'

alias la='ls -a'
alias ll='ls -l'

if [ "$(uname)" = 'Darwin' ]; then
  alias pbc='pbcopy'
fi

# alias for programming contest
# https://github.com/fumiphys/programming_contest
if [ "$(uname)" = 'Darwin' ]; then
  source ~/github/programming_contest/utils/pc_scripts.sh
fi

# vim
# alias vi='vim'

# kubernetes
# which kubectl > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#   alias k='kubectl'
#   source <(kubectl completion zsh)
# fi

# cquery
# export PATH=$HOME/github/cquery/build/release/bin:$PATH

# pyenv
which pyenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
  export PATH=$HOME/.pyenv/bin:$PATH
  eval "$(pyenv init -)"
fi

# editor
export LESSEDIT='/usr/local/bin/vim %f'

# encoding
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# openssl
if [ "$(uname)" = 'Darwin' ]; then
  export PATH=$PATH:/usr/local/Cellar/openssl/1.0.2p/bin
  export OPENSSL_ROOT_DIR=/usr/local/Cellar/openssl/1.0.2p
  export OPENSSL_LIBRARIES=/usr/local/Cellar/openssl/1.0.2p/lib
  export CPATH=$CPATH:/usr/local/Cellar/openssl/1.0.2p/include
fi

# libffi
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# postgresql
export PGDATA=/usr/local/var/postgres

# zsh
# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH=$PATH:/Users/fkiyozawa/github/programming_contest/utils/procon_tools
