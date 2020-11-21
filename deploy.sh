#!/bin/sh

mkdir -p \
	~/.config/X11 \
	~/.config/bspwm \
	~/.config/dunst \
	~/.config/mpv \
	~/.config/newsboat \
	~/.config/nvim/ftplugin \
	~/.config/python \
	~/.config/sxhkd \
	~/.config/zathura \
	~/.config/zsh \
	~/.local/bin

ln -sfr bspwmrc ~/.config/bspwm/bspwmrc
ln -sfr config ~/.config/newsboat/config
ln -sfr dunstrc ~/.config/dunst/dunstrc
ln -sfr init.vim ~/.config/nvim/init.vim
ln -sfr startup.py ~/.config/python/startup.py
ln -sfr sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sfr zathurarc ~/.config/zathura/zathurarc
ln -sfr zshenv ~/.zshenv
ln -sfr xinitrc ~/.config/X11/xinitrc

ln -sfr bin/* ~/.local/bin
ln -sfr ftplugin/* ~/.config/nvim/ftplugin
ln -sfr mpv/* ~/.config/mpv

for file in zsh/*; do
	ln -sfr "$file" "$HOME/.config/zsh/.${file##*/}"
done
