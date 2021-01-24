" root configuration file for vim
" written by fumiphys

augroup vimrc
  autocmd!
augroup END

" plugins
runtime! conf.d/plugins/*.vim

" configure output dir for swap file
set directory=/tmp

" command line completion
set wildmenu

" editor appearance
set number
set nowrap
set laststatus=2
set noshowmode

autocmd vimrc VimEnter,ColorScheme * highlight VertSplit ctermbg=8 ctermfg=0
autocmd vimrc VimEnter,ColorScheme * highlight StatusLine ctermbg=12 ctermfg=0
autocmd vimrc VimEnter,ColorScheme * highlight StatusLineNC ctermbg=8 ctermfg=0

" search
set hlsearch
set incsearch

" mapping
nnoremap <ESC><ESC> :set hlsearch!<CR>
