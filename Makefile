ln = ln -sfr

all: nfile hfile dfile

# Normal files
nfile:
	$(ln) bspwmrc ~/.config/bspwm
	$(ln) config ~/.config/newsboat
	$(ln) dunstrc ~/.config/dunst
	$(ln) startup.py ~/.config/python
	$(ln) sxhkdrc ~/.config/sxhkd
	$(ln) zathurarc ~/.config/zathura
	$(ln) xinitrc ~/.config/X11
	$(ln) init.vim ~/.config/nvim

# Hidden files
hfile:
	$(ln) zprofile ~/.config/zsh/.zprofile
	$(ln) zshrc ~/.config/zsh/.zshrc
	$(ln) zshenv ~/.zshenv

# Directories
dfile:
	$(ln) $(wildcard bin/*) ~/.local/bin
	$(ln) $(wildcard mpv/*) ~/.config/mpv
	$(ln) $(wildcard ftplugin/*) ~/.config/nvim/ftplugin
	$(ln) $(wildcard syntax/*) ~/.config/nvim/syntax
	$(ln) $(wildcard templates/*) ~/.config/nvim/templates
