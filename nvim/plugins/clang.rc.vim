augroup cpp-path
  autocmd!
  autocmd Filetype cpp setlocal path=.,/usr/include/c++/5.4.0
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
  elseif s =~# '\<d;$'
    return "\<BS>etail::"
  else
    return ";"
  endif
endfunction
