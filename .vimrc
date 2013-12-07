"This must be first, because it changes other options as a side effect.
"Forget compatibility with Vi. Who cares.  
set nocompatible

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"activate pathogen
call pathogen#infect()

let mapleader = ","
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set number
set ruler
set ts=2 sts=2 sw=2 expandtab

" show hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" pretty colours
colorscheme twilight
set background=light
set guifont=Droid\ Sans\ Mono:h12

" activate TAB auto-completion for file paths
set wildmode=list:longest
imap <Tab> <C-P>

set incsearch

" automatically tabularize tables using the pie character
" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" NERDTree mapping
nnoremap <leader>n :NERDTreeToggle<CR>

" fuzzyfinder mapping
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>ft :FufCoverageFile<CR>
" fuzzyfinder dropdown background in twilight theme
:hi Pmenu ctermbg=blue

" reload .vimrc
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>vr :source ~/.vimrc<CR>

"vroom setup
let g:vroom_cucumber_path = 'cucumber'
