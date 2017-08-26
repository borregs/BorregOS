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
Plugin 'surround/vim-surround'
Plugin 'powerline/powerline'



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

"SCRIPT FROM BORRE
"Vundle should be downloaded from its official git tree @[https://github.com/VundleVim/Vundle.vim]
"However, its worth mentioning that installing Vundle is not necessary if u gotz the pluggins in /home/user/.vim/bundle
"Best way to achieve this is to unzip bundle.zip in bundle dir
"I include a zip of the bundled pluggins I use. I do not own the pluggins!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   .vimrc - Borreconf   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   BORREConf detailed AF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=/home/borregs/powerline/powerline/bindings/vim
set rtp+=/usr/local/lib/python3.4/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

"color delek
color dracula
"color ryuuko

set showmode
set hlsearch
set ignorecase
set linespace=0
set nu
set showmatch
set incsearch


"autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Status Line - Borreconf   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cuenta la leyenda que algunos mortales siguen contando las lineas de su vi
" buscando su error... Dejese de mamadas compa.

set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"set statusline=%<%f\\ 
"set statusline+=%w%h%m%r
"set statusline+=\\ [%{&ff}/%Y]
"set statusline+=\\ [%{getcwd()}]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Syntastic - Borreconf                                           "
"                                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Only config file bellongs to me.                                    "
"                                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                                   
"                    It's a bird! It's a plane! ZOMG It's ...
"
"                   _____             __             __  _     
"                  / ___/__  ______  / /_____ ______/ /_(_)____ 
"                  \__ \/ / / / __ \/ __/ __ `/ ___/ __/ / ___/ 
"                 ___/ / /_/ / / / / /_/ /_/ (__  ) /_/ / /__   
"                /____/\__, /_/ /_/\__/\__,_/____/\__/_/\___/   
"                     /____/                                    
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['eslint']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  NERDTree - Borreconf   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


autocmd vimenter * wincmd p "Cursor siempre abre en la ventana principal
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'
let g:NERDTreeChDirMode=0
let g:NERDTreeKeepTreeInNewTab=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   'Soy el mapa'... get it :V  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Les advierto q mis mappeos no les gustaran a todos. Es mejor mappear acorde a cada 
" Teclado y usuario.

cmap Q q
cmap qq q!

nmap <leader>nt :NERDTreeFind<CR>


map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
map <C-T> :set tabstop=0<CR>
