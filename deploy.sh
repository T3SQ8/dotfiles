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

ln -sr bin/* ~/.local/bin
ln -sr bspwmrc ~/.config/bspwm/bspwmrc
ln -sr init.vim ~/.config/nvim/init.vim
ln -sr rc.conf ~/.config/ranger/rc.conf
ln -sr sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sr X11/* ~/.config/X11/
ln -sr zprofile ~/.zprofile
ln -sr zshrc ~/.config/zsh/.zshrc
ln -sr ftplugin/* ~/.config/nvim/ftplugin
ln -sr config ~/.config/newsboat/config
ln -sr zathurarc ~/.config/zathura/zathurarc
ln -sr mpv/* ~/.config/mpv
ln -sr dunstrc ~/.config/dunst/dunstrc
ln -sr startup.py ~/.config/python/startup.py
echo "Done"
