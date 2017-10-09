nnoremap j gj
nnoremap k gk
"nnoremap <Down> gj
"nnoremap <Up> gk

"you cannot use arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"nohlsearch
nmap <ESC><ESC> :nohl<CR><ESC>

if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif
