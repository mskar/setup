sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew cask install homebrew/cask-fonts/font-firacode-nerd-font

brew cask install flycut

brew cask install iterm2

brew cask install jetbrains-toolbox

brew cask install karabiner-elements

brew cask install r

brew cask install shiftit

brew cask install visual-studio-code

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.zshrc -o ~/.zshrc

curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/settings.json -o ~/Library/ApplicationSupport/Code/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/keybindings.json -o ~/Library/ApplicationSupport/Code/User/keybindings.json

code --install-extension ms-python.python --force

code --install-extension ms-vsliveshare.vsliveshare --force

code --install-extension vscodevim.vim --force

brew install bash bat exa fasd fd fzf hub neovim sc-im tmux vim xpdf

$(brew --prefix)/opt/fzf/install --no-bash --no-fish --key-bindings --completion --update-rc

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.bash_profile -o ~/.bash_profile

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.inputrc -o ~/.inputrc

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.map -o ~/.vimrc.map

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.plug -o ~/.vimrc.plug

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.set -o ~/.vimrc.set

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_init.vim -o ~/.config/nvim/init.vim --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/map.vim -o ~/.config/nvim/map.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/plug.vim -o ~/.config/nvim/plug.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/set.vim -o ~/.config/nvim/set.vim

git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/ideavim/.ideavimrc -o ~/.ideavimrc

git clone https://github.com/gpakosz/.tmux ~/.tmux

cd

ln -s -f ~/.tmux/.tmux.conf

cp ~/.tmux/.tmux.conf.local ~

curl https://raw.githubusercontent.com/py4ds/setup/master/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh

bash ~/miniconda.sh -bp $HOME/miniconda

conda install -yc conda-forge cookiecutter nodejs neovim pybtex

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/user-settings -o ~/.rstudio-desktop/monitored/user-settings/user-settings --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/editor_bindings.json -o ~/.R/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/rstudio_bindings.json -o ~/.R/rstudio/keybindings/rstudio_bindings.json

conda init zsh
