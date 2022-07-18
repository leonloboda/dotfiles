#!/usr/bin/env sh

# Configure monitors
autorandr --change

polybar mybar &

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar > /dev/null ; do sleep 1 ; done

# Launch bars
monitors="$(polybar -m)"

echo "${monitors}" | while read -r monitor; do
    output="$(echo "${monitor}" | cut -d ':' -f 1)"
    position="$(echo "${monitor}" | cut -d '+' -f 2)"
    bar="mybar"

    if [[ $(echo "${monitors}" | wc -l) -gt 1 ]]; then
        [[ $(echo "${position}") -eq 0 ]] && bar="left" || bar="right"
    fi

    MONITOR=${output} polybar -l error -c ~/.config/polybar/config.ini "${bar}" &
done
