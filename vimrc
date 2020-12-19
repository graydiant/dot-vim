"this must be first, because it changes other options as a side effect.
"Forget compatibility with Vi. Who cares.
" ,set langmenu=en_US.UTF-8
language en_CA.UTF-8

set nocompatible
set fileencoding=UTF-8
set encoding=UTF-8

call plug#begin('~/.vim/plugged')

runtime macros/matchit.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'othree/html5.vim'
" Plug 'styled-components/vim-styled-components'

" ultisnips
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
"/ ultisnips
Plug 'kana/vim-fakeclip'
Plug 'Yggdroot/indentLine'
Plug 'hail2u/vim-css3-syntax'

Plug 'styled-components/vim-styled-components'
Plug 'jparise/vim-graphql'
Plug 'elzr/vim-json'

" Plug 'peitalin/vim-jsx-typescript'
Plug 'othree/yajs.vim'
Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'neoclide/vim-jsx-improve'

" themes
" Plug 'chriskempson/base16-vim'

Plug 'mhartington/oceanic-next'

" Plug 'connorholyday/vim-snazzy'

call plug#end()



let g:indentLine_char = '|'

"Enable filetypes
filetype plugin indent on

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

set incsearch
"FZF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>

" NERDTree mapping
nnoremap <leader>n :NERDTreeToggle<CR>

" reload .vimrc
nnoremap <leader>ev :e ~/.vim/vimrc<CR>
nnoremap <leader>vr :source ~/.vim/vimrc<CR>

let g:vim_jsx_pretty_colorful_config = 0 " default 0

nnoremap <leader>bc :Bclose<CR>

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" let g:user_emmet_leader_key='<C-Y>'
" let g:user_emmet_mode='a'
" let g:user_emmet_settings = {
" \  'javascript.jsx' : {
"   \      'extends' : ['jsx', 'css'],
"   \  },
" \}

imap <leader><leader> <Esc>

" pretty colours
set guifont=Fira\ Code:h12


set t_ut=
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
set background=dark

" airline
:set laststatus=2
" let g:airline_theme='oceanicnext'
" let g:airline_powerline_fonts = 1
" let g:eleline_powerline_fonts = 1
" let g:lightline = {
"   \ 'colorscheme': 'oceanicnext',
"   \ }
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'oceanicnext',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }


  " if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" set eslint.autoFixOnSave = 1

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" maybe deal with slow COC
let g:coc_node_args = ['--max-old-space-size=8192']
