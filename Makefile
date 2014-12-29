DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: help

test: deploy
	@$(foreach val, $(DOTFILES_FILES), [[ `readlink $(HOME)/$(val)` == $(DOTFILES_DIR)/$(val) ]] || exit 1;)

help:
	@echo "make list             #=> list the files"
	@echo "make deploy           #=> create symlink"
	@echo "make update           #=> fetch changes"
	@echo "make install          #=> setup environment"
	@echo "make clean            #=> remove the files"

list:
	@$(foreach val, $(DOTFILES_FILES), ls -dF $(val);)

deploy:
	@echo 'Start deploy dotfiles current directory.'
	@echo 'If this is "dotdir", curretly it is ignored and copy your hand.'
	@echo ''
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

install:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
ifeq ($(shell uname), Darwin)
	@$(foreach val, $(wildcard ./etc/init/osx/*.sh), bash $(val);)

homebrew:
	@bash $(DOTFILES_DIR)/etc/init/osx/install_homebrew.sh

brew: homebrew
	@bash $(DOTFILES_DIR)/etc/init/osx/Brewfile

cask: homebrew
	@bash $(DOTFILES_DIR)/etc/init/osx/Caskfile
endif

clean:
	@echo 'Remove dot files in your home directory...'
	@-$(foreach var, $(DOTFILES_FILES), rm -vrf $(HOME)/$(var);)
	-rm -rf $(DOTFILES_DIR)
