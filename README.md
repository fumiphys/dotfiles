# dotfiles
dotfiles

This repository is now being reconstructed. To use old version, use branch 'clean'.

## supported platform (for now)
 - Mac os X
 - Linux
 - Cygwin

## use (installation)
```
chmod +x setting.sh
./setting.sh
```
and then, rewrite vim/conf.d/plugins/dein_lazy.toml
```
let g:deoplete#sources#jedi#python_path = `which python3`
```
(This will be written in setting.sh later.)

## detail
 - [vim](vim/)

## TODO
 - vim
 - latex
 - zsh
 - (tmux?)
