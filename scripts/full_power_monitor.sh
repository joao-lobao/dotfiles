#!/bin/bash

# Discover all RAPL domains
DOMAINS=($(find /sys/class/powercap/intel-rapl:*/ -name "energy_uj"))

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
	TOTAL_POWER=0

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

		# Sum total power
		TOTAL_POWER=$(echo "$TOTAL_POWER + $POWER_NOW" | bc)
	done

	# Print result
	clear
	echo "-------------------------------"
	for NAME in "${!POWER[@]}"; do
		printf "%-10s : %s Watts\n" "$NAME" "${POWER[$NAME]}"
	done
	echo "-------------------------------"
	echo "Total RAPL Power: $TOTAL_POWER Watts"
	echo "-------------------------------"
}

# Loop every 2 seconds
while true; do
	sleep 2
	get_power
done
