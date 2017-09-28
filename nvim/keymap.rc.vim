nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"nohlsearch
nmap <ESC><ESC> :nohl<CR><ESC>

if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif
