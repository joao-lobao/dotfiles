set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" matrix plugin
Plugin 'uguu-org/vim-matrix-screensaver'
" plugins for status/tabline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" plugin to set multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" plugin surrounding feature
Plugin 'tpope/vim-surround'
" plugin commentary feature
Plugin 'tpope/vim-commentary'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" auto complete
Plugin 'ycm-core/YouCompleteMe'
" plugin to enable template strings syntax support
" Plugin 'Quramy/vim-js-pretty-template'
" plugin to enable javascript syntax highlighting
" Plugin 'pangloss/vim-javascript'
" TSUQUYOMI to bring IDE like features to VIM
" Plugin 'Shougo/vimproc.vim'
" TSUQUYOMI to bring IDE like features to VIM
" Plugin 'Quramy/tsuquyomi'
" Syntax checking
" Plugin 'vim-syntastic/syntastic'
" plugin to enable typescript syntax support
" Plugin 'leafgarland/typescript-vim'

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


" to enable typescript-vim plugin to display compilation errors in the QuickFix window
" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

" -------------BEGIN JOAO LOBAO CUSTOMIZATION-------------
" escape insert mode
inoremap jj <Esc>
" no arrows
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
" copy to clipboard
nnoremap y "+y
" indent
nnoremap == gg=G''
let mapleader = "\<Space>"
" nnoremap <leader>ti :TsuImport<CR>

set encoding=utf-8
set hlsearch
set ignorecase
syntax on
set ruler
set number
set relativenumber
set path+=**
set wildmenu
set clipboard=unnamed
set tabstop=2       " The width of a TAB is set to 2.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

highlight ExtraWhitespace ctermbg=lightgrey guibg=lightgrey
call matchadd('ExtraWhitespace', '\s\+$', 11)
highlight OverLength ctermbg=magenta guibg=magenta
call matchadd('OverLength', '\%<80v.\%>79v')" to highlight char as red in 79 column

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" ------------- END OF JOAO LOBAO CUSTOMIZATION-------------

" to enable template strings syntax support for vim-js-pretty-template plugin
" autocmd FileType typescript JsPreTmpl
" autocmd FileType typescript syn clear foldBraces

" Vim Matrix
if argc() == 0
  autocmd VimEnter * Matrix
endif

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!    g`\"" | endif
augroup END

" Syntax highlighting for vim-syntastic/syntastic plugin
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi']

