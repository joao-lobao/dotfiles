#!/bin/bash

function dcwait() {
	SERVICE=$1
	SERVICE_TXT="Waiting for '$SERVICE' service to start..."
	STATUS_TXT=""

	until docker-compose ps -q "$SERVICE" >/dev/null 2>&1 && [ -n "$(docker-compose ps -q $SERVICE)" ]; do
		gum spin --spinner="dot" --title="$SERVICE_TXT" --title.foreground="#eb6ce8" sleep 2
	done
	color_text "#9cda9c" "✅ $SERVICE_TXT"

	CONTAINER=$(docker-compose ps -q "$SERVICE")

	color_text "#9cda9c" "✅ Container for '$SERVICE' service found..."

	# Step 2: Wait until the container is healthy
	until [ "$(docker inspect -f '{{.State.Health.Status}}' $CONTAINER 2>/dev/null)" = "healthy" ]; do
		STATUS=$(docker inspect -f '{{.State.Status}}' $CONTAINER 2>/dev/null)
		STATUS_TXT="The '$SERVICE' service is $STATUS..."
		gum spin --spinner="dot" --title="$STATUS_TXT" --title.foreground="#eb6ce8" sleep 2
	done
	color_text "#9cda9c" "✅ $STATUS_TXT"

	color_text "#05DF72" "✅ Done! The '$SERVICE' service is healthy!"
}
