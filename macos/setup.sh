# This repo contains my setup files for Mac, Linux, Windows.
## This README is a symlink to the [setup.sh](macos/setup.sh) script in the [macos](macos) directory.
#### Look in the [windows](windows) folder, to see my setup for Windows Subsystem for Linux (WSL), Windows Terminal, and AutoHotkey.
#### Look in the [linux](linux) directory, to see my everything related to linux (including WSL).
# Why Mac?
## MacOS
### MacOS is UNIX-based, unlike Windows, though WSL is a really big step forward.
#### The best option would be to install Linux on a Mac and configure the modifier keys (Cmd/Alt/Ctrl) to work like in MacOS, but who has time for that?
## Modifier keys
### The Command key is used for MacOS keyboard shortcuts, limiting conflicts with Unix shortcuts that use Alt/Option or Control.
## Longevity
### Macs are built to last. I am writing this in 2020 on a 2014 MacBook Air. No PC has ever lasted this long in my experience.

# Mac System Preferences
## In System Preferences > Keyboard > Keyboard:
### Key Repeat: Fast
### Delay Until Repeat: Short
### Caps Lock Key: Escape
## Remove most icons from Dock
## Drag and Drop Documents from Finder to the Dock in between Applications and Download
## 2-finger click on Dock and Turn Dock Hiding On
## Add Home to Finder sidebar
## Under General > Appearance select 'Use Dark menu bar and Dock' and 'Automatically hide and show the menu bar'

# Brew - commandline package manager
## Install Homebrew (this also installs xcode tools needed for git)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install oh-my-zsh et al.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### When prompted to change shell, enter Y

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

curl https://raw.githubusercontent.com/py4ds/setup/master/macos/.zshrc -o ~/.zshrc

curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

# Font and Applications
## Install Karabiner-Elements with brew cask (below) or from homepage dmg https://pqrs.org/osx/karabiner/
## Install Fira Code Nerdfont and .app programs
brew cask install homebrew/cask-fonts/font-firacode-nerd-font flycut iterm2 karabiner-elements shiftit visual-studio-code jetbrains-toolbox

## Set up mac terminal
### In terminal, under Profiles > Text: Set background to black, set text to white, and select Fura Code Nerdfont size 18

## Set up iterm2
curl https://raw.githubusercontent.com/py4ds/setup/master/macos/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
## In iterm2, select General > Preferences: Select load preferences from a local folder or URL
## In iterm2, select Appearance > Theme: Minimal
## In iterm2, select Profiles > Keys: Both option keys to Esc+
## In iterm2, select Profiles > Terminal, Under Notifications, Silence bell
## In iterm2, select Fura Code Nerdfont size 18 in Profiles > Text > Change Font and check Use Ligatures

## Set up karabiner
curl https://raw.githubusercontent.com/py4ds/setup/master/macos/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
#### Under Complex modifications > Rules you should see
##### Change caps_lock to control if pressed with other keys, to escape if pressed alone. (from Change caps_lock key (rev 4))
##### Change right_command+hjkl to arrow keys (from Examples)
##### Bash style Emacs key bindings (rev 2) (from Emacs key bindings (rev 12))
##### Emacs key bindings [option+keys] (rev 5) (from Emacs key bindings (rev 12))

## Set up Visual Studio Code
curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/settings.json -o ~/Library/ApplicationSupport/Code/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/keybindings.json -o ~/Library/ApplicationSupport/Code/User/keybindings.json

code --install-extension ms-python.python

##### code --install-extension ms-vsliveshare.vsliveshare

code --install-extension vscodevim.vim

# Shell programs needed for aliases
## Install fzf (fuzzy finder)
## Install bat and exa (for fzf file preview)
## Install fasd and fd (to provide inputs for fzf)
## Install r (so that the rmarkdown render alias and Nvim-R work in base environment)
## Install xpdf (e.g. pdftotext - for fzf PDF file preview)
## Install vim and neovim
brew install bat exa fasd fd fzf hub neovim r sc-im tmux vim xpdf
## Install fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install
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

### Install and symlink macvim (brew installed macvim conflicts with brew installed vim)
##### ln -s /usr/local/Cellar/macvim/**/MacVim.app/ /Applications/MacVim.app
conda init zsh
