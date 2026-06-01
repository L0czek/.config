#!/usr/bin/env bash

get_state() {
    if makoctl mode | grep -q "away"; then
        echo "on"
    else
        echo "off"
    fi
}

toggle_mode() {
    local state
    state=$(get_state)

    if [ "$state" = "off" ]; then
        makoctl mode -a away
    else
        makoctl mode -r away
    fi
}

if [ "$1" = "--toggle" ]; then
    toggle_mode
fi

STATE=$(get_state)

if [ "$STATE" = "on" ]; then
    echo '{"text": "", "class": "away", "tooltip": "Notifications silenced"}'
else
    echo '{"text": "", "class": "active", "tooltip": "Notifications enabled"}'
fi
