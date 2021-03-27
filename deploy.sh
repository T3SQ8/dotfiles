#!/bin/sh

ln="ln -sfr"
mkfolder="mkdir -p"

cmd() {
	if [ -d "$1" ]; then
		$mkfolder "$2"
		$ln "$1"/* "$2"
	else
		$mkfolder "${2%/*}"
		$ln "$1" "$2"
	fi

}

# Normal files
cmd bspwmrc	~/.config/bspwm/bspwmrc
cmd config	~/.config/newsboat/config
cmd dunstrc	~/.config/dunst/dunstrc
cmd startup.py	~/.config/python/startup.py
cmd sxhkdrc	~/.config/sxhkd/sxhkdrc
cmd zathurarc	~/.config/zathura/zathurarc
cmd xinitrc	~/.config/X11/xinitrc
cmd init.vim	~/.config/nvim/init.vim

# Hidden files
cmd zprofile	~/.config/zsh/.zprofile
cmd zshrc	~/.config/zsh/.zshrc
cmd zshenv	~/.zshenv
cmd gnuplot.gpi	~/.gnuplot

# Directories
cmd bin		~/.local/bin
cmd mpv		~/.config/mpv
cmd ftplugin	~/.config/nvim/ftplugin
cmd syntax	~/.config/nvim/syntax
cmd templates	~/.config/nvim/templates
cmd snippet	~/.config/nvim/snippet
