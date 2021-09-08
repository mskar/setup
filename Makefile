# This Makefile will install anything missing from your Mac
#
# If you need to set up a new Mac, run setup.sh
# After editing a file in this repo,
# run make all to check if dotfiles need updating
# Existing packages will not be updated,
# To update all packages, run update.sh

AG = $(shell brew --prefix)/bin/ag
BASH = $(shell brew --prefix)/bin/bash
BAT = $(shell brew --prefix)/bin/bat
BREW = $(shell brew --prefix)/bin/brew
BTM = $(shell brew --prefix)/bin/btm
DELTA = $(shell brew --prefix)/bin/delta
EMACS = $(shell brew --prefix)/bin/emacs
EXA = $(shell brew --prefix)/bin/exa
FASD = $(shell brew --prefix)/bin/fasd
FD = $(shell brew --prefix)/bin/fd
FZF = $(shell brew --prefix)/bin/fzf
GH = $(shell brew --prefix)/bin/gh
GIT = $(shell brew --prefix)/bin/git
GMV = $(shell brew --prefix)/bin/gmv
NODE = $(shell brew --prefix)/bin/node
NOTI = $(shell brew --prefix)/bin/noti
NVIM = $(shell brew --prefix)/bin/nvim
PASS = $(shell brew --prefix)/bin/pass
POPPLER = $(shell brew --prefix)/bin/pdftotext
RENAME = $(shell brew --prefix)/bin/rename
RG = $(shell brew --prefix)/bin/rg
RSTATS = $(shell brew --prefix)/bin/r
SCIM = $(shell brew --prefix)/bin/scim
TLDR = $(shell brew --prefix)/bin/tldr
TMUX = $(shell brew --prefix)/bin/tmux
VIM = $(shell brew --prefix)/bin/vim
VSCODE_LIVESHARE = $(wildcard ~/.vscode/extensions/ms-vsliveshare.vsliveshare-*)
VSCODE_PYLANCE =  $(wildcard ~/.vscode/extensions/ms-python.vscode-pylance-*)
VSCODE_PYTHON = $(wildcard ~/.vscode/extensions/ms-python.python-*)
VSCODE_R = $(wildcard ~/.vscode/extensions/ikuyadeu.r-*)
VSCODE_TABNINE = $(wildcard ~/.vscode/extensions/tabnine.tabnine-vscode-*)
VSCODE_VIM = $(wildcard ~/.vscode/extensions/asvetliakov.vscode-neovim-*)

all: ag alfred alttab bash bat bottom brew coc conda copyq emacs exa default fasd fd font fzf git gmv ipy iterm jupyter jetbrains karabiner neovim node noti pass ptpython radian rename repo rg rstudio scim slate tldr tmux vim vimr vscode poppler zsh

ag: $(AG)
alfred: /Applications/Alfred4.app
alttab: /Applications/AltTab.app
slate: /Applications/Slate.app ~/.slate
bash: $(BASH) ~/.bash_profile ~/.inputrc
bat: $(BAT)
bottom: $(BTM) ~/.config/bottom/bottom.toml
brew: $(BREW) ~/.Brewfile
coc: ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
conda: $(shell brew --prefix)/bin/conda
copyq: /Applications/CopyQ.app
default: ~/Library/KeyBindings/DefaultKeyBinding.dict
emacs: $(EMACS) ~/.emacs.d ~/.spacemacs ~/.doom/doom-emacs ~/.doom/doom-emacs-config ~/.doom/doom-emacs-config/config.el ~/.doom/doom-emacs-config/package.el
exa: $(EXA)
fasd: $(FASD)
fd: $(FD)
font: ~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf
fzf: $(FZF)
git: $(GIT) $(GH) $(DELTA) ~/.gitconfig ~/.gitignore ~/.gitattributes
gmv: $(GMV)
ipy: $(shell brew --prefix)/bin/ipython ~/.ipython/profile_default/ipython_config.py # ~/.ipython/profile_default/startup/keybindings.py
iterm: ~/com.googlecode.iterm2.plist /Applications/iTerm.app
jetbrains: /Applications/JetBrainsToolbox.app ~/.ideavimrc
jupyter: $(shell brew --prefix)/bin/jupyter ~/.jupyter/lab/user-settings/jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings
karabiner: ~/.config/karabiner/karabiner.json /Applications/Karabiner-Elements.app
neovim: $(NVIM) ~/.config/nvim/init.vim ~/.local/share/nvim/undo ~/tmux_split.vim
node: $(NODE)
noti: $(NOTI)
pass: $(PASS)
poppler: $(POPPLER)
ptpython: $(shell brew --prefix)/bin/ptpython ~/Library/ApplicationSupport/ptpython/config.py
radian: $(shell brew --prefix)/bin/radian ~/.radian_profile
rename: $(RENAME)
repo: ~/mskar/setup
rg: $(RG)
rstudio: $(brew --prefix)/Caskroom/mambaforge/base/envs/r ~/.config/rstudio/keybindings/editor_bindings.json ~/.config/rstudio/keybindings/rstudio_bindings.json ~/.config/rstudio/rstudio-prefs.json
scim: $(SCIM)
tldr: $(TLDR)
tmux: $(TMUX) ~/.tmux.conf ~/.tmux.conf.local ~/.tmux/plugins/tpm
vim: $(VIM) ~/.vimrc ~/.vim/undodir
vimac: /Applications/Vimac.app
vimr: /Applications/VimR.app
vscode: /Applications/VSCodium.app $(VSCODE_LIVESHARE) $(VSCODE_PYLANCE) $(VSCODE_PYTHON) $(VSCODE_R) $(VSCODE_TABNINE) $(VSCODE_VIM) ~/Library/ApplicationSupport/VSCodium/User/keybindings.json ~/Library/ApplicationSupport/VSCodium/User/settings.json
zsh: ~/.zsh/powerlevel10k ~/.p10k.zsh ~/.zshrc ~/.zsh/zsh-autosuggestions ~/.zsh/zsh-syntax-highlighting

~/mskar/setup/.bash_profile: repo
~/mskar/setup/.gitconfig: repo
~/mskar/setup/.ideavimrc: repo
~/mskar/setup/.inputrc: repo
~/mskar/setup/.p10k.zsh: repo
~/mskar/setup/.tmux.conf.local: repo
~/mskar/setup/.vimrc: repo
~/mskar/setup/.zshrc: repo
~/mskar/setup/com.googlecode.iterm2.plist: repo
~/mskar/setup/config.py: repo
~/mskar/setup/.radian_profile: repo
~/mskar/setup/editor_bindings.json: repo
~/mskar/setup/init.vim: repo
~/mskar/setup/ipython_config.py: repo
~/mskar/setup/karabiner.json: repo
~/mskar/setup/keybindings.json: repo
# ~/mskar/setup/keybindings.py: repo
~/mskar/setup/rstudio-prefs.json: repo
~/mskar/setup/rstudio_bindings.json: repo
~/mskar/setup/settings.json: repo

$(AG):
	-brew install ag
/Applications/Alfred4.app:
	-brew install --cask alfred
	-ln -sf /Applications/Alfred\ 4.app /Applications/Alfred4.app
/Applications/AltTab.app:
	-brew install --cask alttab
/Applications/Slate.app:
	-brew install --cask slate
~/.slate:
	ln -sf ~/mskar/setup/.slate ~/.slate
$(BASH):
	-brew install bash
~/.bash_profile: ~/mskar/setup/.bash_profile
	ln -sf ~/mskar/setup/.bash_profile ~/.bash_profile
~/.inputrc: ~/mskar/setup/.inputrc
	ln -sf ~/mskar/setup/.inputrc ~/.inputrc
~/.config/bottom/bottom.toml: ~/mskar/setup/bottom.toml
	mkdir -p ~/.config/bottom
	ln -sf ~/mskar/setup/bottom.toml ~/.config/bottom/bottom.toml
$(BAT):
	-brew install bat
$(BTM):
	-brew install clementtsang/bottom/bottom
$(BREW):
	-echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
~/.Brewfile:
	ln -sf ~/mskar/setup/Brewfile ~/.Brewfile
~/.config/nvim/coc-settings.json: ~/mskar/setup/coc-settings.json
	mkdir -p ~/.config/nvim
	ln -sf ~/mskar/setup/coc-settings.json ~/.config/nvim/coc-settings.json
~/.vim/coc-settings.json: ~/mskar/setup/coc-settings.json
	mkdir -p ~/.vim/
	ln -sf ~/mskar/setup/coc-settings.json ~/.vim/coc-settings.json
$(shell brew --prefix)/bin/conda:
	-brew install mambaforge
	-$(shell brew --prefix)/bin/conda install -yc conda-forge cookiecutter neovim
$(DELTA):
	-brew install git-delta
~/Library/KeyBindings/DefaultKeyBinding.dict:
	mkdir -p ~/Library/KeyBindings
	ln -fs ~/mskar/setup/karabiner.json ~/.config/karabiner
$(EMACS):
	mkdir -p ~/.config/emacs
	-brew install --cask emacs
	-brew install emacs
	-brew link --overwrite emacs
	ln -fs ~/mskar/setup/init.el ~/.config/emacs/init.el
~/.emacs.d:
	-git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
~/.spacemacs: ~/mskar/setup/.spacemacs
	-ln -fs ~/mskar/setup/.spacemacs ~/.spacemacs
~/.doom/doom-emacs:
	git clone https://github.com/hlissner/doom-emacs ~/.doom/doom-emacs
~/.doom/doom-emacs-config:
	export DOOMDIR=~/.doom/doom-emacs-config
	mkdir -p ~/.doom/doom-emacs-config
	~/.doom/doom-emacs/bin/doom install
~/.doom/doom-emacs-config/config.el: ~/mskar/setup/config.el
	-ln -fs ~/mskar/setup/config.el ~/.doom/doom-emacs-config/config.el
~/.doom/doom-emacs-config/package.el: ~/mskar/setup/package.el
	-ln -fs ~/mskar/setup/package.el ~/.doom/doom-emacs-config/package.el
	~/.doom/doom-emacs/bin/doom sync
$(EXA):
	-brew install exa
$(FASD):
	-brew install fasd
$(FD):
	-brew install fd
/Applications/CopyQ.app:
	-brew install --cask copyq
~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf:
	-brew install --cask homebrew/cask-fonts/font-fira-code-nerd-font
	-ln -fs ~/Library/Fonts/Fira\ Code\ Regular\ Nerd\ Font\ Complete.otf ~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf
$(FZF):
	-brew install fzf
	-$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-fish --no-update-rc
$(GH):
	-brew install gh
$(GIT):
	-brew install git
~/.gitattributes:
	curl https://gist.githubusercontent.com/tekin/12500956bd56784728e490d8cef9cb81/raw/e474af61231687b0e1a4ec59d4becd97537ef6c0/.gitattributes -o ~/.gitattributes
~/.gitconfig: ~/mskar/setup/.gitconfig
	ln -sf ~/mskar/setup/.gitconfig ~/.gitconfig
~/.gitignore: ~/mskar/setup/.gitignore
	ln -sf ~/mskar/setup/.gitignore ~/.gitignore
$(GMV):
	-brew install coreutils
/Applications/iTerm.app:
	-brew install --cask iterm2
~/com.googlecode.iterm2.plist: ~/mskar/setup/com.googlecode.iterm2.plist
	ln -sf ~/mskar/setup/com.googlecode.iterm2.plist ~/com.googlecode.iterm2.plist
/Applications/JetBrainsToolbox.app:
	-brew install --cask jetbrains-toolbox
	-ln -fs /Applications/JetBrains\ Toolbox.app /Applications/JetBrainsToolbox.app
$(shell brew --prefix)/bin/jupyter:
	-python -m pip install jupyter
~/.ideavimrc: ~/mskar/setup/.ideavimrc
	-ln -fs ~/mskar/setup/.ideavimrc ~/.ideavimrc
/Applications/Karabiner-Elements.app:
	-brew install --cask karabiner-elements
~/.config/karabiner/karabiner.json: ~/mskar/setup/karabiner.json
	mkdir -p ~/.config/karabiner
	-ln -fs ~/mskar/setup/karabiner.json ~/.config/karabiner/
$(shell brew --prefix)/bin/ipython:
	-python -m pip install git+https://github.com/mskar/ipython
~/.ipython/profile_default/ipython_config.py: ~/mskar/setup/ipython_config.py
	mkdir -p ~/.ipython/profile_default
	ln -sf ~/mskar/setup/ipython_config.py ~/.ipython/profile_default/ipython_config.py
# ~/.ipython/profile_default/startup/keybindings.py: ~/mskar/setup/keybindings.py
	# mkdir -p ~/.ipython/profile_default/startup
	# ln -sf ~/mskar/setup/keybindings.py ~/.ipython/profile_default/startup/keybindings.py
$(NODE):
	-brew install node
$(NOTI):
	-brew install noti
$(NVIM):
	-brew install neovim
~/tmux_split.vim:
	curl https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/R/tmux_split.vim -o ~/tmux_split.vim
~/.jupyter/lab/user-settings/jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings: ~/mskar/setup/shortcuts.jupyterlab-settings
	mkdir -p ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension ~/.jupyter/lab/user-settings/jupyterlab/shortcuts-extension
	ln -sf ~/mskar/setup/shortcuts.jupyterlab-settings ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings
	ln -sf ~/mskar/setup/shortcuts.jupyterlab-settings ~/.jupyter/lab/user-settings/jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings
~/.config/nvim/init.vim: ~/mskar/setup/init.vim
	mkdir -p ~/.config/nvim
	ln -sf ~/mskar/setup/init.vim ~/.config/nvim/init.vim
~/.config/nvim/ginit.vim: ~/mskar/setup/ginit.vim
	mkdir -p ~/.config/nvim
	ln -sf ~/mskar/setup/ginit.vim ~/.config/nvim/ginit.vim
~/.config/coc/ultisnips/all.snippets: ~/mskar/setup/all.snippets
	mkdir -p ~/.config/coc/ultisnips
	ln -sf ~/mskar/setup/all.snippets ~/.config/coc/ultisnips/all.snippets
~/.local/share/nvim/undo:
	mkdir -p ~/.local/share/nvim/undo
$(PASS):
	-brew install pass
~/.zsh/powerlevel10k:
	-git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
~/.p10k.zsh: ~/mskar/setup/.p10k.zsh
	ln -sf ~/mskar/setup/.p10k.zsh ~/.p10k.zsh
$(brew --prefix)/Caskroom/mambaforge/base/envs/py:
	conda create -yc conda-forge -n py python=3.8 joblib jupyterlab seaborn numpy pandas scikit-learn scipy
$(shell brew --prefix)/bin/ptpython:
	-python -m pip install git+https://github.com/mskar/ptpython
~/Library/ApplicationSupport/ptpython/config.py: ~/mskar/setup/config.py
	mkdir -p ~/Library/Application\ Support/ptpython/ ~/Library/ApplicationSupport/ptpython/
	-ln -sf ~/mskar/setup/config.py ~/Library/Application\ Support/ptpython/config.py
	-ln -sf ~/mskar/setup/config.py ~/Library/ApplicationSupport/ptpython/config.py
$(shell brew --prefix)/bin/radian:
	-python -m pip install git+https://github.com/mskar/radian
~/.radian_profile: ~/mskar/setup/.radian_profile
	ln -sf ~/mskar/setup/.radian_profile ~/.radian_profile
$(RENAME):
	-brew install rename
~/mskar/setup/:
	-git clone https://github.com/mskar/setup ~/py4ds/setup
$(RG):
	-brew install rg
$(RSTATS):
	-brew install --cask r
$(brew --prefix)/Caskroom/mambaforge/base/envs/r:
	conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse
~/.config/rstudio/rstudio-prefs.json: ~/mskar/setup/rstudio-prefs.json
	mkdir -p ~/.config/rstudio ~/.config/rstudio/keybindings
	ln -sf ~/mskar/setup/rstudio-prefs.json ~/.config/rstudio/rstudio-prefs.json
~/.config/rstudio/keybindings/editor_bindings.json: ~/mskar/setup/editor_bindings.json
	ln -sf ~/mskar/setup/editor_bindings.json ~/.config/rstudio/keybindings/editor_bindings.json
~/.config/rstudio/keybindings/rstudio_bindings.json: ~/mskar/setup/rstudio_bindings.json
	ln -sf ~/mskar/setup/rstudio_bindings.json ~/.config/rstudio/keybindings/rstudio_bindings.json
$(SCIM):
	-brew install sc-im
$(TLDR):
	-brew install tldr
$(TMUX):
	-brew install tmux
~/.tmux.conf.local: ~/mskar/setup/.tmux.conf.local
	ln -sf ~/mskar/setup/.tmux.conf.local ~/.tmux.conf.local
~/.tmux.conf:
	curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf
~/.tmux/plugins/tpm:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$(VIM):
	-brew install vim
~/.vimrc: ~/mskar/setup/.vimrc
	ln -sf ~/mskar/setup/.vimrc ~/.vimrc
/Applications/Vimac.app:
	-brew install --cask vimac
/Applications/VimR.app:
	-brew install --cask vimr
/Applications/VSCodium.app:
	-brew install --cask vscodium
~/Library/ApplicationSupport/VSCodium/User/settings.json: ~/mskar/setup/settings.json
	-ln -sf ~/mskar/setup/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
	-ln -sf ~/mskar/setup/settings.json ~/Library/ApplicationSupport/VSCodium/User/settings.json
~/Library/ApplicationSupport/VSCodium/User/keybindings.json: ~/mskar/setup/keybindings.json
	-ln -sf ~/mskar/setup/keybindings.json ~/Library/Application\ Support/VSCodium/User/keybindings.json
	-ln -sf ~/mskar/setup/keybindings.json ~/Library/ApplicationSupport/VSCodium/User/keybindings.json
~/.vim/undodir:
	mkdir -p ~/.vim/undodir
$(VSCODE_LIVESHARE):
	-code --install-extension ms-vsliveshare.vsliveshare --force
$(VSCODE_PYLANCE):
	-code --install-extension ms-python.vscode-pylance --force
$(VSCODE_PYTHON):
	-code --install-extension ms-python.python --force
$(VSCODE_R):
	-code --install-extension ikuyadeu.r --force
$(VSCODE_TABNINE):
	-code --install-extension tabnine.tabnine-vscode --force
$(VSCODE_VIM):
	-code --install-extension asvetliakov.vscode-neovim --force
$(POPPLER):
	-brew install pdftotext
~/.zshrc: ~/mskar/setup/.zshrc
	ln -sf ~/mskar/setup/.zshrc ~/.zshrc
~/.zsh/zsh-autosuggestions:
	-git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
~/.zsh/zsh-syntax-highlighting:
	-git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

clean:
	rm ~/.bash_profile ~/.config/bottom/bottom.toml ~/.config/karabiner/karabiner.json ~/.config/nvim/coc-settings.json ~/.config/nvim/init.vim ~/.config/rstudio/keybindings/editor_bindings.json ~/.config/rstudio/keybindings/rstudio_bindings.json ~/.config/rstudio/rstudio-prefs.json ~/.gitconfig ~/.gitignore ~/.ideavimrc ~/.inputrc ~/.ipython/profile_default/ipython_config.py ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings ~/.p10k.zsh ~/.radian_profile ~/.tmux.conf.local ~/.vim/coc-settings.json ~/.vimrc ~/.zshrc ~/Library/ApplicationSupport/VSCodium/User/keybindings.json ~/Library/ApplicationSupport/VSCodium/User/settings.json ~/Library/ApplicationSupport/ptpython/config.py

.PHONY: bash iterm jetbrains karabiner neovim rstudio tmux vim vscode zsh conda font git ipy repo slate copyq
