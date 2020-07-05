#!/bin/sh
mkdir -p \
	~/.config/ranger \
	~/.config/bspwm \
	~/.config/sxhkd \
	~/.config/zsh \
	~/.cache/zsh \
	~/.config/X11 \
	~/.local/share/wallpaper \
	~/.local/bin \
	~/.config/nvim/ftplugin \
	~/.config/newsboat \
	~/.config/zathura

ln -sr bin/* ~/.local/bin
ln -sr bspwmrc ~/.config/bspwm/bspwmrc
ln -sr init.vim ~/.config/nvim/init.vim
ln -sr rc.conf ~/.config/ranger/rc.conf
ln -sr sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sr xinitrc ~/.config/X11/xinitrc
ln -sr zprofile ~/.zprofile
ln -sr zshrc ~/.config/zsh/.zshrc
ln -sr ftplugin/* ~/.config/nvim/ftplugin
ln -sr Xresources ~/.config/X11/Xresources
ln -sr config ~/.config/newsboat/config
ln -sr zathurarc ~/.config/zathura/zathurarc
echo "Done"
