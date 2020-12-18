#!/bin/sh

alias lncmd='ln -sfr'

link() {
	while getopts h arg; do
		case $arg in
			h) hidden=1 ;;
		esac
	done

	for dir do :; done

	for arg do
		shift
		[ "$arg" = "$dir" ] || [ "$arg" = "-h" ] && continue
		set -- "$@" "$arg"
	done

	[ -d "$dir" ] || mkdir -p "$dir"

	if [ "$hidden" ]; then
		for file in "$@"; do
			lncmd "$file" "$dir/.${file##*/}"
		done
	else
		lncmd "$@" "$dir"
	fi
}

# Files
link bspwmrc ~/.config/bspwm
link config ~/.config/newsboat
link dunstrc ~/.config/dunst
link startup.py ~/.config/python
link sxhkdrc ~/.config/sxhkd
link zathurarc ~/.config/zathura
link xinitrc ~/.config/X11
link init.vim ~/.config/nvim

# Folders
link mpv/* ~/.config/mpv
link bin/* ~/.local/bin
link ftplugin/* ~/.config/nvim/ftplugin

# Hidden files
link -h zsh/* ~/.config/zsh
link -h zshenv ~
