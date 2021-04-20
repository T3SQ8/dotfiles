ln = ln -sfr
mkdir = mkdir -p

all: bin zsh vim mpv newsboat python xorg bspwm sxhkd dunst zathura

bin:
	$(mkdir) ~/.local/bin
	$(ln) bin/* ~/.local/bin

zsh:
	$(mkdir) ~/.config/zsh
	$(ln) zprofile ~/.config/zsh/.zprofile
	$(ln) zshrc ~/.config/zsh/.zshrc
	$(ln) zshenv ~/.zshenv

vim:
	$(mkdir) \
		~/.config/nvim/ftplugin \
		~/.config/nvim/syntax \
		~/.config/nvim/templates \
		~/.config/nvim/snippet
	$(ln) init.vim ~/.config/nvim/init.vim
	$(ln) ftplugin/* ~/.config/nvim/ftplugin
	$(ln) syntax/* ~/.config/nvim/syntax
	$(ln) templates/* ~/.config/nvim/templates
	$(ln) snippet/* ~/.config/nvim/snippet

termux:
	$(mkdir) ~/.shortcuts
	$(ln) termux/* ~/.shortcuts
	{ echo "cd /sdcard"; cat bin/localshare ;} > ~/.shortcuts/localshare

mpv: xorg
	$(mkdir) ~/.config/mpv
	$(ln) mpv/* ~/.config/mpv

newsboat:
	$(mkdir) ~/.config/newsboat
	$(ln) config ~/.config/newsboat/config

python:
	$(mkdir) ~/.config/python
	$(ln) startup.py ~/.config/python/startup.py


xorg:
	$(mkdir) ~/.config/X11
	$(ln) xinitrc ~/.config/X11/xinitrc

bspwm: xorg
	$(mkdir) ~/.config/bspwm
	$(ln) bspwmrc ~/.config/bspwm/bspwmrc

sxhkd: xorg
	$(mkdir) ~/.config/sxhkd
	$(ln) sxhkdrc ~/.config/sxhkd/sxhkdrc

dunst: xorg
	$(mkdir) ~/.config/dunst
	$(ln) dunstrc ~/.config/dunst/dunstrc

zathura: xorg
	$(mkdir) ~/.config/zathura
	$(ln) zathurarc ~/.config/zathura/zathurarc

gnuplot: xorg
	$(ln) gnuplot.gpi ~/.gnuplot

.PHONY: bin bspwm dunst gnuplot mpv newsboat python sxhkd termux vim xorg zathura zsh
