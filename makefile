help:
	@echo "TODO"

all: dots spacevim nvim install

zsh:
	./scripts/install_zsh.sh

spacevim:
	@echo TODO

nvim:
	@echo TODO

install:
	./scripts/install_programs.sh

.PHONY: zsh install
