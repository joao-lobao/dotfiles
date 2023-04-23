function pom_chunk() {
	say $1 "Initiating $2"
	sleep $3
	say $1 "$2 completed"
	sleep 2
}

function pom() {
	RED="#f14e32"
	PINK="#eb6ce8"
	BLUE="#007cba"
	work_time="25m"
	short_break="5m"
	long_break="15m"
	cycles=4
	for ((j = 1; j <= $cycles; j++)); do
		pom_chunk $PINK "working session $j" $work_time
		if ((j < $cycles)); then
			pom_chunk $BLUE "short break" $short_break
		fi
	done
	pom_chunk $BLUE "long break" $long_break
	say $RED "You should now initiate another cycle or rest for today."
}
