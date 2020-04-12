#!/bin/sh
cd files || exit
mkdir -p ~/.config/ranger ~/.config/bspwm ~/.config/sxhkd ~/.config/zsh ~/.cache/zsh ~/.config/X11 ~/.local/share/wallpaper
cp -r bin ~/.local/bin
cp -r bspwmrc ~/.config/bspwm/bspwmrc
cp -r rc.conf ~/.config/ranger/rc.conf
cp -r sxhkdrc ~/.config/sxhkd/sxhkdrc 
cp -r nvim ~/.config/nvim
cp -r xinitrc ~/.config/X11/xinitrc
cp -r newsboat ~/.config/newsboat
cp -r zprofile ~/.zprofile
cp -r zshrc ~/.config/zsh/.zshrc
echo "Don't forget to download wallpapers and install a terminal emulator."
