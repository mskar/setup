# Assumes git clone https://github.com/py4ds/setup ~/py4ds/setup
# zsh
cp ~/py4ds/setup/macos/.zshrc ~
# ideavim
cp ~/py4ds/setup/.ideavimrc ~
# iterm
cp ~/py4ds/setup/macos/com.googlecode.iterm2.plist ~
# vim
cp ~/py4ds/setup/vim/.vimrc* ~
# neovim
mkdir -p ~/.config/nvim/ && cp ~/py4ds/setup/neovim/*.vim ~/.config/nvim/
# karabiner
mkdir -p ~/.config/karabiner/ && cp ~/py4ds/setup/macos/karabiner.json ~/.config/karabiner/
# Rstudio
mkdir -p ~/.R/rstudio/keybindings && cp ~/py4ds/setup/rstudio/*.json ~/.R/rstudio/keybindings/
mkdir -p ~/.rstudio-desktop/monitored/ && cp ~/py4ds/setup/rstudio/user-settings ~/.rstudio-desktop/monitored/user-settings/
