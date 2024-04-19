#!/bin/bash

# Restarts unison if it crashed for some reason.
command="unison default -ui text -repeat watch -prefer newer"

while [[ true ]]; do
	if [[ -n "ps aux | grep -v grep | grep -Ei '$command' | awk '{print $2}'" ]]; then
		echo "unison is not running. Start it with \"$command\" command"
		eval "$command" || true
	fi

	sleep 1
done
