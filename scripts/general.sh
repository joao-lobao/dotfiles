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
