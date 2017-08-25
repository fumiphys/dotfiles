autocmd MyAutoCmd VimEnter,ColorScheme highlight LightlineLeft_normal_0 cterm=NONE


"autocmd Filetype c ClangFormatAutoEnable

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
" In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
" When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
	\	if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
 augroup END
endif

set foldmethod=marker

tnoremap <silent> <ESC> <C-\><c-n>

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
