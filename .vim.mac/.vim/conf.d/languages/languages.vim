" markdown
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'open -a Safari'

" C, C++
augroup cpp-path
		autocmd!
		autocmd Filetype cpp setlocal path=.,/usr/include/c++/4.2.1,/usr/include
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
				return ';'
		endif
endfunction

" tex
augroup TexSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{tex} set filetype=tex
augroup END
let g:vimtex_compiler_latexmk = {
	\ 'background': 1,
	\ 'build_dir': '',
	\ 'continunous': 1,
	\ 'callback': 0,
	\ 'options': [
	\	'-pdfdvi',
	\	'-verbose',
	\	'-file-line-error',
	\	'-synctex=1',
	\	'-interaction=nonstopmode',
	\],
	\}

let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:tex_conceal = ""

" python
py3 import sys;sys.path.append('/usr/local/lib/python3.6/site-packages')

" rust
let g:deoplete#sources#rust#racer_binary='/usr/local/bin/racer'
