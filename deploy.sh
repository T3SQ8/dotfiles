#!/bin/sh
mkdir -p ~/.config/ranger \
	~/.config/bspwm \
	~/.config/sxhkd \
	~/.config/zsh \
	~/.cache/zsh \
	~/.config/X11 \
	~/.local/share/wallpaper \
	~/.config/nvim

cp -r bin ~/.local/bin
cp -r bspwmrc ~/.config/bspwm/bspwmrc
cp -r init.vim ~/.config/nvim/init.vim
cp -r newsboat ~/.config/newsboat
cp -r rc.conf ~/.config/ranger/rc.conf
cp -r sxhkdrc ~/.config/sxhkd/sxhkdrc 
cp -r xinitrc ~/.config/X11/xinitrc
cp -r zprofile ~/.zprofile
cp -r zshrc ~/.config/zsh/.zshrc
echo "Done"
