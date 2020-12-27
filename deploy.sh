#!/bin/sh

alias lncmd='ln -sfr'

link() {
	for dir do :; done

	for arg do
		shift
		[ "$arg" = "$dir" ] && continue
		set -- "$@" "$arg"
	done

	[ -d "$dir" ] || mkdir -p "$dir"

	lncmd "$@" "$dir"
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
link syntax/* ~/.config/nvim/syntax

link templates/html/* ~/.config/nvim/templates/html
link templates/tex/* ~/.config/nvim/templates/tex
link templates/roff/* ~/.config/nvim/templates/roff

# Hidden files
lncmd zsh/zprofile ~/.config/zsh/.zprofile
lncmd zsh/zshrc ~/.config/zsh/.zshrc
lncmd zshenv ~/.zshenv
