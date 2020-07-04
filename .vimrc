set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugins for status/tabline
Plugin 'vim-airline/vim-airline'
" plugin to set multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" plugin surrounding feature
Plugin 'tpope/vim-surround'
" plugin commentary feature
Plugin 'tpope/vim-commentary'
" plugin for git
Plugin 'tpope/vim-fugitive'
" Shows git uncommited changes in lines
Plugin 'airblade/vim-gitgutter'
" plugin to go to matching tag/parentisis/block...
Plugin 'adelarsq/vim-matchit'
" plugin to insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'
" plugin to show hex colors
Plugin 'ap/vim-css-color'
" gruvbox colorscheme
Plugin 'gruvbox-community/gruvbox'
" fuzzy search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Rooter changes the working directory to the project root when you open a file or directory.
Plugin 'airblade/vim-rooter'
" plugin for intelisense for multiple languages; has own extensions for
" multiple languages/features
Plugin 'neoclide/coc.nvim'
" shows devicons on file explorer - works with an installed Nerd Font
Plugin 'ryanoasis/vim-devicons'
call vundle#end()
filetype plugin indent on



" -------------BEGIN CUSTOMIZATION-------------
colorscheme gruvbox
set background=dark

" GitGutter symbols
let mapleader = "\<Space>"
" git gutter symbols
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
" remove gitgutter map keys
let g:gitgutter_map_keys = 0

" FZF mappings
map <C-f> :Files<CR>
map <leader><C-f> :GFiles<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
" nnoremap <leader>t :Tags<CR> this will need ctags not used for now
nnoremap <leader>m :Marks<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" escape insert mode
inoremap jj <Esc>
" source current file
nnoremap <leader>ç :source %<CR>
" Save file
nnoremap <leader>w :w<CR>
" Save all files opened
nnoremap <leader>W :wa<CR>
" Quit
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

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

" console.log snippet
nnoremap <leader>cl oconsole.log()<Esc>=G$i
" Coc
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cr <Plug>(coc-references)
nnoremap <leader>cf :CocFix<CR>
nnoremap <leader>e :CocCommand explorer<CR>

" GitGutter
nnoremap <leader>ga :GitGutterStageHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
" Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpull origin
nnoremap <leader>gP :Gpush origin
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>
nnoremap <leader>gb :Gblame<CR>

" ------WINDOW------
" resize screen height/width
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Right> <C-w>>
nnoremap <Left> <C-w><
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
nnoremap <leader>bD :bd!<CR>
" list buffers
nnoremap <leader>bs :ls<CR>

" kill tmux session (add name argument to the command)
nnoremap <leader>tks :!tmux kill-session -t

syntax on
set encoding=utf-8
set incsearch
set shortmess-=S
set noerrorbells
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

" macro to create portal environment itemModel in BB project
let @p="gg/sba-sba-retail-app\<CR>:nohl\<CR>3kdgg%jdG==:%s/preferences/properties\<CR>ggjddggyG"
" macro to change angular.json for single component unit testing purposes
let @t="gg/test.ts\<CR>:nohl\<CR>ci\"libs//test.ts\<Esc>4ba"

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!    g`\"" | endif
augroup END
" -------------END CUSTOMIZATION-------------



" -------------BEGGINING FZF SEARCH CONFIGURATION-------------
" requires ripgrep and fzf installation on the OS

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>p  <Plug>(coc-format)
nmap <leader>p  <Plug>(coc-format)

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
" -------------END COC CONFIGURATIONS-------------



" -------------HAVE TO BE LAST BECAUSE OF LOADING ORDER-------------
" Create a dictionary of the colors for later use
" https://github.com/zeorin/dotfiles/blob/e01cebf/.vimrc#L864-L900
" took this solution to colorize devicons in coc-explorer
		let g:gruvbox = {
			\"gui": {
				\"base03": "#002b36",
				\"base02": "#073642",
				\"base01": "#586e75",
				\"base00": "#657b83",
				\"base0": "#839496",
				\"base1": "#93a1a1",
				\"base2": "#eee8d5",
				\"base3": "#fdf6e3",
				\"yellow": "#b58900",
				\"orange": "#cb4b16",
				\"red": "#dc322f",
				\"magenta": "#d33682",
				\"violet": "#6c71c4",
				\"blue": "#268bd2",
				\"cyan": "#2aa198",
				\"green": "#719e07"
			\},
			\"cterm": {
				\"base03": 8,
				\"base02": 0,
				\"base01": 10,
				\"base00": 11,
				\"base0": 12,
				\"base1": 14,
				\"base2": 7,
				\"base3": 15,
				\"yellow": 3,
				\"orange": 9,
				\"red": 1,
				\"magenta": 5,
				\"violet": 13,
				\"blue": 4,
				\"cyan": 6,
				\"green": 2
			\}
		\}

function! DeviconsColors(config)
			let colors = keys(a:config)
			augroup devicons_colors
				autocmd!
				for color in colors
					if color == 'normal'
						exec 'autocmd FileType coc-explorer if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:gruvbox.gui.base01.' ctermfg='.g:gruvbox.cterm.base01.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:gruvbox.gui.base1.' ctermfg='.g:gruvbox.cterm.base1.' | '.
							\ 'endif'
					elseif color == 'emphasize'
						exec 'autocmd FileType coc-explorer if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:gruvbox.gui.base1.' ctermfg='.g:gruvbox.cterm.base1.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:gruvbox.gui.base01.' ctermfg='.g:gruvbox.cterm.base01.' | '.
							\ 'endif'
					else
						exec 'autocmd FileType coc-explorer highlight devicons_'.color.' guifg='.g:gruvbox.gui[color].' ctermfg='.g:gruvbox.cterm[color]
					endif
					exec 'autocmd FileType coc-explorer syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
				endfor
			augroup END
		endfunction
		let g:devicons_colors = {
			\'normal': ['', '', '', '', ''],
			\'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
			\'yellow': ['', '', ''],
			\'orange': ['', '', '', 'λ', '', ''],
			\'red': ['', '', '', '', '', '', '', '', ''],
			\'magenta': [''],
			\'violet': ['', '', '', ''],
			\'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
			\'cyan': ['', '', '', ''],
			\'green': ['', '', '', '']
		\}
		call DeviconsColors(g:devicons_colors)
