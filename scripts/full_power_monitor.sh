#!/bin/bash

get_cpu_mhz() {
	# Get CPU MHz values from /proc/cpuinfo
	mhz_values=$(cat /proc/cpuinfo | grep "MHz" | awk -F': ' '{print $2}')

	# Initialize total and count
	total=0
	count=0

	# Sum up all MHz values and count them
	for mhz in $mhz_values; do
		total=$(echo "$total + $mhz" | bc)
		count=$((count + 1))
	done

	# Calculate average
	if [ $count -gt 0 ]; then
		average=$(echo "scale=2; $total / $count" | bc)
		echo "Average CPU MHz: $average"
	else
		echo "No CPU MHz data found."
	fi
}

# Discover all RAPL domains
# DOMAINS=($(find /sys/class/powercap/intel-rapl:0/intel-rapl:0*/ -name "energy_uj"))
DOMAINS=($(find /sys/class/powercap/intel-rapl:0/ -name "energy_uj"))

# Read initial energies and timestamps
declare -A ENERGY_1
declare -A TIME_1
for DOMAIN in "${DOMAINS[@]}"; do
	ENERGY_1["$DOMAIN"]=$(cat "$DOMAIN")
	TIME_1["$DOMAIN"]=$(date +%s%N)
done

# Function to read energy and compute power per domain
get_power() {
	declare -A POWER

	for DOMAIN in "${DOMAINS[@]}"; do
		NAME=$(cat "$(dirname "$DOMAIN")/name")
		ENERGY_2=$(cat "$DOMAIN")
		TIME_2=$(date +%s%N)

		# Compute deltas
		TIME_DELTA=$(echo "scale=6; ($TIME_2 - ${TIME_1[$DOMAIN]}) / 1000000000" | bc)
		ENERGY_DELTA=$(echo "scale=6; ($ENERGY_2 - ${ENERGY_1[$DOMAIN]}) / 1000000" | bc)

		# Compute power (Watts)
		POWER_NOW=$(echo "scale=2; $ENERGY_DELTA / $TIME_DELTA" | bc)
		POWER["$NAME"]=$POWER_NOW

		# Update previous values
		ENERGY_1["$DOMAIN"]=$ENERGY_2
		TIME_1["$DOMAIN"]=$TIME_2
	done

	# Print result
	clear
	echo "-------------------------------"
	for NAME in "${!POWER[@]}"; do
		printf "%-10s : %s Watts\n" "$NAME" "${POWER[$NAME]}"
	done
}

quit_handler() {
	echo "Press 'q' to quit."
	# Check for 'q' keypress in the background
	read -t 1 -n 1 key
	if [[ $key = "q" ]]; then
		echo -e "Exiting."
		exit 0
	fi
}

# Loop every 2 seconds
while true; do
	sleep 2
	get_power
	echo "-------------------------------"
	get_cpu_mhz
	echo "-------------------------------"
	quit_handler
done
