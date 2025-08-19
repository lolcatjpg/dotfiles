
NOTIFICATION_TIME=2000

die() {
	# usage: die EXIT_CODE MESSAGE
	echo 'brightnessctl: error: ' "$2" >&2
	die "$1"
}

usage() {
	cat <<EOF >&2
usage:
$0 volume
$0 brightness
EOF
exit 2
}

notify() {
	# sends notification with progress bar
	# usage notify TEXT VALUE
	# if VALUE is `-` then stdin is used as value
	TEXT="$1"
	VALUE="$2"
	[[ "$VALUE" = '-' ]] && VALUE="$(cat)"

	notify-send \
		-t $NOTIFICATION_TIME \
		-h "string:x-canonical-private-synchronous:com-lolcatjpg-utilscripts-libnotifyosd" \
		-h int:value:"$VALUE" \
		"$TEXT: $VALUE" 
}

notify_text() {
	# sends notification without progress bar
	# usage notify TEXT
	TEXT="$1"

	notify-send \
		-t $NOTIFICATION_TIME \
		-h "string:x-canonical-private-synchronous:com-lolcatjpg-utilscripts-libnotifyosd" \
		"$TEXT" 
}

volume() {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ \
		| grep -Eo '[0-9]+\.[0-9]+' \
		| sed 's/\.//' \
		| sed -r 's/^0*//' \
		| notify volume -
}

mute() {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ \
		| grep --silent 'MUTED' \
		&& notify_text muted \
		|| notify_text unmuted
}

brightness() {
	local current="$(brightnessctl get)"
	local max="$(brightnessctl max)"
	local brightness="$(( current * 100 / max ))"
	notify brightness "$brightness"
}

## main ##
case "$1" in
	volume) volume ;;
	brightness) brightness ;;
	mute) mute ;;
	*) usage ;;
esac

