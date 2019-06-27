" Copy content only! Dont use this file directly
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'brooth/far.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"============================================================"

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Line number
set nu
set cursorline

" Search
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <C-b>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" Syntax
let python_highlight_all=1
syntax on

set backspace=indent,eol,start

" Color schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Auto open NERDTree when open directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-t> :NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeToggle<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = "fancy"

" Go to tab by number
" <leader> == \
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
