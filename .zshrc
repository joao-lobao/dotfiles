# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# tmux terminal colors
export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/home/.oh-my-zsh"
export EDITOR="nvim"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search)

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme
# source /usr/share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export BACKUP_PATH="/media/home/SSD_BACKUP"
alias remoteadd="git remote add origin"
alias remoteset="git remote set-url origin"
alias push="git push origin"
alias pull="git pull origin"
alias merge="git merge origin"
alias branch="git branch"
alias log="git log"
alias reset="git reset --h"
alias add="git add"
alias com="git commit -m"
alias co="git checkout"
alias status="git status"
alias st="git status"
alias bp="cd ${BACKUP_PATH}"
alias dotfiles="cd ${BACKUP_PATH}/dotfiles"
alias notes="cd ${BACKUP_PATH}/coding/notes"
alias coding="cd ${BACKUP_PATH}/coding"
alias crypto-watcher="cd ${BACKUP_PATH}/coding/crypto-watcher"
alias vimconfig="cd ~/.config/nvim"
alias joaolobao="cd ${BACKUP_PATH}/coding/jl-app"
alias scripts="cd ~/scripts"
# kill given tmux session
alias tks="tmux kill-session -t"
# kill all sessions but not the current one
alias tka="tmux kill-session -a"
alias maps="telnet mapscii.me"
alias forecast="curl http://wttr.in/"
alias start-crypto-watcher="cd ${BACKUP_PATH}/coding/crypto-watcher && npm start"
alias clock="tmux clock-mode"
alias m="cmatrix -bu 10"
alias specs="neofetch"
alias off="shutdown now"
alias mux="tmuxinator"
alias mon="mux start"
alias moff="mux stop"
alias med="mux edit"
alias mk="tmux kill-server"
alias v="nvim"
alias vim="nvim"
alias rn="ranger"
alias ips="ip -c -br a"

bindkey -v 

# makes the user@computer (context) disappear from the PROMPT
# prompt_context(){}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"

# uncomment when installing ghcup-env for Haskell
# [ -f "/home/home/.ghcup/env" ] && source "/home/home/.ghcup/env" # ghcup-env



# Load Angular CLI autocompletion.
source <(ng completion script)
# load custom scripts
source ~/scripts/index.sh
