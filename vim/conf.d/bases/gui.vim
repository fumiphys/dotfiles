" configuration for gui
" colorscheme
set background=dark
augroup vim-colors
  autocmd!
  autocmd ColorScheme * hi Visual ctermbg=236
  autocmd ColorScheme * hi ErrorMsg ctermbg=0
  autocmd ColorScheme * hi Pmenu ctermbg=0 ctermfg=39
  autocmd ColorScheme * hi PmenuSel ctermbg=232 ctermfg=33
augroup end

colorscheme nord

let g:nord_italic = 1
