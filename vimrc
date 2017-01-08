"This must be first, because it changes other options as a side effect.
"Forget compatibility with Vi. Who cares.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

runtime macros/matchit.vim

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
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
Bundle 'ack.vim'
Bundle "ctrlpvim/ctrlp.vim"
Bundle "othree/html5.vim"
" snipmate stuff:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
" Bundle "justinj/vim-react-snippets"
Bundle "bentayloruk/vim-react-es6-snippets"
" /snipmate stuff:
Bundle 'bling/vim-airline'
Bundle 'kana/vim-fakeclip'
Bundle 'Yggdroot/indentLine'
Bundle 'elixir-lang/vim-elixir'
Bundle 'avdgaag/vim-phoenix'
" Bundle 'metakirby5/codi.vim'
Bundle 'mxw/vim-jsx'

let g:indentLine_char = '|'

" Angular
" Bundle 'burnettk/vim-angular'
" Bundle 'pangloss/vim-javascript'
" Bundle 'othree/javascript-libraries-syntax.vim'
" Bundle 'matthewsimo/angular-vim-snippets'
" Bundle 'claco/jasmine.vim'
" Bundle 'elzr/vim-json'
" emberjs
" " Bundle 'mustache/vim-mustache-handlebars'

set t_Co=256

" airline
:set laststatus=2
let g:airline_theme='ubaryd'
let g:airline_powerline_fonts = 1

"Enable filetypes
filetype plugin indent on
syntax on

let mapleader = ","
set ignorecase
set hlsearch
set autoindent
set smartindent
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
set guifont=Hack:h12

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
:hi Pmenu ctermbg=blue

" reload .vimrc
nnoremap <leader>ev :e ~/.vim/vimrc<CR>
nnoremap <leader>vr :source ~/.vim/vimrc<CR>

"vroom setup
let g:vroom_use_spring = 0
let g:vroom_use_binstubs = 0
let g:vroom_use_zeus = 0

let g:rubytest_in_quickfix = 1

nnoremap <leader>bc :Bclose<CR>

" ctrlp
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/](deps|node_modules|bower_components|dist|log|_build)$'
map <leader>cpc :CtrlPClearCache<CR>

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" syntastic options

let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_scss_checkers = ['']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_ruby_checkers = ['rubocop']
