let g:airline_linecolumn_prefix = ''
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#readonly#enabled = 0
let g:airline_section_b =
      \ '%{airline#extensions#branch#get_head()}' .
      \ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . " "):""}' .
      \ '%{airline#extensions#readonly#get_mark()}' .
      \ '%t%( %M%)'
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
      \ '%{strlen(&fileformat)?&fileformat:""}'.s:sep.
      \ '%{strlen(&fenc)?&fenc:&enc}'.s:sep.
      \ '%{strlen(&filetype)?&filetype:"no ft"}'
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline_inactive_collapse = 0
function! AirLineForce()
  let g:airline_mode_map.__ = ''
  let w:airline_render_left = 1
  let w:airline_render_right = 1
endfunction
augroup AirLineForce
  autocmd!
  autocmd VimEnter * call add(g:airline_statusline_funcrefs, function('AirLineForce'))
augroup END
