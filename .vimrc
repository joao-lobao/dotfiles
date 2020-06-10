set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugins for status/tabline
Plugin 'vim-airline/vim-airline'
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
" Shows git uncommited changes in lines
Plugin 'airblade/vim-gitgutter'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" auto complete
Plugin 'ycm-core/YouCompleteMe'

" plugin to enable typescript syntax support
Plugin 'leafgarland/typescript-vim'
" plugin to go to matching tag/parentisis/block...
Plugin 'adelarsq/vim-matchit'
" plugin to insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'
" plugin for NerdTree
Plugin 'preservim/nerdtree'
" plugin for git integration with NerdTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" plugin wrapper for prettier (lint/format)
Plugin 'prettier/vim-prettier'
" plugin for linting
Plugin 'dense-analysis/ale'
" plugin to show hex colors
Plugin 'ap/vim-css-color'

Plugin 'mbbill/undotree'
Plugin 'gruvbox-community/gruvbox'
Plugin 'kien/ctrlp.vim'

" Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
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

" to enable CtrlP search also by path and not only by file name
let g:ctrlp_by_filename = 0

"-------------BEGIN JOAO LOBAO CUSTOMIZATION-------------

colorscheme gruvbox
set background=dark

let mapleader = "\<Space>"

" git gutter symbols
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
" default open file from NerdTree in current or new tab
let g:NERDTreeMapOpen='<ENTER>'
let g:NERDTreeMapOpenSplit='<C-h>' "NERDTree
let g:NERDTreeMapOpenVSplit='<C-v>' "NERDTree
" nerd tree git symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" escape insert mode
inoremap jj <Esc>

" Switching windows
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
" copy to clipboard
nnoremap y "+y
" indent
nnoremap == gg=G''

" open NerdTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind

" no highlight
nnoremap <leader>nh :nohl<CR>

" YouCompleteMe features
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <leader>yrr :YcmCompleter RefactorRename
nnoremap <leader>y= :YcmCompleter Format<CR>
nnoremap <leader>yi :YcmCompleter OrganizeImports<CR>
" Prettier
nnoremap <leader>p :Prettier<CR>
" Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpull origin
nnoremap <leader>gps :Gpush origin
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gh :Gdiffget //2<CR>
nnoremap <leader>gl :Gdiffget //3<CR>
nnoremap <leader>ga :diffput<CR>
" GitGutter
nnoremap <leader>gg :GitGutter<CR>

" ------WINDOW------
" resize screen height/width
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Right> <C-w>>
nnoremap <Left> <C-w><
" rotate window in each ways
nnoremap <leader>r <C-w>r
nnoremap <leader>R <C-w>R
" spliting with new files
nnoremap <leader>s :new<CR>
nnoremap <leader>sv :vnew<CR>


" ------TABS------
" tab naviagation, open and closing
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>td :tabc<CR>
" tab find {arg} - opens a new tab for the {arg} file
nnoremap <leader>tf :tabf<CR>
" list tabs
nnoremap <leader>ts :tabs<CR>


" ------BUFFERS------
" buffer naviagation, open and deleting
nnoremap <leader>bo :enew<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
" list buffers
nnoremap <leader>bs :ls<CR>

" Save file
nnoremap <C-s> :w<CR>
" kill tmux session (add name argument to the command)
nnoremap <leader>ks :!tmux kill-session -t

syntax on
set encoding=utf-8
set incsearch
set hlsearch
set noerrorbells
set ignorecase
set ruler
set number
set relativenumber
set nowrap
set path+=**
set wildmenu
set clipboard=unnamed
" The width of a TAB is set to 2.
set tabstop=2
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

highlight ExtraWhitespace ctermbg=red guibg=red
call matchadd('ExtraWhitespace', '\s\+$', 11)
highlight OverLength ctermbg=red guibg=red
call matchadd('OverLength', '\%<80v.\%>79v')" to highlight char as red in 79 column

set ai "Auto indent
set si "Smart indent

" macro to create portal environment itemModel in BB project
let @p="gg/sba-sba-retail-app\<CR>:nohl\<CR>3kdgg%jdG==:%s/preferences/properties\<CR>ggjddggyG"

" autoclose preview window after autocomplete insertion
let g:ycm_autoclose_preview_window_after_insertion=1

"" ------------- END OF JOAO LOBAO CUSTOMIZATION-------------

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!    g`\"" | endif
augroup END

