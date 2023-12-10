#!/bin/bash

function vim-test-startup() {
	TEST_FILE=~/.config/nvim/test
	nvim --startuptime $TEST_FILE -c exit
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
  # gum spin --spinner="$spinner" --title="$title" --title.foreground="$color" sleep $((1 + $RANDOM % 5)) && color_text "#ff8888" "$title ✔"
  gum spin --spinner="$spinner" --title="$title" --title.foreground="$color" sleep $((1 + $RANDOM % 5)) && color_text "#9cda9c" "$title ✔"
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

function random-tech-actions() {
	words1=("Loading" "Authenticating" "Authorizing" "Deleting" "Reading" "Converting" "Writing" "Launching" "Copying" "Preparing" "Closing" "Replacing" "Connecting" "Encrypting" "Decrypting" "Deploying" "Searching" "Initializing" "Compiling" "Sending" "Waiting")
	words2=("quantic" "complex" "old" "new" "authorized" "authenticated" "simple" "chosen" "empty" "full" "multi" "redundant" "cloaked")
	words3=("system" "log" "error" "warning" "report" "bundle" "build" "queue" "signal" "metadata" "layout" "network" "protocol" "database" "cycle" "hardware" "resources" "app" "data" "table" "message")
	while [[ true ]]; do
		# get random word from arrays
		i1=$((1 + $RANDOM % ${#words1[@]}))
		i2=$((1 + $RANDOM % ${#words2[@]}))
		i3=$((1 + $RANDOM % ${#words3[@]}))
		w1=${words1[$i1]}
		w2=${words2[$i2]}
		w3=${words3[$i3]}
		spinner "$w1 $w2 $w3" "moon" "#ffffff"
	done
}
