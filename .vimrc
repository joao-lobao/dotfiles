set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugins for statusline/tabline
Plugin 'vim-airline/vim-airline'
" plugin for auto pairs feature
Plugin 'jiangmiao/auto-pairs'
" plugin for surrounding feature
Plugin 'tpope/vim-surround'
" plugin commentary feature
Plugin 'tpope/vim-commentary'
" plugin to match corresponding closing brackets, parenthisis, tags...
Plugin 'tmhedberg/matchit'
" color highlighter
Plugin 'ap/vim-css-color'
" plugin for git integration
Plugin 'tpope/vim-fugitive'
" gruvbox colorscheme
Plugin 'gruvbox-community/gruvbox'
" fuzzy file and text search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Rooter changes the working directory to the project root when you open a file or directory.
Plugin 'airblade/vim-rooter'
" plugin for intelisense for multiple languages; has own extensions for
" multiple languages/features
Plugin 'neoclide/coc.nvim'
" fancy startup plugin
Plugin 'mhinz/vim-startify'
" shows devicons on file explorer - works with an installed Nerd Font
Plugin 'ryanoasis/vim-devicons'
call vundle#end()
filetype plugin indent on



" -------------BEGIN CUSTOMIZATION-------------

let g:coc_global_extensions = [
\ 'coc-yank',
\ 'coc-tsserver',
\ 'coc-tslint-plugin',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-html',
\ 'coc-eslint',
\ 'coc-css',
\ 'coc-angular'
\ ]

colorscheme gruvbox
set background=dark

let mapleader = "\<Space>"

" FZF mappings
map <leader>F :Files<CR>
map <leader>gF :GFiles<CR>
map <leader>B :Buffers<CR>
nnoremap <leader>R :Rgi<CR>
nnoremap <leader>gR :Rg<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>M :Marks<CR>

" escape insert mode
inoremap jj <Esc>
" source current file
nnoremap <leader>ç :source %<CR>
" Save file
nnoremap <leader>w :w<CR>
" Quit
nnoremap <leader>q :q<CR>

" Refresh file
nnoremap <leader>r :e!<CR>

" Go to previous file
nnoremap <leader>P :e#<CR>
" Lazygit
" requires lazygit installation on the OS
nnoremap <leader>L :!lazygit<CR>

" Switching windows
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

" indent
nnoremap == gg=G''

" no highlight
nnoremap <leader>nh :nohl<CR>

" Coc
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>dp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>dn <Plug>(coc-diagnostic-next)
nnoremap <leader>f :CocFix<CR>

" Vim Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>
nnoremap <leader>gb :Gblame<CR>

" ------BUFFERS------
" buffer naviagation, open and deleting
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bD :bd!<CR>

" Formatting selected code.
xmap <leader>p  <Plug>(coc-format)
nmap <leader>p  <Plug>(coc-format)

" Specific custom macros and mappings
let @k=":!tmux kill-session -t"
let @p="gg/sba-sba-retail-app\<CR>:nohl\<CR>3kdgg%jdG==:%s/preferences/properties\<CR>ggjddggyG"
let @t="gg/test.ts\<CR>:nohl\<CR>ci\"libs//test.ts\<Esc>4ba"

" shift lines up and down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" no operation keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>


syntax on
set encoding=utf-8
set incsearch
set hlsearch
set shortmess-=S
set belloff=all
set ignorecase
set ruler
set number
set relativenumber
set nowrap
set path+=**
set wildmenu
set clipboard=unnamedplus
set foldmethod=indent
set foldlevelstart=99
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

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!    g`\"" | endif
augroup END

" This solves the '>4;2m' chars showing on cursor position > :h modifyOtherKeys for more info
let &t_TI = ""
let &t_TE = ""

" -------------END CUSTOMIZATION-------------



" -------------BEGGINING FZF SEARCH CONFIGURATION-------------
" requires ripgrep and fzf installation on the OS

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" added --no-ignore-vcs option to search in directories project in gitignore
let $FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" Get text in files with Rg
" added --no-ignore-vcs option to search in directories project in gitignore
command! -bang -nargs=* Rgi
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore-vcs '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" -------------END FZF SEARCH CONFIGURATION-------------



" -------------BEGIN COC CONFIGURATIONS-------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" -------------END COC CONFIGURATIONS-------------
