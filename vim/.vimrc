" root configuration file for vim
" written by fumiphys

augroup vimrc
  autocmd!
augroup END

" highlight configuration before loading plugins
autocmd vimrc VimEnter,ColorScheme * highlight VertSplit ctermbg=8 ctermfg=0
autocmd vimrc VimEnter,ColorScheme * highlight StatusLine ctermbg=12 ctermfg=0
autocmd vimrc VimEnter,ColorScheme * highlight StatusLineNC ctermbg=8 ctermfg=0

" plugins
runtime! conf.d/plugins/*.vim

" configure output dir for swap file
set directory=/tmp

" command line completion
set wildmenu

" editor configuration
set tabstop=4

" editor appearance
set number
set nowrap
set laststatus=2
set noshowmode
set cursorline

" search
set hlsearch
set incsearch

" mapping
nnoremap <ESC><ESC> :set hlsearch!<CR>
nmap s <Plug>(easymotion-overwin-f2)

" load programming contest configuration
if getcwd() =~ expand("~/competitive_programming/")
  runtime! conf.d/programming_contest/*.vim
endif
