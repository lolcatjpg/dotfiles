#!/usr/bin/env bash
# vim: ts=4 sw=4

do_action() {
	# it has to be in a function for some reason
	if rg --quiet 'KEY_LEFTMETA' <<< "$1"; then
		pkill -SIGUSR1 waybar
	fi
}

while read line; do
	do_action "$line"
done < <(libinput debug-events)

