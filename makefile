help:
	@echo "dots: install dotfiles for zsh, zim, tmux
	nvim: install custom nvim config
	spacevim: install spacevim, sets vim and neovim to spacevim
	install_minimal: install programs needed by dotfiles
	zim: clone and initialize zim config (does not link dotfiles)
	"

all: dots spacevim nvim install_minimal

dots: zim
	./scripts/install_dots.sh

zim:
	./scripts/install_zim.zsh

spacevim:
	./scripts/install_spacevim.sh

nvim:
	./scripts/install_neovim.sh

install_minimal:
	./scripts/install_system_minimal.sh

install_workstation:
	./scripts/install_workstation.sh
