#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config

MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)
for monitor in $MONITORS; do
    if [[ $monitor == "eDP1" ]]; then
        MONITOR=eDP1 polybar main &
    else
        MONITOR=$monitor polybar side &
    fi
done

echo "Polybar launched..."
