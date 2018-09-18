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
zplug 'zsh-users/zsh-syntax-highlighting', nice:9

# enhanced cd
zplug 'b4b4r07/enhancd', use:init.sh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# alias
if [ "$(uname)" = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

# keybind
bindkey -v

alias la='ls -a'
alias ll='ls -l'

# alias for programming contest
# https://github.com/fumiphys/programming_contest
alias utem='~/github/programming_contest/utils/use_template.sh'
alias tcas='~/github/programming_contest/utils/test_case.sh'
alias ftes='~/github/programming_contest/utils/atcoder/fetch_testcase.sh'
alias vi='vim'
