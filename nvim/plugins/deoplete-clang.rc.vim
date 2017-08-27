let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.9/lib/libclang-3.9.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'

function! s:clang_format()
	let now_line = line(".")
	exec ":%! clang-format-3.9"
	exec ":" . now_line
endfunction

if executable('clang-format-3.9')
	augroup cpp_clang_format
	autocmd!
	autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] call s:clang_format()
	autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
	augroup END
endif
