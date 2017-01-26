" SCRIPT FROM VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" BORRE ORIG V
"Its either u configure VIM and struggle like a man
"or drop ur balls and install nano
syntax on
nnoremap <BS> X
set backspace=indent,eol,start
set mouse=a

"Look at this nigga tryna skip showmode
"Nigga dayum, better respect my authority
set showmode

" fuck them long ass tabs...
" messes with Makefile creation
" disable for Makefiles
set tabstop=2
set autoindent
set shiftwidth=2
set expandtab
set smartindent

set rtp+=/usr/local/lib/python3.4/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

color dracula
"color ryuuko

set showmode

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_javascript_checkers=['eslint']
autocmd vimenter * wincmd p
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'
map <C-n> :NERDTreeToggle<CR>
map <C-T> :set tabstop=0<CR>
