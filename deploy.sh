#!/bin/sh
mkdir -p \
	~/.config/ranger \
	~/.config/bspwm \
	~/.config/sxhkd \
	~/.config/zsh \
	~/.config/X11 \
	~/.local/share/wallpaper \
	~/.local/bin \
	~/.config/nvim/ftplugin \
	~/.config/newsboat \
	~/.config/zathura \
	~/.config/mpv \
	~/.config/dunst \
	~/.config/python

ln -sfr bin/* ~/.local/bin
ln -sfr bspwmrc ~/.config/bspwm/bspwmrc
ln -sfr init.vim ~/.config/nvim/init.vim
ln -sfr rc.conf ~/.config/ranger/rc.conf
ln -sfr sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sfr X11/* ~/.config/X11/
ln -sfr zprofile ~/.zprofile
ln -sfr zshrc ~/.config/zsh/.zshrc
ln -sfr ftplugin/* ~/.config/nvim/ftplugin
ln -sfr config ~/.config/newsboat/config
ln -sfr zathurarc ~/.config/zathura/zathurarc
ln -sfr mpv/* ~/.config/mpv
ln -sfr dunstrc ~/.config/dunst/dunstrc
ln -sfr startup.py ~/.config/python/startup.py
echo "Done"
