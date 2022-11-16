#!/bin/bash

TEST_FILE=~/.config/nvim/test
nvim --startuptime $TEST_FILE
tail $TEST_FILE
rm $TEST_FILE
