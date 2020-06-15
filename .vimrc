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

" fuzzy search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Rooter changes the working directory to the project root when you open a file or directory.
Plugin 'airblade/vim-rooter'
Plugin 'neoclide/coc.nvim'
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
" remove gitgutter map keys
let g:gitgutter_map_keys = 0
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


" BEGGINING OF FZF SEARCH CONFIGURATION

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
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
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


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

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" END OF FZF SEARCH CONFIGURATION


map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
" nnoremap <leader>t :Tags<CR> this will need ctags not used for now
nnoremap <leader>m :Marks<CR>

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

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" open NerdTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind

" no highlight
nnoremap <leader>nh :nohl<CR>

" Coc
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cr <Plug>(coc-definition)
nnoremap <leader>cf :CocFix<CR>

" Prettier
nnoremap <leader>p :Prettier<CR>
" GitGutter
nnoremap <leader>ga :GitGutterStageHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
" Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpull origin
nnoremap <leader>gps :Gpush origin
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gh :Gdiffget //2<CR>
nnoremap <leader>gl :Gdiffget //3<CR>
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
nnoremap <leader>tks :!tmux kill-session -t

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

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!    g`\"" | endif
augroup END

"" ------------- END OF JOAO LOBAO CUSTOMIZATION-------------





" BEGIN COC CONFIGURATIONS
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
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" END COC CONFIGURATIONS

