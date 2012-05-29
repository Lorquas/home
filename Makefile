# Makefile to install .home on the target system

# destination path
DEST_PATH = $(HOME)/.home

# files to delete from $HOME
DOT_FILES = $(HOME)/.zshrc

# oh-my-zsh Repository to be used
OH_MY_REPO = https://github.com/sorin-ionescu/oh-my-zsh.git

# local .zshrc (gets inserted into .zshrc for local specialities)
LOCAL_SETTINGS_FILE = $(HOME)/.local.zshrc

ZSH_PATH = `which zsh`

install: $(HOME)/.oh-my-zsh clean $(DOT_FILES) $(LOCAL_SETTINGS_FILE) help
	
clean:
	rm -f $(DOT_FILES)
help:
	@echo "done"
	@echo 
	@echo " => now run 'chsh -s' to change your used shell to activate settings"


# target to clone oh-my-zsh repository
$(HOME)/.oh-my-zsh:
	git clone $(OH_MY_REPO) $(HOME)/.oh-my-zsh
	cd $(HOME)/.oh-my-zsh
	git submodule update --init --recursive
	
	
# sym links
$(HOME)/.zshrc:
	ln -s $(DEST_PATH)/.zshrc $(HOME)/.zshrc

$(HOME)/.vimrc:
	ln -s $(DEST_PATH)/.vimrc $(HOME)/.vimrc
	
# local settings file
$(LOCAL_SETTINGS_FILE):
	touch $(LOCAL_SETTINGS_FILE)
