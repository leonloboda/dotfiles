#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar &
polybar mybar2 &

echo "Polybar launched..."
