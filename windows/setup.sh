# This repo contains my setup files for Mac, Linux, Windows.
## This README is a symlink to the [setup.sh](windows/setup.sh) script in the [windows](windows) directory.
#### The [windows](windows) folder also contains my setup for Windows Subsystem for Linux (WSL), Windows Terminal, and AutoHotkey.
#### The setup files for WSL should also work for Ubuntu/Debian Linux distributions.
# Why Windows?
### Windows is the most common format

# Windows stuff
## Enable WSL in Windows Features or in PowerShell
## Enable clipboard
## Clean up taskbar

## Install oh-my-zsh et al.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### When prompted to change shell, enter Y

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.zshrc -o ~/.zshrc

curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

## Set up Visual Studio Code
curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/settings.json -o ~/Library/ApplicationSupport/Code/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/keybindings.json -o ~/Library/ApplicationSupport/Code/User/keybindings.json

code --install-extension ms-python.python

code --install-extension ms-vsliveshare.vsliveshare

code --install-extension vscodevim.vim

# Shell programs needed for aliases
## Install fzf (fuzzy finder)
## Install bat and exa (for fzf file preview)
## Install fasd and fd (to provide inputs for fzf)
## Install r (so that the rmarkdown render alias and Nvim-R work in base environment)
## Install xpdf (e.g. pdftotext - for fzf PDF file preview)
## Install vim and neovim
apt install bat exa fasd fd fzf hub neovim r sc-im tmux vim xpdf
## Install fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install --no-bash --no-fish --key-bindings --completion --update-rc
## Download dotfiles (configuration files)
### Vim
curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local -o ~/.vimrc.local

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local.bundles -o ~/.vimrc.local.bundles

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc

### Neovim
curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_init.vim -o ~/.config/nvim/local_init.vim --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_bundles.vim -o ~/.config/nvim/local_bundles.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/init.vim -o ~/.config/nvim/init.vim

### SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

### JetBrains IDEs
curl https://raw.githubusercontent.com/py4ds/setup/master/.ideavimrc -o ~/.ideavimrc

## Set up oh my tmux
git clone https://github.com/gpakosz/.tmux ~/.tmux

cd

ln -s -f ~/.tmux/.tmux.conf

cp ~/.tmux/.tmux.conf.local ~

curl https://raw.githubusercontent.com/py4ds/setup/master/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Python and R

## Install miniconda Python
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh

bash ~/miniconda.sh -bp $HOME/miniconda

## Install nodejs (for coc.vim) and python packages (for nvim-R and ncm-R):
### https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1953
conda install -yc conda-forge nodejs neovim pybtex

#### I don't use jupyterlab-git extension, I only demo it in classes
##### jupyter labextension install @jupyterlab/git
##### jupyter serverextension enable --py jupyterlab_git

conda create -yc conda-forge -n py python=3.8 joblib jupyterlab matplotlib numpy pandas scikit-learn scipy

##### jupyter labextension install jupyterlab_vim

## Set up jupyterlab-github extension
#### jupyter labextension install @jupyterlab/github
#### pip install jupyterlab_github
##### Provide access token to GitHub extension
##### https://github.com/jupyterlab/jupyterlab-github#2-getting-your-credentials-from-github


## Setup PyCharm
### Sync settings from https://github.com/marskar/PyCharm
### Under File > Settings Repository..., select Overwrite Local
### Settings
### Select MacOS X 10.5+ Keymap and add Hide All Tool Windows shortcut: Cmd+0 and Save As...: Cmd+Shift+S
### In Appearance & Behavior > Appearance, Use Dark Window headers and select Fura Code Nerd Font size 18
### In Editor > Font, select Fura Code Nerd Font size 18 and Enable font ligatures
### Check Change font size (Zoom) with Command+Mouse Wheel in Editor > General
### Check Show Whitespace in Editor > General > Appearance
### If you use the Deep Ocean Editor theme from the [Material UI](https://www.material-theme.com/) plugin, change docstring color to [`30B000`](https://www.beautycolorcode.com/30b000)
### Install [IdeaVim](https://github.com/JetBrains/ideavim) plugin
### Install [BashSupport](https://plugins.jetbrains.com/plugin/4230-bashsupport) plugin
### Install [Markdown](https://plugins.jetbrains.com/plugin/7793-markdown/) plugin
### Install [R Language Support](http://holgerbrandl.github.io/r4intellij/) plugin
### Fix shortcut conflicts under Preferences > Vim emulation: Ctrl+G/M to IDE

## Install RStudio (this also installs `r-essentials`; RStudio was working for me as part of Anaconda 5.2.0)
##### Installing r into base environment breaks nvim-R
conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/user-settings -o ~/.rstudio-desktop/monitored/user-settings/user-settings --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/editor_bindings.json -o ~/.R/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/rstudio_bindings.json -o ~/.R/rstudio/keybindings/rstudio_bindings.json

conda init zsh
