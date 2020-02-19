# Makefile for creating prmcy's development environment

DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATE  := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATE))
TESTPATH   := $(DOTPATH)/dest

all: 

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy:
	@echo "Create symbolic links to your home directory"
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

clean:
	@echo "Remove all  symbolic links in your home directory"
	@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

test:
	@echo $(TESTPATH)
	@echo "Create symbolic links to your home directory (test)"
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(TESTPATH)/$(val);)

tclean:
	@echo "Remove all  symbolic links in your home directory (test)"
	@$(foreach val, $(DOTFILES), rm -vrf $(TESTPATH)/$(val);)
