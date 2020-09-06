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

all: bash bat brew conda exa fasd fd flycut font fzf gitconfig hub iterm jetbrains karabiner neovim pyenv rstudio scim shiftit spacevim tmux toolbox vim vscode xpdf zsh

bash: bash-exe bash_profile inputrc
iterm: iterm-exe iterm-config
jetbrains: toolbox ideavimrc
karabiner: karabiner-config karabiner-exe
neovim: neovim-au neovim-exe neovim-init neovim-map neovim-plug neovim-set
rstudio: renv rstudio-settings rstudio-ide-bindings rstudio-editor-bindings
spacevim: spacevim-exe spacevim-config-toml spacevim-config-vim
tmux: tmux-exe tmux-dot tmux-local tmux-plug
vim: vim-au vim-exe vim-map vim-plug vim-set vim-config
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
ideavimrc: ~/.ideavimrc
inputrc: ~/.inputrc
iterm-config: ~/com.googlecode.iterm2.plist
iterm-exe: /Applications/iTerm.app
karabiner-config: ~/.config/karabiner/karabiner.json
karabiner-exe: /Applications/Karabiner-Elements.app
neovim-exe: /usr/local/bin/nvim
neovim-init: ~/.config/nvim/init.vim
neovim-map: ~/.config/nvim/map.vim
neovim-plug: ~/.config/nvim/plug.vim
neovim-set: ~/.config/nvim/set.vim
neovim-au: ~/.config/nvim/au.vim
p10k: ~/.zsh/powerlevel10k
pyenv: ~/miniconda/envs/py
renv: ~/miniconda/envs/r
repo: ~/mskar/setup
rstats: /usr/local/bin/r
rstudio-editor-bindings: ~/.R/rstudio/keybindings/editor_bindings.json
rstudio-ide-bindings: ~/.R/rstudio/keybindings/rstudio_bindings.json
rstudio-settings: ~/.rstudio-desktop/monitored/user-settings/user-settings
scim: /usr/local/bin/scim
shiftit: /Applications/ShiftIt.app
spacevim-config-toml: ~/.SpaceVim.d/init.toml
spacevim-config-vim: ~/.SpaceVim.d/autoload/myspacevim.vim
spacevim-exe: ~/.SpaceVim
tmux-exe: /usr/local/bin/tmux
tmux-dot: ~/.tmux
tmux-local: ~/.tmux.conf.local
tmux-plug: ~/.tmux/plugins/tpm
toolbox: /Applications/JetBrains\ Toolbox.app
vim-exe: /usr/local/bin/vim
vim-map: ~/.map.vimrc
vim-plug: ~/.plug.vimrc
vim-set: ~/.set.vimrc
vim-au: ~/.au.vimrc
vim-config: ~/.vimrc
vscode-exe: /Applications/Visual\ Studio\ Code.app
vscode-keybindings: ~/Library/ApplicationSupport/Code/User/keybindings.json
vscode-liveshare: $(VSCODE_LIVESHARE)
vscode-python: $(VSCODE_PYTHON)
vscode-settings: ~/Library/ApplicationSupport/Code/User/settings.json
vscode-vim: $(VSCODE_VIM)
xpdf: /usr/local/bin/xpdf
zsh-autosuggestions: ~/.zsh/zsh-autosuggestions
zsh-syntax-highlighting: ~/.zsh/zsh-syntax-highlighting
zshrc: ~/.zshrc
xcode-devtools: /Library/Developer/CommandLineTools/

~/mskar/setup/neovim/au.vim: repo
~/mskar/setup/neovim/init.vim: repo
~/mskar/setup/neovim/map.vim: repo
~/mskar/setup/neovim/plug.vim: repo
~/mskar/setup/neovim/set.vim: repo
~/mskar/setup/vim/.vimrc: repo
~/mskar/setup/vim/.map.vimrc: repo
~/mskar/setup/vim/.plug.vimrc: repo
~/mskar/setup/vim/.set.vimrc: repo
~/mskar/setup/vim/.au.vimrc: repo
~/mskar/setup/.tmux.conf.local: repo
~/mskar/setup/macos/.zshrc: repo
~/mskar/setup/macos/.bash_profile: repo
~/mskar/setup/macos/.inputrc: repo
~/mskar/setup/.gitconfig: repo
~/mskar/setup/ideavim/.ideavimrc: repo
~/mskar/setup/macos/karabiner.json: repo
~/mskar/setup/vscode/keybindings.json: repo
~/mskar/setup/vscode/settings.json: repo
~/mskar/setup/rstudio/user-settings: repo
~/mskar/setup/rstudio/editor_bindings.json: repo
~/mskar/setup/rstudio/rstudio_bindings.json: repo
~/mskar/setup/spacevim/init.toml: repo
~/mskar/setup/spacevim/myspacevim.vim: repo
~/mskar/setup/macos/com.googlecode.iterm2.plist: repo

/usr/local/bin/bash:
	-brew install bash
~/.bash_profile: ~/mskar/setup/macos/.bash_profile
	curl https://raw.githubusercontent.com/mskar/setup/master/macos/.bash_profile -o ~/.bash_profile
~/.inputrc: ~/mskar/setup/macos/.inputrc
	curl https://raw.githubusercontent.com/mskar/setup/master/macos/.inputrc -o ~/.inputrc
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
	-brew cask install homebrew/cask-fonts/font-firacode-nerd-font
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
~/com.googlecode.iterm2.plist: ~/mskar/setup/macos/com.googlecode.iterm2.plist
	curl https://raw.githubusercontent.com/mskar/setup/master/macos/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
/Applications/JetBrainsToolbox.app:
	-brew cask install jetbrains-toolbox
	-ln -fs /Applications/JetBrains\ Toolbox.app /Applications/JetBrainsToolbox.app
~/.ideavimrc: ~/mskar/setup/ideavim/.ideavimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/ideavim/.ideavimrc -o ~/.ideavimrc
/Applications/Karabiner-Elements.app:
	-brew cask install karabiner-elements
~/.config/karabiner/karabiner.json: ~/mskar/setup/macos/karabiner.json
	curl https://raw.githubusercontent.com/mskar/setup/master/macos/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
/usr/local/bin/nvim:
	-brew install neovim
~/.config/nvim/init.vim: ~/mskar/setup/neovim/init.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/neovim/init.vim -o ~/.config/nvim/init.vim --create-dirs
~/.config/nvim/map.vim: ~/mskar/setup/neovim/map.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/neovim/map.vim -o ~/.config/nvim/map.vim --create-dirs
~/.config/nvim/plug.vim: ~/mskar/setup/neovim/plug.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/neovim/plug.vim -o ~/.config/nvim/plug.vim --create-dirs
~/.config/nvim/set.vim: ~/mskar/setup/neovim/set.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/neovim/set.vim -o ~/.config/nvim/set.vim --create-dirs
~/.config/nvim/au.vim: ~/mskar/setup/neovim/au.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/neovim/au.vim -o ~/.config/nvim/au.vim --create-dirs
~/.zsh/powerlevel9k:
	-git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
~/miniconda/envs/py:
	conda create -yc conda-forge -n py python=3.8 joblib jupyterlab matplotlib numpy pandas scikit-learn scipy
~/mskar/setup/:
	-git clone https://github.com/mskar/setup ~/py4ds/setup
/usr/local/bin/r:
	-brew cask install r
~/miniconda/envs/r:
	conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse
~/.rstudio-desktop/monitored/user-settings/user-settings: ~/mskar/setup/rstudio/user-settings
	curl https://raw.githubusercontent.com/mskar/setup/master/rstudio/user-settings -o ~/.rstudio-desktop/monitored/user-settings/user-settings --create-dirs
~/.rstudio-desktop/keybindings/editor_bindings.json: ~/mskar/setup/rstudio/editor_bindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/rstudio/editor_bindings.json -o ~/.R/rstudio/keybindings/editor_bindings.json --create-dirs
~/.R/rstudio/keybindings/rstudio_bindings.json: ~/mskar/setup/rstudio/rstudio_bindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/rstudio/rstudio_bindings.json -o ~/.R/rstudio/keybindings/rstudio_bindings.json --create-dirs
/usr/local/bin/scim:
	-brew install sc-im
/Applications/ShiftIt.app:
	-brew cask install shiftit
~/.SpaceVim:
	-git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim
~/.SpaceVim.d/init.toml: ~/mskar/setup/spacevim/init.toml
	curl https://raw.githubusercontent.com/mskar/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs
~/.SpaceVim.d/autoload/myspacevim.vim: ~/mskar/setup/spacevim/myspacevim.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs
/usr/local/bin/tmux:
	-brew install tmux
~/.tmux:
	-git clone https://github.com/gpakosz/.tmux ~/.tmux
	ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
~/.tmux.conf.local: ~/mskar/setup/.tmux.conf.local
	curl https://raw.githubusercontent.com/mskar/setup/master/.tmux.conf.local -o ~/.tmux.conf.local
~/.tmux/plugins/tpm:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
/usr/local/bin/vim:
	-brew install vim
~/.vimrc: ~/mskar/setup/vim/.vimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/vim/.vimrc -o ~/.vimrc
~/.map.vimrc: ~/mskar/setup/vim/.map.vimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/vim/.map.vimrc -o ~/.map.vimrc
~/.plug.vimrc: ~/mskar/setup/vim/.plug.vimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/vim/.plug.vimrc -o ~/.plug.vimrc
~/.set.vimrc: ~/mskar/setup/vim/.set.vimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/vim/.set.vimrc -o ~/.set.vimrc
~/.au.vimrc: ~/mskar/setup/vim/.au.vimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/vim/.au.vimrc -o ~/.au.vimrc
/Applications/VisualStudioCode.app:
	-brew cask install visual-studio-code
	-ln -fs /Applications/Visual\ Studio\ Code.app /Applications/VisualStudioCode.app
~/Library/ApplicationSupport/Code/User/settings.json: ~/mskar/setup/vscode/settings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/vscode/settings.json -o ~/Library/ApplicationSupport/Code/User/settings.json --create-dirs
~/Library/ApplicationSupport/Code/User/keybindings.json: ~/mskar/setup/vscode/keybindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/vscode/keybindings.json -o ~/Library/ApplicationSupport/Code/User/keybindings.json --create-dirs
$(VSCODE_PYTHON):
	code --install-extension ms-python.python --force
$(VSCODE_VIM):
	code --install-extension vscodevim.vim --force
$(VSCODE_LIVESHARE):
	code --install-extension ms-vsliveshare.vsliveshare --force
/usr/local/bin/xpdf:
	-brew install xpdf
~/.zshrc: ~/mskar/setup/macos/.zshrc
	curl https://raw.githubusercontent.com/mskar/setup/master/macos/.zshrc -o ~/.zshrc
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
