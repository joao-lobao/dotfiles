#!/bin/bash

function vim-test-startup() {
	TEST_FILE=~/.config/nvim/test
	nvim --startuptime $TEST_FILE
	tail $TEST_FILE
	rm $TEST_FILE
}

function kill-port-pid() {
	port=$1
	pid=$(lsof -i :$port | sed -n 2p | sed -e 's/^ *[^ ]* *\([^ ]*\) .*/\1/')
	if [ -n "$pid" ] && [ -n "$port" ]; then
		kill $pid
		echo PID: $pid killed on port $port
	fi
}

function color_text() {
	color=$1
	text=$2
	gum style --foreground "$color" "$text"
}

function say() {
	spd-say $2
	color_text $1 $2
}

function spinner() {
	title=$1
	spinner=$2
	color=$3
	gum spin --spinner="$spinner" --title="$title" --title.foreground="$color" sleep 5 && color_text "#ff8888" "$title ✔"
}

function launch() {
	phases=(
		"Preparing for launch: This may take a few minutes ⏳"
		"Preparing for launch: Fueling the rocket ⛽️"
		"Preparing for launch: Preparing guidance systems 📡"
		"Preparing for launch: Initiating launch sequence 🤖"
		"Preparing for launch: Ignition 🔑"
		"Launching: Lift-off! 🚀"
		"Launching: Clearing the launch pad 💨"
		"Ascending: Passing through the atmosphere 🌥"
		"Pitching and rolling: Achieving desired trajectory 🕹"
		"Staging: Separating from the booster 🔛"
		"Orbital insertion: Using engine to achieve the correct velocity 🎚"
		"Payload deployment: Deploying payload 🛰"
	)

	while true; do
		for c in $phases; do
			spinner "$c" "moon" "#ff0000"
		done
	done
	while true; do
	done
}
