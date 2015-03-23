set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Functionality
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'seanhess/syntastic'
Plugin 'dag/vim2hs'
Plugin 'bitc/vim-hdevtools'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'JavaScript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'moll/vim-bbye'
Plugin 'KualiCo/vim-react-snippets'
Plugin 'scrooloose/nerdcommenter'

" Color Schemes
Plugin 'noahfrederick/vim-noctu'
Plugin 'tomasr/molokai'
Plugin 'paranoida/vim-airlineish'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"" Vundle END --> Customizations to follow >>>>
"
"" Plugin: Emmet
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_complete_tag = 1

"" Plugin: UltiSnips
" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"" Plugin: Rainbow Parens
" This makes sure they're always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" Plugin: Airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_theme = 'murmur' " I like this even better
let g:airline_theme = 'raven' " This one is nice and subtle
"let g:airline_theme = 'airlineish' " I like this one the best
"let g:airline_theme = 'luna' " Bright Colors
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = '∞'

"" Plugin: Haskell
" disable all conceals, including the simple ones like
" " lambda and composition
let g:haskell_conceal = 0

"" Plugin: CtrlP
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      "\ --ignore .git
      "\ --ignore .svn
      "\ --ignore .hg
      "\ --ignore .DS_Store
      "\ --ignore "**/*.pyc"
      "\ -g ""'
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"" Set delay to prevent extra search
"let g:ctrlp_lazy_update = 350
" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
 \ 'dir': '\.git$\|\.hg$\|\.svn$\|node_modules$',
 \ 'file': '\.o$\|\.exe$\|\.bin$'}

"" Plugin: Syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_haskell_checkers = ['hdevtools']
"let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_checkers = ['flow']

"" Plugin: Nerd Commenter
" better haskell comments
let g:NERDCustomDelimiters = {
    \ 'haskell': { 'left': '--' },
    \ }

"" Plugin: Nerd Tree
nmap <leader>t :NERDTreeToggle<cr>

"" Normal Settings
set clipboard=unnamed "Sets vim to use the system clipboard by default
syntax on
let mapleader=","
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set autoindent
" Makes it so that buffers don't have to be saved before hiding them
set hidden

"" Key Remappings
"nmap <C-b>i :bp<cr>
"nmap <C-b>o :bn<cr>
nmap <leader>d :bp<cr>
nmap <leader>f :bn<cr>
nmap <C-b> :CtrlPBuffer<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>w :bd<cr>
"nmap <leader>q :BD<cr>
nnoremap <Leader>q :Bdelete<CR>
nmap <leader>p :CtrlPMixed<cr>
nmap <leader>t :NERDTreeToggle<cr>
inoremap <F3> <c-o>:w<cr>
map <leader>rr :%s:class=:className=:g<cr>

"" Visual
set guioptions-=r "Remove scrollbars
" Send more characters to the terminal on redraw I think?
set ttyfast
" Enable mouse use in all modes
set mouse=a
" For terminal and mouse happiness
set ttymouse=xterm2
" Set dark background
set background=dark
" Enable line numbers
set nu " Line numbers
" Use the system clipboard by default
set clipboard=unnamed
" Use relative line numbers, and absolute on the current line
set relativenumber
set number

colorscheme noctu

"" Set Editor variables:
" Allow vim's `gf` to add certain extensions when looking for files to open:
set suffixesadd+=.js
set suffixesadd+=.hs


"" Set GUI options
if has("gui_running")
  colorscheme itg_flat
  set guifont=Source\ Code\ Pro\ Light:h14
endif
