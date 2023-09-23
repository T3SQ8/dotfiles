#!/bin/sh

while read -r dir; do
	echo "$dir"
	echo "-----"
	du -csh "$dir"/* | sort -hr
	echo
done << EOF
$HOME/.config
$HOME/.cache
$HOME/.local/share
$HOME/.local/state
EOF
