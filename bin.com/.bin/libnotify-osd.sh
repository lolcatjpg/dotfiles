
NOTIFICATION_TIME=2000

die() {
	# usage: die EXIT_CODE MESSAGE
	echo 'brightnessctl: error: ' "$2" >&2
	die "$1"
}

usage() {
	COMMAND="$(echo $0 | sed 's#.*/##')"
	cat <<EOF >&2
usage:
  $COMMAND audio	show audio info
  $COMMAND brightness	show brightness info
EOF
exit 2
}

notify() {
	# sends notification with progress bar
	# usage notify TEXT VALUE
	# if VALUE is `-` then stdin is used as value
	VALUE="$1"
	TEXT="$2"
	BODY="$3"
	[[ "$VALUE" = '-' ]] && VALUE="$(cat)"

	notify-send \
		-t $NOTIFICATION_TIME \
		-h "string:x-canonical-private-synchronous:com-lolcatjpg-utilscripts-libnotifyosd" \
		-h int:value:"$VALUE" \
		"$TEXT" "$BODY"
}

notify_text() {
	# sends notification without progress bar
	# usage notify TEXT
	TEXT="$1"
	BODY="$2"

	notify-send \
		-t $NOTIFICATION_TIME \
		-h "string:x-canonical-private-synchronous:com-lolcatjpg-utilscripts-libnotifyosd" \
		"$TEXT" "$BODY"
}

audio_device() {
	wpctl inspect @DEFAULT_AUDIO_SINK@ \
		| rg 'node\.description' \
		| sed -r 's/.*"([^"]*)".*/\1/'
}

is_muted() {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -q '\[MUTED\]'
}

audio() {
	read audio_info < <(wpctl status \
		| rg -A 1000 'Audio' \
		| rg -A 1000 'Sinks' \
		| rg '\*' \
		| head -n 1 \
		| sed 's/.*\. //' \
		| sed -r 's/ +/ /g' \
	)

	audio_value="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ \
		| grep -Eo '[0-9]+\.[0-9]+' \
		| xargs echo '100 *' \
		| bc
	)"

	display_value="$(sed -r 's/\.[0-9]+//' <<< $audio_value)"

	muted_status=""
	is_muted && muted_status=" "

	notify "$audio_value" "${muted_status}volume: ${display_value}%" "$(audio_device)"
}

brightness() {
	local current="$(brightnessctl get)"
	local max="$(brightnessctl max)"
	local brightness="$(( current * 100 / max ))"
	notify "$brightness" "brightness: ${brightness}%" 
}

## main ##
case "$1" in
	audio) audio;;
	brightness) brightness ;;
	*) usage ;;
esac

