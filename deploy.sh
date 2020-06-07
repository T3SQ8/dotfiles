#!/bin/sh
mkdir -p ~/.config/ranger \
	~/.config/bspwm \
	~/.config/sxhkd \
	~/.config/zsh \
	~/.cache/zsh \
	~/.config/X11 \
	~/.local/share/wallpaper \
	~/.config/nvim

ln -sfr bin ~/.local/bin
ln -sfr newsboat ~/.config/newsboat
ln -sfr bspwmrc ~/.config/bspwm/bspwmrc
ln -sfr init.vim ~/.config/nvim/init.vim
ln -sfr rc.conf ~/.config/ranger/rc.conf
ln -sfr sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sfr xinitrc ~/.config/X11/xinitrc
ln -sfr zprofile ~/.zprofile
ln -sfr zshrc ~/.config/zsh/.zshrc
echo "Done"
