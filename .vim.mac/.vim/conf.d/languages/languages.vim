" markdown
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'open -a Safari'

" C, C++

" tex
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

" python
let g:jedi#force_py_version = 3
