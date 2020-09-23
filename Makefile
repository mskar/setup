# This Makefile will install anything missing from your Mac
#
# If you need to set up a new Mac, run setup.sh
# After editing a file in this repo,
# run make all to check if dotfiles need updating
# Existing packages will not be updated,
# To update all packages, run update.sh

VSCODE_LIVESHARE = $(wildcard ~/.vscode/extensions/ms-vsliveshare.vsliveshare-*)
VSCODE_PYTHON = $(wildcard ~/.vscode/extensions/ms-python.python-*)
VSCODE_VIM = $(wildcard ~/.vscode/extensions/vscodevim.vim-*)

all: bash bat brew conda exa fasd fd flycut font fzf gitconfig hub ipy iterm jetbrains karabiner neovim pyenv rstudio scim shiftit spacevim tmux toolbox vim vscode xpdf zsh

bash: bash-exe bash_profile inputrc
iterm: iterm-exe iterm-config
jetbrains: toolbox ideavimrc
karabiner: karabiner-config karabiner-exe
neovim: neovim-exe neovim-init
rstudio: renv rstudio-settings rstudio-ide-bindings rstudio-editor-bindings
tmux: tmux-exe tmux-dot tmux-local tmux-plug
vim: vim-exe vim-config
vscode: vscode-exe vscode-liveshare vscode-python vscode-vim vscode-keybindings vscode-settings
zsh: p10k zshrc zsh-syntax-highlighting zsh-autosuggestions

bash-exe: /usr/local/bin/bash
bash_profile: ~/.bash_profile
bat: /usr/local/bin/bat
brew: /usr/local/bin/brew
conda: ~/miniconda/bin/conda
exa: /usr/local/bin/exa
fasd: /usr/local/bin/fasd
fd: /usr/local/bin/fd
flycut: /Applications/Flycut.app
font: ~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf
fzf: /usr/local/bin/fzf
gitconfig: ~/.gitconfig
hub: /usr/local/bin/hub
ipy: ~/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/startup/keybindings.py
ideavimrc: ~/.ideavimrc
inputrc: ~/.inputrc
iterm-config: ~/com.googlecode.iterm2.plist
iterm-exe: /Applications/iTerm.app
karabiner-config: ~/.config/karabiner/karabiner.json
karabiner-exe: /Applications/Karabiner-Elements.app
neovim-exe: /usr/local/bin/nvim
neovim-init: ~/.config/nvim/init.vim
p10k: ~/.zsh/powerlevel10k ~/.p10k.zsh
pyenv: ~/miniconda/envs/py
renv: ~/miniconda/envs/r
repo: ~/mskar/setup
rstats: /usr/local/bin/r
rstudio-editor-bindings: ~/.config/rstudio/keybindings/editor_bindings.json
rstudio-ide-bindings: ~/.config/rstudio/keybindings/rstudio_bindings.json
rstudio-settings: ~/.config/rstudio/rstudio-prefs.json
scim: /usr/local/bin/scim
shiftit: /Applications/ShiftIt.app
tmux-exe: /usr/local/bin/tmux
tmux-dot: ~/.tmux.conf
tmux-local: ~/.tmux.conf.local
tmux-plug: ~/.tmux/plugins/tpm
toolbox: /Applications/JetBrains\ Toolbox.app
vim-exe: /usr/local/bin/vim
vim-config: ~/.vimrc
vscode-exe: /Applications/Visual\ Studio\ Code.app
vscode-keybindings: ~/Library/Application\ Support/Code/User/keybindings.json
vscode-liveshare: $(VSCODE_LIVESHARE)
vscode-python: $(VSCODE_PYTHON)
vscode-settings: ~/Library/Application\ Support/Code/User/settings.json
vscode-vim: $(VSCODE_VIM)
xpdf: /usr/local/bin/xpdf
zsh-autosuggestions: ~/.zsh/zsh-autosuggestions
zsh-syntax-highlighting: ~/.zsh/zsh-syntax-highlighting
zshrc: ~/.zshrc
xcode-devtools: /Library/Developer/CommandLineTools/

~/mskar/setup/init.vim: repo
~/mskar/setup/.vimrc: repo
~/mskar/setup/.tmux.conf: repo
~/mskar/setup/.tmux.conf.local: repo
~/mskar/setup/.zshrc: repo
~/mskar/setup/.p10k.zsh: repo
~/mskar/setup/.bash_profile: repo
~/mskar/setup/.inputrc: repo
~/mskar/setup/.gitconfig: repo
~/mskar/setup/ipython_config.py: repo
~/mskar/setup/keybindings.py: repo
~/mskar/setup/.ideavimrc: repo
~/mskar/setup/karabiner.json: repo
~/mskar/setup/keybindings.json: repo
~/mskar/setup/settings.json: repo
~/mskar/setup/rstudio-prefs.json: repo
~/mskar/setup/editor_bindings.json: repo
~/mskar/setup/rstudio_bindings.json: repo
~/mskar/setup/com.googlecode.iterm2.plist: repo

/usr/local/bin/bash:
	-brew install bash
~/.bash_profile: ~/mskar/setup/.bash_profile
	curl https://raw.githubusercontent.com/mskar/setup/master/.bash_profile -o ~/.bash_profile
~/.inputrc: ~/mskar/setup/.inputrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.inputrc -o ~/.inputrc
/usr/local/bin/bat:
	-brew install bat
/usr/local/bin/brew:
	-curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
~/miniconda/bin/conda:
	-curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh
	-bash ~/miniconda.sh -bp ~/miniconda
	-conda install -yc conda-forge cookiecutter nodejs neovim pybtex
/usr/local/bin/exa:
	-brew install exa
/usr/local/bin/fasd:
	-brew install fasd
/usr/local/bin/fd:
	-brew install fd
/Applications/Flycut.app:
	-brew cask install flycut
~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf:
	-brew cask install homebrew/cask-fonts/font-fira-code-nerd-font
	-ln -fs ~/Library/Fonts/Fira\ Code\ Regular\ Nerd\ Font\ Complete.otf ~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf
/usr/local/bin/fzf:
	-brew install fzf
	/usr/local/opt/fzf/install --no-fish --key-bindings --completion --update-rc
~/.gitconfig: ~/mskar/setup/.gitconfig
	curl https://raw.githubusercontent.com/mskar/setup/master/.gitconfig -o ~/.gitconfig
/usr/local/bin/hub:
	-brew install hub
/Applications/iTerm.app:
	-brew cask install iterm2
~/com.googlecode.iterm2.plist: ~/mskar/setup/com.googlecode.iterm2.plist
	curl https://raw.githubusercontent.com/mskar/setup/master/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
/Applications/JetBrainsToolbox.app:
	-brew cask install jetbrains-toolbox
	-ln -fs /Applications/JetBrains\ Toolbox.app /Applications/JetBrainsToolbox.app
~/.ideavimrc: ~/mskar/setup/.ideavimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.ideavimrc -o ~/.ideavimrc
/Applications/Karabiner-Elements.app:
	-brew cask install karabiner-elements
~/.config/karabiner/karabiner.json: ~/mskar/setup/karabiner.json
	curl https://raw.githubusercontent.com/mskar/setup/master/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
~/.ipython/profile_default/ipython_config.py: ~/mskar/setup/ipython_config.py
	curl https://raw.githubusercontent.com/mskar/setup/master/ipython_config.py -o ~/.ipython/profile_default/ipython_config.py
~/.ipython/profile_default/startup/keybindings.py: ~/mskar/setup/keybindings.py
	curl https://raw.githubusercontent.com/mskar/setup/master/keybindings.py -o ~/.ipython/profile_default/startup/keybindings.py
/usr/local/bin/nvim:
	-brew install neovim
~/.config/nvim/init.vim: ~/mskar/setup/init.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/init.vim -o ~/.config/nvim/init.vim --create-dirs
~/.zsh/powerlevel10k:
	-git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
~/.p10k.zsh: ~/mskar/setup/.p10k.zsh
	curl https://raw.githubusercontent.com/mskar/setup/master/.p10k.zsh -o ~/.p10k.zsh
~/miniconda/envs/py:
	conda create -yc conda-forge -n py python=3.8 joblib jupyterlab seaborn numpy pandas scikit-learn scipy
~/mskar/setup/:
	-git clone https://github.com/mskar/setup ~/py4ds/setup
/usr/local/bin/r:
	-brew cask install r
~/miniconda/envs/r:
	conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse
~/.config/rstudio/rstudio-prefs.json: ~/mskar/setup/rstudio-prefs.json
	curl https://raw.githubusercontent.com/mskar/setup/master/rstudio-prefs.json -o ~/.config/rstudio/rstudio-prefs.json --create-dirs
~/.config/rstudio/keybindings/editor_bindings.json: ~/mskar/setup/editor_bindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/editor_bindings.json -o ~/.config/rstudio/keybindings/editor_bindings.json --create-dirs
~/.config/rstudio/keybindings/rstudio_bindings.json: ~/mskar/setup/rstudio_bindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/rstudio_bindings.json -o ~/.config/rstudio/keybindings/rstudio_bindings.json --create-dirs
/usr/local/bin/scim:
	-brew install sc-im
/Applications/ShiftIt.app:
	-brew cask install shiftit
/usr/local/bin/tmux:
	-brew install tmux
~/.tmux.conf.local: ~/mskar/setup/.tmux.conf.local
	curl https://raw.githubusercontent.com/mskar/setup/master/.tmux.conf.local -o ~/.tmux.conf.local
~/.tmux.conf:
	curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf
~/.tmux/plugins/tpm:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
/usr/local/bin/vim:
	-brew install vim
~/.vimrc: ~/mskar/setup/vim/.vimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.vimrc -o ~/.vimrc
/Applications/VisualStudioCode.app:
	-brew cask install visual-studio-code
~/Library/Application\ Support/Code/User/settings.json: ~/mskar/setup/settings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/settings.json -o ~/Library/Application\ Support/Code/User/settings.json --create-dirs
~/Library/Application\ Support/Code/User/keybindings.json: ~/mskar/setup/keybindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/keybindings.json -o ~/Library/Application\ Support/Code/User/keybindings.json --create-dirs
$(VSCODE_PYTHON):
	code --install-extension ms-python.python --force
$(VSCODE_VIM):
	code --install-extension vscodevim.vim --force
$(VSCODE_LIVESHARE):
	code --install-extension ms-vsliveshare.vsliveshare --force
/usr/local/bin/xpdf:
	-brew install xpdf
~/.zshrc: ~/mskar/setup/.zshrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.zshrc -o ~/.zshrc
~/.zsh/zsh-autosuggestions:
	-git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
~/.zsh/zsh-syntax-highlighting:
	-git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
/Library/Developer/CommandLineTools:
	xcode-select --install

clean:
	rm -rf ~/.zsh/
	rm -rf ~/.SpaceVim
	rm -rf ~/.zsh/powerlevel10k
	rm -rf ~/.tmux
	rm -rf ~/.tmux/plugins/tpm

.PHONY: bash iterm jetbrains karabiner neovim rstudio spacevim tmux vim vscode zsh bat brew conda exa fasd fd flycut font fzf gitconfig hub pyenv scim shiftit toolbox xpdf bash-exe bash_profile ideavimrc inputrc iterm-config iterm-exe karabiner-config karabiner-exe neovim-au neovim-exe neovim-init neovim-map neovim-plug neovim-set p10k renv rstats rstudio-editor-bindings rstudio-ide-bindings rstudio-settings spacevim-config-toml spacevim-config-vim spacevim-exe tmux-exe tmux-dot tmux-local tmux-plug vim-au vim-exe vim-map vim-plug vim-set vim-config vscode-exe vscode-keybindings vscode-liveshare vscode-python vscode-settings vscode-vim zsh-autosuggestions zsh-syntax-highlighting zshrc
