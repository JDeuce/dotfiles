PWD:=$(shell pwd)
DOTFILES:=$(shell find $(PWD) -name '.*' -type f -maxdepth 1)
INSTALLED_DOTFILES=$(patsubst $(PWD)/%,$(HOME)/%,$(DOTFILES))

help:
	@echo Usage: gmake install
	@echo Be sure to use GNU Make
	@echo
	@echo install symlinks in $(HOME) directory to $(PWD)

install: $(INSTALLED_DOTFILES)

$(HOME)/.%:
	ln -s $(PWD)/$(shell basename $@) $@
