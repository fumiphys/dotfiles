" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" markdown
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'open -a Safari'

" C, C++
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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
