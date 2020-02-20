# This Makefile will update your Mac
# If you need to set up a new Mac, run setup.sh

VENV_NAME_R = r
VENV_NAME_PYTHON = py


all: brew flycut font gitconfig iterm-config iterm jetbrains-toolbox karabiner omz pl9k rstats shiftit vscode zauto zshrc zsynt

bash: /usr/local/Cellar/bash ~/.bash_profile ~/.inputrc
bat: /usr/local/Cellar/bat
brew: /usr/local/Cellar/
conda: ~/miniconda.sh ~/miniconda
exa: /usr/local/Cellar/exa
fasd: /usr/local/Cellar/fasd
fd: /usr/local/Cellar/fd
flycut: /usr/local/Caskroom/flycut
font: /usr/local/Caskroom/font-firacode-nerd-font
fzf: /usr/local/Cellar/fzf
gitconfig: ~/.gitconfig
hub: /usr/local/Cellar/hub
iterm: /usr/local/Caskroom/iterm2 ~/com.googlecode.iterm2.plist
jetbrains: /usr/local/Caskroom/jetbrains-toolbox ~/.ideavimrc
karabiner: /usr/local/Caskroom/karabiner-elements ~/.config/karabiner/karabiner.json
neovim: /usr/local/Cellar/neovim ~/.config/nvim/local_init.vim ~/.config/nvim/local_bundles.vim ~/.config/nvim/init.vim
omz: ~/.oh-my-zsh
pl9k: ~/.oh-my-zsh/themes/powerlevel9k
rstats: /usr/local/Caskroom/r
scim: /usr/local/Cellar/sc-im
shiftit: /usr/local/Caskroom/shiftit
tmux: /usr/local/Cellar/tmux ~/.tmux ~/.tmux.conf.local ~/.tmux/plugins/tpm
vim: /usr/local/Cellar/vim ~/.vimrc.local ~/.vimrc.local.bundles ~/.vimrc
spacevim: ~/.SpaceVim ~/.SpaceVim.d/init.toml ~/.SpaceVim.d/autoload/myspacevim.vim
vscode: /usr/local/Caskroom/visual-studio-code ~/Library/ApplicationSupport/Code/User/keybindings.json ~/Library/ApplicationSupport/Code/User/settings.json $(wildcard ~/.vscode/extensions/ms-python.python-* ~/.vscode/extensions/vscodevim.vim-* ~/.vscode/extensions/ms-vsliveshare.vsliveshare-*)
xpdf: /usr/local/Cellar/xpdf
zsh: ~/.zshrc ~/.oh-my-zsh/plugins/zsh-syntax-highlighting  ~/.oh-my-zsh/plugins/zsh-autosuggestions

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
/usr/local/Cellar/:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
~/.oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~/.oh-my-zsh/themes/powerlevel9k:
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k
~/.oh-my-zsh/plugins/zsh-autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
~/.oh-my-zsh/plugins/zsh-syntax-highlighting:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
~/.zshrc:
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.zshrc -o ~/.zshrc
~/.gitconfig:
	curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig
/usr/local/Caskroom/font-firacode-nerd-font:
	brew cask install homebrew/cask-fonts/font-firacode-nerd-font
/usr/local/Caskroom/flycut:
	brew cask install flycut
/usr/local/Caskroom/iterm2:
	brew cask install iterm2
/usr/local/Caskroom/jetbrains-toolbox:
	brew cask install jetbrains-toolbox
/usr/local/Caskroom/karabiner-elements:
	brew cask install karabiner-elements
/usr/local/Caskroom/r:
	brew cask install r
/usr/local/Caskroom/shiftit:
	brew cask install shiftit
/usr/local/Caskroom/visual-studio-code:
	brew cask install visual-studio-code
~/com.googlecode.iterm2.plist:
	curl https://raw.githubusercontent.com/py4ds/setup/master/macos/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist

.PHONY: brew omz pl9k zauto zsynt
