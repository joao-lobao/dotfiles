#!/bin/bash

#paths
DOTFILES=/media/home/SSD_BACKUP/dotfiles/
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
	[$ZSH_SOURCE]=$DOTFILES
	[$NEWSBOAT_SOURCE]=$DOTFILES
	[$SCRIPTS_SOURCE]=$DOTFILES
	[$TMUX_CONF_SOURCE]=$TMUX_HOME_BACKUP
	[$TMUXINATOR_SESSIONS_SOURCE]=$TMUX_HOME_BACKUP
	[$TMUXINATOR_AUTOCOMPLETION_SOURCE]=$TMUX_HOME_BACKUP
	[$TMUX_PLUGINS_SOURCE]=$TMUX_PLUGINS_BACKUP
)
declare -A sources_dirs=(
	[$ZSH_SOURCE]=$ZSH_SOURCE
	[$NEWSBOAT_SOURCE]=$NEWSBOAT_SOURCE
	[$SCRIPTS_SOURCE]=$SCRIPTS_SOURCE
	[$TMUX_CONF_SOURCE]=$TMUX_CONF_SOURCE
	[$TMUXINATOR_SESSIONS_SOURCE]=$TMUXINATOR_SESSIONS_SOURCE
	[$TMUXINATOR_AUTOCOMPLETION_SOURCE]=$TMUXINATOR_AUTOCOMPLETION_SOURCE
	[$TMUX_PLUGINS_SOURCE]=$TMUX_PLUGINS_SOURCE
)

function color_text() {
	color=$1
	text=$2
	gum style --foreground "$color" "$text"
}

function backup_file_or_directory() {
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
	directories_to_backup=$(gum choose --no-limit $sources_dirs)
	# transform directories_to_backup into an array
	dirs_transformed=($(echo $directories_to_backup | tr ' ' "\n"))
	# if directories_to_backup is empty, exit
	if [ -z "$dirs_transformed" ]; then
		color_text $RED "Exited without saving!"
		return
	fi

	# iterate over directories_to_backup
	for d in "${dirs_transformed[@]}"; do
		color_text $BLUE "STARTING $d BACKUP"
		backup_file_or_directory $d
		# if backup_file_or_directory fails and continue to next iteration
		if [ $? -ne 0 ]; then
			color_text $RED "FAILED TO BACKUP $d"
			echo -e
			continue
		fi
		color_text $PINK "FINISHED $d BACKUP"
		echo -e
	done
}
