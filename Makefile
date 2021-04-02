ln = ln -sfr
mkdir = mkdir -p

all: zsh vim mics bin xorg

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

mics:
	$(mkdir) \
		~/.config/mpv \
		~/.config/newsboat \
		~/.config/python
	$(ln) config ~/.config/newsboat/config
	$(ln) startup.py ~/.config/python/startup.py
	$(ln) gnuplot.gpi ~/.gnuplot
	$(ln) mpv/* ~/.config/mpv

xorg:
	$(mkdir) \
		~/.config/bspwm \
		~/.config/sxhkd \
		~/.config/dunst \
		~/.config/zathura \
		~/.config/X11
	$(ln) sxhkdrc ~/.config/sxhkd/sxhkdrc
	$(ln) xinitrc ~/.config/X11/xinitrc
	$(ln) zathurarc ~/.config/zathura/zathurarc
	$(ln) bspwmrc ~/.config/bspwm/bspwmrc
	$(ln) dunstrc ~/.config/dunst/dunstrc
