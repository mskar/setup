# This repo contains my setup files for Mac, Linux, Windows.
## This README is a symlink to the [setup.sh](macos/setup.sh) script in the [macos](macos) directory.
#### Look in the [windows](windows) folder, to see my setup for Windows Subsystem for Linux (WSL), Windows Terminal, and AutoHotkey (eventually to be replaced by the [KSM](https://windowsreport.com/powertoys-key-remapper/) [PowerToy](https://github.com/microsoft/PowerToys)).
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
## 2-finger click on Dock and Turn Dock Hiding On
## Under General > Sound turn off all sounds and "Show volume in menu bar"
## Add Home to Finder sidebar
## Under General > Appearance select 'Use Dark menu bar and Dock' and 'Automatically hide and show the menu bar'

# Brew - commandline package manager
## Install Homebrew (this also installs xcode tools needed for git)
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Zsh config
curl https://raw.githubusercontent.com/mskar/setup/master/macos/.zshrc -o ~/.zshrc

# powerlevel10k config
curl https://raw.githubusercontent.com/mskar/setup/master/macos/.p10k.zsh -o ~/.p10k.zsh

# git config
curl https://raw.githubusercontent.com/mskar/setup/master/.gitconfig -o ~/.gitconfig

# Font and Applications
## Install Karabiner-Elements with brew cask (below) or from homepage dmg https://pqrs.org/osx/karabiner/
## Install Fira Code Nerdfont and .app programs
## Install r (so that the rmarkdown render alias and Nvim-R work in base environment)
### Use brew cask install r: https://rstats.wtf/set-up-an-r-dev-environment.html#what-about-homebrew
brew cask install homebrew/cask-fonts/font-fira-code-nerd-font firefox flycut google-chrome iterm2 jetbrains-toolbox karabiner-elements r shiftit visual-studio-code

## Set up mac terminal
### In terminal, under Profiles > Text: Select Fura Code Nerdfont size 18
### In terminal, under Profiles > Advanced: Deselect audible bell

## Set up iterm2
curl https://raw.githubusercontent.com/mskar/setup/master/macos/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
## In iterm2, select General > Preferences: Select load preferences from a local folder or URL
## In iterm2, select Appearance > Theme: Minimal
## In iterm2, select Profiles > Keys: Both option keys to Esc+
## In iterm2, select Profiles > Terminal, Under Notifications, Silence bell
## In iterm2, select Fura Code Nerdfont size 18 in Profiles > Text > Change Font and check Use Ligatures

## Set up karabiner
curl https://raw.githubusercontent.com/mskar/setup/master/macos/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
#### Under Complex modifications > Rules you should see
##### Change caps_lock to control if pressed with other keys, to escape if pressed alone. (from Change caps_lock key (rev 4))
##### Change right_command+hjkl to arrow keys (from Examples)
##### Bash style Emacs key bindings (rev 2) (from Emacs key bindings (rev 12))
##### Emacs key bindings [option+keys] (rev 5) (from Emacs key bindings (rev 12))

## Set up Visual Studio Code
curl https://raw.githubusercontent.com/mskar/setup/master/vscode/settings.json -o ~/Library/Application\ Support/Code/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/vscode/keybindings.json -o ~/Library/Application\ Support/Code/User/keybindings.json

code --install-extension ms-python.python --force

code --install-extension ms-vsliveshare.vsliveshare --force

code --install-extension vscodevim.vim --force

# Shell programs needed for aliases
## Install fzf (fuzzy finder)
## Install bat and exa (for fzf file preview)
## Install fasd and fd (to provide inputs for fzf)
## Install xpdf (e.g. pdftotext - for fzf PDF file preview)
## Install vim and neovim
brew install bash bat exa fasd fd fzf gh neovim sc-im tmux vim xpdf zsh-autosuggestions zsh-syntax-highlighting romkatv/powerlevel10k/powerlevel10k

## Install fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install --no-fish --completion --no-key-bindings --no-update-rc

# Use Bash as a backup
curl https://raw.githubusercontent.com/mskar/setup/master/macos/.bash_profile -o ~/.bash_profile

curl https://raw.githubusercontent.com/mskar/setup/master/macos/.inputrc -o ~/.inputrc

## Download dotfiles (configuration files)
### Vim
curl https://raw.githubusercontent.com/mskar/setup/master/vim/.vimrc -o ~/.vimrc

curl https://raw.githubusercontent.com/mskar/setup/master/vim/.au.vimrc -o ~/.au.vimrc

curl https://raw.githubusercontent.com/mskar/setup/master/vim/.map.vimrc -o ~/.map.vimrc

curl https://raw.githubusercontent.com/mskar/setup/master/vim/.plug.vimrc -o ~/.plug.vimrc

curl https://raw.githubusercontent.com/mskar/setup/master/vim/.set.vimrc -o ~/.set.vimrc

### Neovim
curl https://raw.githubusercontent.com/mskar/setup/master/neovim/local_init.vim -o ~/.config/nvim/init.vim --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/neovim/au.vim -o ~/.config/nvim/au.vim

curl https://raw.githubusercontent.com/mskar/setup/master/neovim/map.vim -o ~/.config/nvim/map.vim

curl https://raw.githubusercontent.com/mskar/setup/master/neovim/plug.vim -o ~/.config/nvim/plug.vim

curl https://raw.githubusercontent.com/mskar/setup/master/neovim/set.vim -o ~/.config/nvim/set.vim

### SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/mskar/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

### JetBrains IDEs
curl https://raw.githubusercontent.com/mskar/setup/master/ideavim/.ideavimrc -o ~/.ideavimrc

## Set up oh my tmux
curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf

curl https://raw.githubusercontent.com/mskar/setup/master/macos/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Set up ipython
curl https://raw.githubusercontent.com/mskar/setup/master/ipython/ipython_config.py -o ~/.ipython/profile_default/ipython_config.py

curl https://raw.githubusercontent.com/mskar/setup/master/ipython/keybindings.py -o ~/.ipython/profile_default/startup/keybindings.py

# Python and R

## Install miniconda Python
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh

bash ~/miniconda.sh -bp $HOME/miniconda

## Install glances (alternative to top) into base env
pip install glances

## Install nodejs (for coc.vim) and python packages (for nvim-R and ncm-R):
### https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1953
conda install -yc conda-forge cookiecutter nodejs neovim pybtex

#### I don't use jupyterlab-git extension, I only demo it in classes
##### jupyter labextension install @jupyterlab/git
##### jupyter serverextension enable --py jupyterlab_git

conda create -yc conda-forge -n py python=3.8 joblib jupyterlab seaborn numpy pandas scikit-learn scipy

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
### Select MacOS X 10.5+ Keymap and make the following changes:
#### - Execute Selection in Python Console: Cmd+Enter
#### - Editor Actions > Split Line :
#### - Editor Actions > Decrease Font Size : Cmd+-
#### - Editor Actions > Increase Font Size : Cmd++
#### - Editor Actions > Reset Font Size : Cmd+0
#### - Main Menu > File > Save As...: Cmd+Shift+S
#### - Main Menu > Scientific Notebook > Edit Cells > Split Cell : Ctrl+Shift+-
#### - Main Menu > Scientific Notebook > Edit Cells > Split Cell : Ctrl+Shift+-
#### - Other > Images > Zoom Out : Cmd+-
#### - Other > Images > Zoom In : Cmd++
#### - Other > Images > Actual Size : Cmd+0
### In Appearance & Behavior > Appearance, Select Darcula theme and select Fura Code Nerd Font size 14
### Using Cmd+Shift+A or going to View > Appearance at the Top, enable Details in Tree Views, disable Tool Windows Bars and Navigation Bar
### In MacOS System Preferences: Keyboard > Services, uncheck Open man Page in Terminal (Cmd+Shift+M) and Search man Page Index in Terminal (Cmd+Shift+A)
### In Editor > Font, select Fura Code Nerd Font size 16 as main and Jetbrains Mono as fallback and Enable font ligatures
### In Editor > Code Style, set visual guides to 80 characters
### Check Change font size (Zoom) with Command+Mouse Wheel in Editor > General
### Check Show Whitespace in Editor > General > Appearance
### If you use the Deep Ocean Editor theme from the [Material UI](https://www.material-theme.com/) plugin, change docstring (Doc comment > Text) color to [`4cbb17` aka kelly green](https://www.beautycolorcode.com/4cbb17) and line comment color to [`DF00FF` aka psychedelic purple](https://www.beautycolorcode.com/df00ff) under Editor > Color Scheme > Language Defaults
### In Build, Execution, Deployment > Console, select Use existing console for "Run with Python Console"
### Disable Material UI to got back to Darcula theme, but keep Code Editor theme as Deep Ocean
#### Editor > Color Scheme : Material Deep Ocean
#### Appearance and Behavior > Appearance > Theme : Darcula
### In Editor > General > Editor Tabs, Select None for Tab placement (current file is shown at the top)
### Install [IdeaVim](https://github.com/JetBrains/ideavim) plugin
### Install [BashSupport](https://plugins.jetbrains.com/plugin/4230-bashsupport) plugin
### Install [Markdown](https://plugins.jetbrains.com/plugin/7793-markdown/) plugin
### Install [R Language Support](http://holgerbrandl.github.io/r4intellij/) plugin
### Fix shortcut conflicts under Preferences > Vim emulation: Ctrl+J/G/M/I/T to IDE
### When setting run configurations (ctrl+alt+r), set working directory to project root under Environment and deselect Run with Python Console under Execution

## Install RStudio (this also installs `r-essentials`; RStudio was working for me as part of Anaconda 5.2.0)
##### Installing r into base environment breaks nvim-R
conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse

curl https://raw.githubusercontent.com/mskar/setup/master/rstudio/rstudio-prefs.json -o ~/.config/rstudio/rstudio-prefs.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/rstudio/editor_bindings.json -o ~/.config/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/rstudio/rstudio_bindings.json -o ~/.config/rstudio/keybindings/rstudio_bindings.json

### Install and symlink macvim (brew installed macvim conflicts with brew installed vim)
##### ln -s /usr/local/Cellar/macvim/**/MacVim.app/ /Applications/MacVim.app
conda init zsh
