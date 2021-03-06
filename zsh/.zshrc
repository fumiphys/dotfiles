# alias
if [ "$(uname)" = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

# keybind
bindkey -v

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{094}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{094}+"
zstyle ':vcs_info:*' formats "%F{022}(%b)%c%u%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

PROMPT=$'%B%F{245}%*%f %F{094}%~%f ${vcs_info_msg_0_} %b\n%F{022}>%f%F{028}>%f%F{029}>%f '
RPROMPT=$'%F{090}%(?..[status: %?])%f'

# vim
export VIM_PYTHON3_PATH="$(which python3)"
if [ "$(uname)" = 'Darwin' ]; then
  alias vim='/usr/local/bin/vim'
  alias vi='vim'
  # alias emacs='/usr/local/Cellar/emacs-plus/26.2/bin/emacs'
fi

# emacs
alias spacemacs='emacs -nw'

alias la='ls -a'
alias ll='ls -l'

if [ "$(uname)" = 'Darwin' ]; then
  alias pbc='pbcopy'
fi

# kubernetes
# which kubectl > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#   alias k='kubectl'
#   source <(kubectl completion zsh)
# fi

# default python
if [ "$(uname)" = 'Darwin' ]; then
  alias pip3.8=/usr/local/Cellar/python@3.8/3.8.7/bin/pip3
  alias python3.8=/usr/local/Cellar/python@3.8/3.8.7/bin/python3
fi

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

# ctags
if [ "$(uname)" = 'Darwin' ]; then
  alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
fi

# libffi
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# postgresql
export PGDATA=/usr/local/var/postgres

# zsh
# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# llvm
if [ "$(uname)" = 'Darwin' ]; then
  export PATH="/usr/local/opt/llvm/bin:$PATH"
fi

if [ "$(uname)" = 'Darwin' ]; then
  export PATH=$PATH:/Users/${USERNAME}/github/programming_contest/utils/procon_tools
fi

# zsh-completions
if [ "$(uname)" = 'Darwin' ]; then
  if [ -e /usr/local/share/zsh-completions ]; then
      FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

      autoload -Uz compinit
      compinit
  fi
fi
# zsh-syntax-highlighting
if [ "$(uname)" = 'Darwin' ]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# cd-gitroot
if [ "$(uname)" = 'Darwin' ]; then
  FPATH=/Users/${USERNAME}/.zsh_cd_gitroot/cd-gitroot:$FPATH
  autoload -Uz cd-gitroot
fi

# rust
export PATH=$PATH:${HOME}/.cargo/bin
