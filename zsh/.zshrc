# setting for zsh
# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# git
zplug 'mollifier/cd-gitroot'

# colorscheme
# zplug 'yous/lime'

# advenced completion
zplug 'zsh-users/zsh-completions'

# syntax highlight
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# enhanced cd
zplug 'b4b4r07/enhancd', use:init.sh

# if ! zplug check > /dev/null 2>&1; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi

zplug load > /dev/null 2>&1

# prompt
autoload -Uz colors
autoload -Uz vcs_info
setopt prompt_subst
colors
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' %c%u(%s:%b) '
zstyle ':vcs_info:*' actionformats ' %c%u(%s:%b|%a)'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT='%{[38;5;004m%}%~ %{[0m%}%{[38;5;002m%}❯%{[0m%}'
PROMPT=$PROMPT'%{[38;5;090m%}%1(v|%1v|)%{[0m%}%{[38;5;002m%}❯ %{[0m%}
❯ '
# RPROMPT='%{[38;5;002m%}❯ %? ❯ %* ❯%{[0m%}'

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
  alias vi='vim'
  alias emacs='/usr/local/Cellar/emacs-plus/26.2/bin/emacs'
fi

alias la='ls -a'
alias ll='ls -l'

if [ "$(uname)" = 'Darwin' ]; then
  alias pbc='pbcopy'
fi

# git
alias gst='git status'
alias gco='git commit'
alias gph='git push'
alias gphm='git push origin master'
alias gpl='git pull'
alias gplm='git pull origin master'
alias gad='git add'
alias gdi='git diff'

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
export PATH=$HOME/github/cquery/build/release/bin:$PATH

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

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
