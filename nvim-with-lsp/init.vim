" STEPS TO FOLLOW AFTER NEW UBUNTU FRESH INSTALL
" 1 - install Vim Plug with the following command: 
"   - sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" 2 - install xclip (sudo apt-get install xclip)
" 3 - install lazygit https://github.com/jesseduffield/lazygit#installation
" 4 - install ripgrep (sudo apt install ripgrep) for live_grep functionality
" 5 - install a Nerd Font:
"   - download a font from nerd fonts (ex: https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)
"   - add the downloaded file on ~/.fonts
"   - select the font from the list on the terminal preferences font settings

call plug#begin('~/.config/nvim/plugged')
" plugins for statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" plugin for auto pairs feature
Plug 'jiangmiao/auto-pairs'
" plugin for surrounding feature
Plug 'tpope/vim-surround'
" plugin commentary feature
Plug 'tpope/vim-commentary'
" repeat commands from other plugins that are not atomic to vim
Plug 'tpope/vim-repeat'
" plugin to match corresponding closing brackets, parenthisis, tags...
Plug 'tmhedberg/matchit'
" plugin for git integration
Plug 'tpope/vim-fugitive'
" improve syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" gruvbox colorscheme
Plug 'gruvbox-community/gruvbox'
" fancy startup plugin
Plug 'mhinz/vim-startify'
" easily run tests
Plug 'janko/vim-test'
" dev icons in telescope
" requires a Nerd Font
Plug 'kyazdani42/nvim-web-devicons'
" Lazygit
Plug 'kdheepak/lazygit.nvim'
" color highligther
Plug 'norcalli/nvim-colorizer.lua'
" lsp for neovim
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'ray-x/lsp_signature.nvim'
" diagnostics and formatting language servers
Plug 'jose-elias-alvarez/null-ls.nvim'
" telescope functionality
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" changes the working directory to the project root when a file or directory
" is opened
Plug 'airblade/vim-rooter'
" vimscript library for developing plugins
Plug 'google/vim-maktaba'
" html snippets
Plug 'mattn/emmet-vim'

call plug#end()

" configurations
source ~/.config/nvim/configs/general.vim
source ~/.config/nvim/configs/emmet-vim.vim
source ~/.config/nvim/configs/airline.vim
source ~/.config/nvim/configs/lazygit.vim
source ~/.config/nvim/configs/startify.vim
source ~/.config/nvim/configs/colorizer.vim
source ~/.config/nvim/configs/cmp.vim
source ~/.config/nvim/configs/lsp-signature.vim
source ~/.config/nvim/configs/null-ls.vim
source ~/.config/nvim/configs/telescope.vim
source ~/.config/nvim/configs/treesitter.vim
source ~/.config/nvim/configs/vim-fugitive.vim
source ~/.config/nvim/configs/vim-test.vim

