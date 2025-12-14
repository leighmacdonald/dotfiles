#!/bin/bash

direction=$1

get_window_pos() {
	hyprctl activewindow -j | jq -r '.at | @csv' | sed 's/"//g'
}

#get_next_workspace() {
#
#}

INITIAL_POS=$(get_window_pos)

hyprctl dispatch hy3:movewindow $direction

NEW_POS=$(get_window_pos)

echo "$INITIAL_POS -> $NEW_POS"

if [ "$INITIAL_POS" == "$NEW_POS" ]; then
    echo "do it"
#    hyprctl dispatch hy3:movetoworkspace 4 follow

	# hyprctl dispatch movewindow mon:+1

	# hyprctl dispatch hy3:movetoworkspace
	# hyprctl dispatch hy3:movewindow l
	# hyprctl dispatch hy3:movewindow l
	# hyprctl dispatch hy3:movewindow l
fi
