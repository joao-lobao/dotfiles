#!/bin/bash

function dcwait() {
	SERVICE=$1

	color_text "#eb6ce8" "⏳ Waiting for service '$SERVICE' to start..."

	until docker-compose ps -q "$SERVICE" >/dev/null 2>&1 && [ -n "$(docker-compose ps -q $SERVICE)" ]; do
		sleep 2
	done

	CONTAINER=$(docker-compose ps -q "$SERVICE")

	color_text "#eb6ce8" "⏳ Container for service '$SERVICE' found"

	# Step 2: Wait until the container is healthy
	until [ "$(docker inspect -f '{{.State.Health.Status}}' $CONTAINER 2>/dev/null)" = "healthy" ]; do
		STATUS=$(docker inspect -f '{{.State.Status}}' $CONTAINER 2>/dev/null)
		color_text "#eb6ce8" "⏳ $SERVICE $STATUS..."
		sleep 2
	done

	color_text "#05DF72" "✅ Service '$SERVICE' is healthy!"
}
