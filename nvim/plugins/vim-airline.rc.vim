"airline configuration
let g:airline_theme = 'monochrome'

"separator
if !exists('g:airlline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"branch
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'not repo'
let g:airline_symbols.branch = '⭠'

"tabline
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'

"section
let g:airline_section_a = airline#section#create(['mode','','branch'])
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x = 
  \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
  \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
  \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline_section_error = ''
let g:airline_section_warning = ''
