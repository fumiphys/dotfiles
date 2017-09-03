let g:airline_theme='luna'

let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep=''

let g:airline_right_sep=''

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1

let g:airline_skip_empty_sections=1

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message='not repo'

let g:airline#extensions#vimtex#enabled=1
