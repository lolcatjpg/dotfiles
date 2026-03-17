#!/usr/bin/env bash

open_hooks() {
	pkill -SIGUSR1 waybar
}

close_hooks() {
	pkill -SIGUSR2 waybar
}

while read -r line; do
	line="$(echo "$line" | grep '^Overview toggled: ')"
	[[ $line =~ true$ ]] && open_hooks
	[[ $line =~ false$ ]] && close_hooks

done < <(niri msg event-stream)

