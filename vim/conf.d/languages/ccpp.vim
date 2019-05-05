" configuration for C/C++
augroup cpp-path
  autocmd!
  autocmd Filetype cpp setlocal path=.,/usr/local/include/c++/8.3.0
  autocmd Filetype cpp call Gen_comjson()
augroup END

augroup cpp-namespace
  autocmd!
  autocmd Filetype cpp inoremap <buffer><expr>; <SID>expand_namespace()
augroup END

function! s:expand_namespace()
  let s = getline('.')[0:col('.')-1]
  if s =~# '\<b;$'
    return "\<BS>oost::"
  elseif s =~# '\<s;$'
    return "\<BS>td::"
  else
    return ';'
  endif
endfunction

function! Gen_comjson()
  let temp = expand('%:p')
  let dir = expand('%:p:h')
  silent echo system('echo ''[{"directory": "' . dir . '","command": "/usr/bin/c++ ' . temp . ' -std=c++11 ","file": "' . temp . '"}]'' > .cquery')
endfunction
