##
## dotfiles made by NU-Slab
##

## Location of Makefile
MAKEPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := help

all: backup clean install  ## Run "make backup uninstall install"

backup:       ## Backup existing files
	@cd $(MAKEPATH)
	@./script/backup.sh

install:      ## Create symlink of dotfiles
	@cd $(MAKEPATH)
	@./script/install.sh

clean:        ## Delete symlink of dotfiles
	@cd $(MAKEPATH)
	@./script/uninstall.sh

reinstall: clean install  ## Delete & Create symlink of dotfiles

help:  ## Print help (this message)
	@printf "$$LOGO"
	@printf "\033[36m%-16s\033[0m %s\n" "[Command]" "[Description]"
	@grep -E '^[a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s \033[0m%s\n", $$1, $$2}'


## Appendix
export LOGO
define LOGO
\033[34m┏\033[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[34m┓
\033[34m┃\033[35m                                 _         _          \033[34m┃
\033[34m┃\033[35m       _ __   _   _         ___ | |  __ _ | |__       \033[34m┃
\033[34m┃\033[35m      | '_ \ | | | | _____ / __|| | / _` || '_ \      \033[34m┃
\033[34m┃\033[35m      | | | || |_| ||_____|\__ \| || (_| || |_) |     \033[34m┃
\033[34m┃\033[35m      |_| |_| \__,_|       |___/|_| \__,_||_.__/      \033[34m┃
\033[34m┃\033[35m                                                      \033[34m┃
\033[34m┠\033[34m──────────────────────────────────────────────────────\033[34m┨
\033[34m┃\033[32m Copyright (c) 2020-2022 nu-slab All Rights Reserved. \033[34m┃
\033[34m┗\033[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[34m┛


endef
