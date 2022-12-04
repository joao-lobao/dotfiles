#!/bin/bash

#paths
DOTFILES=~/Desktop/dotfiles/
TMUX_HOME_BACKUP="${DOTFILES}tmux/"
TMUX_PLUGINS_BACKUP="${TMUX_HOME_BACKUP}.tmux/plugins/tmux"
ZSH_SOURCE=~/.zshrc
NEWSBOAT_SOURCE=~/.newsboat
SCRIPTS_SOURCE=~/scripts
TMUX_CONF_SOURCE=~/.tmux.conf
TMUXINATOR_SESSIONS_SOURCE=~/.config/tmuxinator
TMUXINATOR_AUTOCOMPLETION_SOURCE=/usr/local/share/zsh/site-functions/_tmuxinator
TMUX_PLUGINS_SOURCE=~/.tmux/plugins/tmux/scripts

#colors
RED="#f14e32"
PINK="#eb6ce8"
BLUE="#007cba"

declare -A backup_dirs=(
	[zsh]=$DOTFILES
	[newsboat]=$DOTFILES
	[scripts]=$DOTFILES
	[tmux_conf]=$TMUX_HOME_BACKUP
	[tmuxinator_sessions]=$TMUX_HOME_BACKUP
	[tmuxinator_autocompletion]=$TMUX_HOME_BACKUP
	[tmux_plugins]=$TMUX_PLUGINS_BACKUP
)
declare -A sources_dirs=(
	[zsh]=$ZSH_SOURCE
	[newsboat]=$NEWSBOAT_SOURCE
	[scripts]=$SCRIPTS_SOURCE
	[tmux_conf]=$TMUX_CONF_SOURCE
	[tmuxinator_sessions]=$TMUXINATOR_SESSIONS_SOURCE
	[tmuxinator_autocompletion]=$TMUXINATOR_AUTOCOMPLETION_SOURCE
	[tmux_plugins]=$TMUX_PLUGINS_SOURCE
)
declare -a dirs=(
	"zsh"
	"newsboat"
	"scripts"
	"tmux_conf"
	"tmuxinator_sessions"
	"tmuxinator_autocompletion"
	"tmux_plugins"
)

function color_text() {
	color=$1
	text=$2
	gum style --foreground "$color" "$text"
}

function copy_file_or_directory() {
	if [ -d "$sources_dirs[$1]" ]; then
		cp -rv $sources_dirs[$1] $backup_dirs[$1]
	else
		cp -v $sources_dirs[$1] $backup_dirs[$1]
	fi
}

function backup() {
	gum style \
		--border double \
		--border-foreground $BLUE \
		--foreground $PINK \
		--margin "1" \
		--padding "1" \
		"Welcome to DOTFILES BACKUP tool"
	directories_to_backup=$(gum choose --no-limit $dirs)
	dirs_transformed=($(echo $directories_to_backup | tr ' ' "\n"))
	if [ -z "$dirs_transformed" ]; then
		color_text $RED "Exited without saving!"
		return
	fi

	for d in "${dirs_transformed[@]}"; do
		color_text $BLUE "STARTING $d BACKUP"
		copy_file_or_directory $d
    color_text $PINK "FINISHED $d BACKUP"
    echo -e
	done
}
