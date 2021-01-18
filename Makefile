ln = ln -sfr
mkdir = mkdir -p

nfile = $(mkdir) "$(@D)"; \
	$(ln) "$(@F)" "$@"

dfile = $(mkdir) "$@"; \
	$(ln) $(wildcard $(@F)/*) "$@"

hfile = $(mkdir) "$(@D)"; \
	$(ln) "$(subst .,,$(@F))" "$@"

# Normal files
~/.config/bspwm/bspwmrc:
	$(nfile)

~/.config/newsboat/config:
	$(nfile)

~/.config/dunst/dunstrc:
	$(nfile)

~/.config/python/startup.py:
	$(nfile)

~/.config/sxhkd/sxhkdrc:
	$(nfile)

~/.config/zathura/zathurarc:
	$(nfile)

~/.config/X11/xinitrc:
	$(nfile)

~/.config/nvim/init.vim:
	$(nfile)

# Hidden files
~/.config/zsh/.zprofile:
	$(hfile)

~/.config/zsh/.zshrc:
	$(hfile)

~/.zshenv:
	$(hfile)

# Directories
~/.local/bin:
	$(dfile)

~/.config/mpv:
	$(dfile)

~/.config/nvim/ftplugin:
	$(dfile)

~/.config/nvim/syntax:
	$(dfile)

~/.config/nvim/templates/html:
	$(dfile)

~/.config/nvim/templates/tex:
	$(dfile)

~/.config/nvim/templates/roff:
	$(dfile)
