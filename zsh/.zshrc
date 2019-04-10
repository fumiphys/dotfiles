# setting for zsh
# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# git
zplug 'mollifier/cd-gitroot'

# colorscheme
zplug 'yous/lime'

# advenced completion
zplug 'zsh-users/zsh-completions'

# syntax highlight
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# enhanced cd
zplug 'b4b4r07/enhancd', use:init.sh

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


# vim
export VIM_PYTHON3_PATH="$(which python3)"
if [ "$(uname)" = 'Darwin' ]; then
  alias vim='/usr/local/bin/vim'
fi

alias la='ls -a'
alias ll='ls -l'

# alias for programming contest
# https://github.com/fumiphys/programming_contest
if [ "$(uname)" = 'Darwin' ]; then
  source ~/github/programming_contest/utils/pc_scripts.sh
fi

# vim
# alias vi='vim'

# kubernetes
alias k='kubectl'
source <(kubectl completion zsh)

# cquery
export PATH=$HOME/github/cquery/build/release/bin:$PATH

# pyenv
export PATH=$HOME/.pyenv/bin:$PATH
eval "$(pyenv init -)"

# editor
export LESSEDIT='/usr/local/bin/vim %f'

# encoding
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# openssl
if [ "$(uname)" = 'Darwin' ]; then
  export PATH=/usr/local/Cellar/openssl/1.0.2p/bin/:$PATH
  export OPENSSL_ROOT_DIR=/usr/local/Cellar/openssl/1.0.2p
  export OPENSSL_LIBRARIES=/usr/local/Cellar/openssl/1.0.2p/lib
  export CPATH=$CPATH:/usr/local/Cellar/openssl/1.0.2p/include
fi

# zprezto
# source ~/.zprezto/prezto/init.zsh

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
