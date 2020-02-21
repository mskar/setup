# This Makefile will update your Mac
# If you need to set up a new Mac, run setup.sh

VSCODE_LIVESHARE = $(wildcard ~/.vscode/extensions/ms-vsliveshare.vsliveshare-*)
VSCODE_PYTHON = $(wildcard ~/.vscode/extensions/ms-python.python-*)
VSCODE_VIM = $(wildcard ~/.vscode/extensions/vscodevim.vim-*)

all: bash iterm jetbrains karabiner neovim rstudio spacevim tmux vim vscode zsh bat brew conda exa fasd fd flycut font fzf gitconfig hub pyenv scim shiftit toolbox xpdf

bash: bash-exe bash_profile inputrc
iterm: iterm-exe iterm-config
jetbrains: toolbox ideavimrc
karabiner: karabiner-config karabiner-exe
neovim: neovim-exe neovim-init neovim-map neovim-plug neovim-set
rstudio: renv rstudio-settings rstudio-ide-bindings rstudio-editor-bindings
spacevim: spacevim-exe spacevim-config-toml spacevim-config-vim
tmux: tmux-exe tmux-dot tmux-local tmux-plug
vim: vim-exe vim-map vim-plug vim-set vim-config
vscode: vscode-exe vscode-liveshare vscode-python vscode-vim vscode-keybindings vscode-settings
zsh: omz pl9k zshrc zsh-syntax-highlighting zsh-autosuggestions

bash-exe: /usr/local/Cellar/bash
bash_profile: ~/.bash_profile
bat: /usr/local/Cellar/bat
brew: /usr/local/Cellar/
conda: ~/miniconda
exa: /usr/local/Cellar/exa
fasd: /usr/local/Cellar/fasd
fd: /usr/local/Cellar/fd
flycut: /usr/local/Caskroom/flycut
font: /usr/local/Caskroom/font-firacode-nerd-font
fzf: /usr/local/Cellar/fzf
gitconfig: ~/.gitconfig
hub: /usr/local/Cellar/hub
ideavimrc: ~/.ideavimrc
inputrc: ~/.inputrc
iterm-config: ~/com.googlecode.iterm2.plist
iterm-exe: /usr/local/Caskroom/iterm2
karabiner-config: ~/.config/karabiner/karabiner.json
karabiner-exe: /usr/local/Caskroom/karabiner-elements
neovim-exe: /usr/local/Cellar/neovim
neovim-init: ~/.config/nvim/init.vim
neovim-map: ~/.config/nvim/map.vim
neovim-plug: ~/.config/nvim/plug.vim
neovim-set: ~/.config/nvim/set.vim
omz: ~/.oh-my-zsh
pl9k: ~/.oh-my-zsh/themes/powerlevel9k
pyenv: /Users/marskar/miniconda/envs/py
renv: /Users/marskar/miniconda/envs/r
rstats: /usr/local/Caskroom/r
rstudio-editor-bindings: ~/.R/rstudio/keybindings/editor_bindings.json
rstudio-ide-bindings: ~/.R/rstudio/keybindings/rstudio_bindings.json
rstudio-settings: ~/.rstudio-desktop/monitored/user-settings/user-settings
scim: /usr/local/Cellar/sc-im
shiftit: /usr/local/Caskroom/shiftit
spacevim-config-toml: ~/.SpaceVim.d/init.toml
spacevim-config-vim: ~/.SpaceVim.d/autoload/myspacevim.vim
spacevim-exe: ~/.SpaceVim
tmux-exe: /usr/local/Cellar/tmux
tmux-dot: ~/.tmux
tmux-local: ~/.tmux.conf.local
tmux-plug: ~/.tmux/plugins/tpm
toolbox: /usr/local/Caskroom/jetbrains-toolbox
vim-exe: /usr/local/Cellar/vim
vim-map: ~/.vimrc.map
vim-plug: ~/.vimrc.plug
vim-set: ~/.vimrc.set
vim-config: ~/.vimrc
vscode-exe: /usr/local/Caskroom/visual-studio-code
vscode-keybindings: ~/Library/ApplicationSupport/Code/User/keybindings.json
vscode-liveshare: $(VSCODE_LIVESHARE)
vscode-python: $(VSCODE_PYTHON)
vscode-settings: ~/Library/ApplicationSupport/Code/User/settings.json
vscode-vim: $(VSCODE_VIM)
xpdf: /usr/local/Cellar/xpdf
zsh-autosuggestions: ~/.oh-my-zsh/plugins/zsh-autosuggestions
zsh-syntax-highlighting: ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
zshrc: ~/.zshrc

/usr/local/Cellar/bash: brew
	brew install bash
~/.bash_profile:
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.bash_profile -o ~/.bash_profile
~/.inputrc:
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.inputrc -o ~/.inputrc
/usr/local/Cellar/bat: brew
	brew install bat
/usr/local/Cellar/:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
~/miniconda:
	curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh
	bash ~/miniconda.sh -bp $HOME/miniconda
	conda install -yc conda-forge nodejs neovim pybtex
/usr/local/Cellar/exa: brew
	brew install exa
/usr/local/Cellar/fasd: brew
	brew install fasd
/usr/local/Cellar/fd: brew
	brew install fd
/usr/local/Caskroom/flycut: brew
	brew cask install flycut
/usr/local/Caskroom/font-firacode-nerd-font: brew
	brew cask install homebrew/cask-fonts/font-firacode-nerd-font
/usr/local/Cellar/fzf: brew
	brew install fzf
	$(brew --prefix)/opt/fzf/install --no-fish --key-bindings --completion --update-rc
~/.gitconfig: brew
	curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig
/usr/local/Cellar/hub: brew
	brew install hub
/usr/local/Caskroom/iterm2: brew
	brew cask install iterm2
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
~/com.googlecode.iterm2.plist:
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
/usr/local/Caskroom/jetbrains-toolbox: brew
	brew cask install jetbrains-toolbox
~/.ideavimrc:
	curl https://raw.githubusercontent.com/py4ds/setup/master/ideavim/.ideavimrc -o ~/.ideavimrc
/usr/local/Caskroom/karabiner-elements: brew
	brew cask install karabiner-elements
~/.config/karabiner/karabiner.json:
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
/usr/local/Cellar/neovim: brew
	brew install neovim
~/.config/nvim/init.vim:
	curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_init.vim -o ~/.config/nvim/init.vim --create-dirs
~/.config/nvim/map.vim:
	curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/map.vim -o ~/.config/nvim/map.vim
~/.config/nvim/plug.vim:
	curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/plug.vim -o ~/.config/nvim/plug.vim
~/.config/nvim/set.vim:
	curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/set.vim -o ~/.config/nvim/set.vim
~/.oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~/.oh-my-zsh/themes/powerlevel9k: brew
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k
/Users/marskar/miniconda/envs/py: conda
	conda create -yc conda-forge -n py python=3.8 joblib jupyterlab matplotlib numpy pandas scikit-learn scipy
/usr/local/Caskroom/r: brew
	brew cask install r
/Users/marskar/miniconda/envs/r: conda
	conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse
~/.rstudio-desktop/monitored/user-settings/user-settings:
	curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/user-settings -o ~/.rstudio-desktop/monitored/user-settings/user-settings --create-dirs
~/.rstudio-desktop/monitored/user-settings/user-settings:
	curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/editor_bindings.json -o ~/.R/rstudio/keybindings/editor_bindings.json --create-dirs
~/.R/rstudio/keybindings/rstudio_bindings.json:
	curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/rstudio_bindings.json -o ~/.R/rstudio/keybindings/rstudio_bindings.json
/usr/local/Cellar/sc-im: brew
	brew install sc-im
/usr/local/Caskroom/shiftit: brew
	brew cask install shiftit
~/.SpaceVim: brew
	git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim
~/.SpaceVim.d/init.toml: brew
	curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs
~/.SpaceVim.d/autoload/myspacevim.vim: brew
	curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs
/usr/local/Cellar/tmux: brew
	brew install tmux
~/.tmux: brew
	git clone https://github.com/gpakosz/.tmux ~/.tmux
	ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
~/.tmux.conf.local:
	curl https://raw.githubusercontent.com/py4ds/setup/master/.tmux.conf.local -o ~/.tmux.conf.local
~/.tmux/plugins/tpm: brew
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
/usr/local/Cellar/vim: brew
	brew install vim
~/.vimrc:
	curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc
~/.vimrc.map:
	curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.map -o ~/.vimrc.map
~/.vimrc.plug:
	curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.plug -o ~/.vimrc.plug
~/.vimrc.set:
	curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.set -o ~/.vimrc.set
/usr/local/Caskroom/visual-studio-code: brew
	brew cask install visual-studio-code
~/Library/ApplicationSupport/Code/User/settings.json:
	curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/settings.json -o ~/Library/ApplicationSupport/Code/User/settings.json --create-dirs
~/Library/ApplicationSupport/Code/User/keybindings.json:
	curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/keybindings.json -o ~/Library/ApplicationSupport/Code/User/keybindings.json
$(VSCODE_PYTHON): vscode
	code --install-extension ms-python.python --force
$(VSCODE_VIM): vscode
	code --install-extension vscodevim.vim --force
$(VSCODE_LIVESHARE): vscode
	code --install-extension ms-vsliveshare.vsliveshare --force
/usr/local/Cellar/xpdf: brew
	brew install xpdf
~/.zshrc:
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.zshrc -o ~/.zshrc
~/.oh-my-zsh/plugins/zsh-syntax-highlighting: brew omz
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
~/.oh-my-zsh/plugins/zsh-autosuggestions: brew omz
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

.PHONY: bash iterm jetbrains karabiner neovim rstudio spacevim tmux vim vscode zsh bat brew conda exa fasd fd flycut font fzf gitconfig hub pyenv scim shiftit toolbox xpdf bash-exe bash_profile ideavimrc inputrc iterm-config iterm-exe karabiner-config karabiner-exe neovim-exe neovim-init neovim-map neovim-plug neovim-set omz pl9k renv rstats rstudio-editor-bindings rstudio-ide-bindings rstudio-settings spacevim-config-toml spacevim-config-vim spacevim-exe tmux-exe tmux-dot tmux-local tmux-plug vim-exe vim-map vim-plug vim-set vim-config vscode-exe vscode-keybindings vscode-liveshare vscode-python vscode-settings vscode-vim zsh-autosuggestions zsh-syntax-highlighting zshrc

