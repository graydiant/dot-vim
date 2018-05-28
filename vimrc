"This must be first, because it changes other options as a side effect.
"Forget compatibility with Vi. Who cares.
set nocompatible
set fileencoding=utf-8
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

runtime macros/matchit.vim

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'ack.vim'
Bundle 'itchyny/lightline.vim'
Bundle "ctrlpvim/ctrlp.vim"
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Bundle 'godlygeek/tabular'
" Bundle 'scrooloose/syntastic'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-haml'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rvm'
Bundle 'vim-ruby/vim-ruby'
Bundle "othree/html5.vim"
" snipmate stuff:
" Bundle "MarcWeber/vim-addon-mw-utils"
" Bundle "tomtom/tlib_vim"
" Bundle "garbas/vim-snipmate"
" Bundle 'isRuslan/vim-es6'
" Bundle 'pangloss/vim-javascript'
Bundle 'othree/yajs.vim'
" Bundle "bentayloruk/vim-react-es6-snippets"
" /snipmate stuff:
" ultisnips
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
Bundle 'graydiant/vim-react-snippets'
Bundle 'epilande/vim-es2015-snippets'
Bundle 'hotoo/jsgf.vim'
"/ ultisnips
" Bundle 'bling/vim-airline'
" Bundle 'vim-airline/vim-airline-themes'
Bundle 'kana/vim-fakeclip'
Bundle 'Yggdroot/indentLine'
Bundle 'elixir-lang/vim-elixir'
Bundle 'avdgaag/vim-phoenix'
Bundle 'mxw/vim-jsx'
" Bundle 'MaxMEllon/vim-jsx-pretty'
Bundle 'mattn/emmet-vim'
Bundle 'kewah/vim-stylefmt'
Bundle 'styled-components/vim-styled-components'
Bundle 'https://github.com/wesQ3/vim-windowswap'
Bundle 'hail2u/vim-css3-syntax'

" themes
Bundle 'mhartington/oceanic-next'
Bundle 'sonph/onehalf'
Bundle 'joshdick/onedark.vim'
Plugin 'jacoborus/tender.vim'

let g:indentLine_char = '|'

" Angular
" Bundle 'burnettk/vim-angular'
" Bundle 'matthewsimo/angular-vim-snippets'
" Bundle 'claco/jasmine.vim'
" Bundle 'elzr/vim-json'
" emberjs
" " Bundle 'mustache/vim-mustache-handlebars'

"Enable filetypes
filetype plugin indent on
syntax on

let mapleader = ","
set ignorecase
set hlsearch
set autoindent
set autoread
set smartindent
set backspace=indent,eol,start
set number
set ruler
set expandtab ts=2 sts=2 sw=2 ai

" show hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" activate TAB auto-completion for file paths
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" imap <Tab> <C-P>

set incsearch

" NERDTree mapping
nnoremap <leader>n :NERDTreeToggle<CR>

" fuzzyfinder mapping
let ignorefile = ".gitignore"
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>ft :FufCoverageFile<CR>
" fuzzyfinder dropdown background in twilight theme
" :hi Pmenu ctermbg=blue

" reload .vimrc
nnoremap <leader>ev :e ~/.vim/vimrc<CR>
nnoremap <leader>vr :source ~/.vim/vimrc<CR>

"vroom setup
let g:vroom_use_spring = 0
let g:vroom_use_binstubs = 0
let g:vroom_use_zeus = 0

let g:rubytest_in_quickfix = 1

let g:vim_jsx_pretty_colorful_config = 1 " default 0

nnoremap <leader>bc :Bclose<CR>

" ctrlp
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/](deps|node_modules|bower_components|dist|log|_build)$'
" map <leader>cpc :CtrlPClearCache<CR>

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['prettier', 'stylelint'],
\}
let g:ale_javascript_eslint_use_global = 0
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['prettier', 'stylelint'],
\   'ruby': ['rubocop']
\}
let g:ale_fix_on_save = 1

" emmet stuff
let g:user_emmet_leader_key='<C-Y>'
let g:user_emmet_mode='a'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
  \      'extends' : ['jsx', 'css'],
  \  },
\}
nnoremap <silent> <leader>cs :Stylefmt<CR>
imap ;; <Esc>

let g:UltiSnipsExpandTrigger="<tab>"

" set autochdir
" pretty colours
set guifont=Hack:h12

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors

set background=dark " Setting dark mode

" colorscheme Tomorrow-Night
" colorscheme twilight256
colorscheme OceanicNext
" colorscheme onedark


" airline
:set laststatus=2
" let g:airline_theme='oceanicnext'
" let g:airline_theme='onehalfdark'
let g:lightline = {
  \ 'colorscheme': 'oceanicnext',
  \ }

