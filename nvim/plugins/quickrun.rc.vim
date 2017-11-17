let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
  \ 'runner' : 'vimproc',
  \ 'outputter' : 'quickfix'
  \ }

let g:quickrun_config.cpp = {
  \ 'command' : 'clang++-4.0',
  \ 'cmdopt' : '-std=c++11 -Wall -Wextra'
  \ }
