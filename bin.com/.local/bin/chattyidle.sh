#!/usr/bin/env bash
# 
# chattyidle.sh
# author: lolcat.jpg
#
# licensed under BSD 3-clause licence (see LICENSE file provided with the software)
#
# see also https://www.reddit.com/r/hyprland/comments/15peced/correct_use_of_swayidle_on_hyprland/
#


#CWD="$(realpath $0 | sed -r 's#/[^/]*$#/#')"
#source "${CWD}timeout.conf"
if [[ -d "$XDG_CONFIG_HOME" ]]; then
    CONF_DIR="$XDG_CONFIG_HOME/chattyidle"
else
    CONF_DIR="$HOME/.config/chattyidle"
fi

CONF_FILE="$HOME/.config/chattyidle/chattyidle.conf"
[[ -f "$CONF_FILE" ]] || {
    echo "error: config file (${CONF_FILE}) does not exist! :(" >&2
    exit 1
}

source "$CONF_FILE"

declare -x notify_id_file="$(mktemp)"
echo "$notify_id_file" >&2

swayidle -w \
		timeout "$NOTIFY_TIME" "notify-send -t 0 --print-id \"system will lock in $(( LOCK_TIME - NOTIFY_TIME )) seconds \" > $notify_id_file" \
		resume "cat $notify_id_file | xargs -I {} notify-send --replace-id {} -t 1 -- _" \
    timeout "$LOCK_TIME" "[[ $PAUSE_ON_LOCK = true ]] && playerctl pause; $LOCK_CMD" \
    timeout "$SCREEN_OFF_TIME" 'niri msg action power-off-monitors' \
    resume 'niri msg action power-on-monitors' \
    timeout "$SLEEP_TIME" "[[ $PAUSE_ON_SLEEP = true ]] && playerctl pause; systemctl suspend"


