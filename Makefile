DOTS := "$(HOME)/.dots"


all: gitconfig editorconfig Xresources vim # Link all dot files into their correct locations

gitconfig: ## link git config
	ln -s $(DOTS)/.gitconfig $(HOME)/.gitconfig

editorconfig: ## link editor config
	ln -s $(DOTS)/.editorconfig $(HOME)/.editorconfig

Xresources: ## link Xresources file
	ln -s $(DOTS)/.Xresources $(HOME)/.Xresources

vim: ## link vim configuration
	ln -s $(DOTS)/.vimrc $(HOME)/.vimrc
	ln -s $(DOTS)/.gvimrc $(HOME)/.gvimrc

tmux: ## link tmux configuration files
	ln -s $(DOTS)/tmux/.tmux.conf $(HOME)/.tmux.conf
	ln -s $(DOTS)/tmux/.tmux-linux.conf $(HOME)/.tmux-linux.conf
	ln -s $(DOTS)/tmux/.tmux-macos.conf $(HOME)/.tmux-macos.conf
	ln -s $(DOTS)/tmux/.tmux-onedark-theme.tmux $(HOME)/.tmux-onedark-theme.tmux
