# This repo contains my setup files for Mac (local) and Linux (remote).

# Installation
### `curl -fsSL https://raw.githubusercontent.com/mskar/setup/master/scripts/setup.sh | /bin/bash`
## or
### `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mskar/setup/master/scripts/setup.sh)"`

## This README is a symlink to the [setup.sh](scripts/setup.sh) script in the [scripts](scripts) directory.

# Why Mac?
## MacOS
### MacOS is UNIX-based, unlike Windows, though Windows Subsystem for Linux (WSL) is a really big step forward.
#### The best option would be to install Linux on a Mac and configure the modifier keys (Cmd/Alt/Ctrl) to work like in MacOS, but who has time for that?
## Modifier keys
### The Command key is used for MacOS keyboard shortcuts, limiting conflicts with Unix shortcuts that use Alt/Option or Control.
## Longevity
### Macs are built to last. I am writing this in 2020 on a 2014 MacBook Air. No PC has ever lasted this long in my experience.

# Mac System Preferences

### For tons of MacOS setup examples, click the link below
#### https://github.com/joeyhoer/starter/tree/master/system

## Keyboard
### https://apple.stackexchange.com/a/83923
### In System Preferences > Keyboard > Keyboard:
#### Key Repeat: Fast
defaults write -g KeyRepeat -int 1

#### Delay Until Repeat: Short
defaults write -g InitialKeyRepeat -int 10

#### Repeatedly engage a key when held (no need to press multiple times)
defaults write -g ApplePressAndHoldEnabled -bool false

## Trackpad
### In System Preferences > Trackpad > Point & Click, set tracking speed to max:
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

### and select Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

## Dock
### Remove most icons from Dock
defaults write com.apple.dock persistent-apps -array

### 2-finger click on Dock and Turn Dock Hiding On
defaults write com.apple.dock autohide -bool true

### https://www.defaults-write.com/delete-the-hiding-dock-delay-in-os-x/
defaults write com.apple.Dock autohide-delay -float 0

## Sound
### Under General > Sound turn off all sounds

#### Disable user interface sound effects
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool false

#### Disable feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

#### Disable flashing the screen when an alert sound occurs (accessibility)
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

### Under General > Sound "Show volume in menu bar"
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/Displays.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu"

## Menu bar
### Under General > Appearance select 'Automatically hide and show the menu bar'
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Brew - commandline package manager
## Install Homebrew (this also installs xcode tools needed for git)
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Zsh config
curl https://raw.githubusercontent.com/mskar/setup/master/.zshrc -o ~/.zshrc

# powerlevel10k config
curl https://raw.githubusercontent.com/mskar/setup/master/.p10k.zsh -o ~/.p10k.zsh

# git
## config
curl https://raw.githubusercontent.com/mskar/setup/master/.gitconfig -o ~/.gitconfig

## Regular expressions for diffs
### https://tekin.co.uk/2020/10/better-git-diff-output-for-ruby-python-elixir-and-more
### https://gist.github.com/tekin/12500956bd56784728e490d8cef9cb81
curl https://gist.githubusercontent.com/tekin/12500956bd56784728e490d8cef9cb81/raw/e474af61231687b0e1a4ec59d4becd97537ef6c0/.gitattributes -o ~/.gitattributes

## automatically ignored files
# git config, ignore, and attributes
curl https://raw.githubusercontent.com/mskar/setup/master/.gitignore -o ~/.gitignore

# Font and Applications
## Install Karabiner-Elements with brew cask (below) or from homepage dmg https://pqrs.org/osx/karabiner/
## Install Fira Code Nerdfont and .app programs
## Install r (so that the rmarkdown render alias and Nvim-R work in base environment)
### Use brew cask install r: https://rstats.wtf/set-up-an-r-dev-environment.html#what-about-homebrew
brew install --cask alfred alt-tab amethyst homebrew/cask-fonts/font-fira-code-nerd-font firefox copyq google-chrome iterm2 jetbrains-toolbox karabiner-elements r vimr visual-studio-code

# Vimac
## Download, unzip, and move Vimac.app to Applications
### https://install.appcenter.ms/users/dexterleng/apps/vimac/distribution_groups/sparkle

# Permissions
## Grant permissions to Amethyst, CopyQ, altTab, Vimac, VimR and Alfred

# App shortcuts
## Enable launch on login for Amethyst, CopyQ, altTab, and Vimac
## Set VimR to be the default txt file editor
## Load copyq.ini and copyq.cpq

## Set up mac terminal
### In terminal, under Profiles > Text: Select Fura Code Nerdfont size 18
### In terminal, under Profiles > Advanced: Deselect audible bell

## Set up iterm2
curl https://raw.githubusercontent.com/mskar/setup/master/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
## In iterm2, select General > Preferences: Select load preferences from a local folder or URL
## In iterm2, select Appearance > Theme: Minimal
## In iterm2, select Profiles > Keys: Both option keys to Esc+
## In iterm2, select Profiles > Terminal, Under Notifications, Silence bell
## In iterm2, select Fura Code Nerdfont size 18 in Profiles > Text > Change Font and check Use Ligatures

## Set up karabiner
curl https://raw.githubusercontent.com/mskar/setup/master/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
#### Under Complex modifications > Rules you should see
##### Change caps_lock to control if pressed with other keys, to escape if pressed alone. (from Change caps_lock key (rev 4))
##### Change return to control if pressed with other keys, to return if pressed alone (from Change return to control)
##### Change right_command+hjkl to arrow keys (from Examples)
##### Bash style Emacs key bindings (rev 2) (from Emacs key bindings (rev 12))
##### Emacs key bindings [option+keys] (rev 5) (from Emacs key bindings (rev 12))

## Set up Visual Studio Code
curl https://raw.githubusercontent.com/mskar/setup/master/settings.json -o ~/Library/Application\ Support/Code/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/keybindings.json -o ~/Library/Application\ Support/Code/User/keybindings.json

code --install-extension ms-python.python --force

code --install-extension ms-python.vscode-pylance --force

code --install-extension ms-vsliveshare.vsliveshare --force

code --install-extension vscodevim.vim --force

code --install-extension tabnine.tabnine-vscode --force

# Shell programs needed for aliases
## Install fzf (fuzzy finder)
## Install bat and exa (for fzf file preview)
## Install fasd and fd (to provide inputs for fzf)
## Install xpdf (e.g. pdftotext - for fzf PDF file preview)
## Install vim and neovim
brew install ag bash bat clementtsang/bottom/bottom coreutils git-delta exa fasd fd ffmpeg fzf gh neovim node noti pandoc pass poppler rename rg rga sc-im tesseract tldr tmux vim zsh-autosuggestions zsh-syntax-highlighting romkatv/powerlevel10k/powerlevel10k

## Create locations for undo files (just in case they are not created automatically)
mkdir -p ~/.vim/undodir
mkdir -p ~/.local/share/nvim/undo

## Install fzf key bindings and fuzzy completion using the install script which runs the commented out code below
### source /usr/local/opt/fzf/shell/key-bindings.zsh
### source /usr/local/opt/fzf/shell/key-bindings.bash
### source /usr/local/opt/fzf/shell/completion.zsh
### source /usr/local/opt/fzf/shell/completion.bash
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-fish --no-update-rc

# Use Bash as a backup
curl https://raw.githubusercontent.com/mskar/setup/master/.bash_profile -o ~/.bash_profile

curl https://raw.githubusercontent.com/mskar/setup/master/.inputrc -o ~/.inputrc

## Download dotfiles (configuration files)
### Vim
curl https://raw.githubusercontent.com/mskar/setup/master/.vimrc -o ~/.vim/.vimrc

### Vim snippets
curl https://raw.githubusercontent.com/mskar/setup/master/all.snippets -o ~/.config/coc/ultisnips/all.snippets --create-dirs

### Neovim
curl https://raw.githubusercontent.com/mskar/setup/master/init.vim -o ~/.config/nvim/init.vim --create-dirs

curl https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/R/tmux_split.vim -o ~/tmux_split.vim

### Neovim GUIs
curl https://raw.githubusercontent.com/mskar/setup/master/ginit.vim -o ~/.config/nvim/ginit.vim --create-dirs

### COC (Conqueror Of Completion)
curl https://raw.githubusercontent.com/mskar/setup/master/coc-settings.json -o ~/.config/nvim/coc-settings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/coc-settings.json -o ~/.vim/coc-settings.json --create-dirs

### JetBrains IDEs
curl https://raw.githubusercontent.com/mskar/setup/master/.ideavimrc -o ~/.ideavimrc

## Set up oh my tmux
curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf

curl https://raw.githubusercontent.com/mskar/setup/master/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Set up ipython
curl https://raw.githubusercontent.com/mskar/setup/master/ipython_config.py -o ~/.ipython/profile_default/ipython_config.py --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/keybindings.py -o ~/.ipython/profile_default/startup/keybindings.py --create-dirs

## Set up ptpython
curl https://raw.githubusercontent.com/mskar/setup/master/config.py -o ~/Library/Application\ Support/ptpython/config.py --create-dirs

## Set up radian
curl https://raw.githubusercontent.com/mskar/setup/master/.radian_profile -o ~/.radian_profile
ln -sf .radian_profile radian_profile.R

# Python and R

## Install miniconda Python
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh

bash ~/miniconda.sh -bp $HOME/miniconda

## Install nodejs (for coc.vim) and python packages (for nvim-R and ncm-R):
### https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1953
~/miniconda/bin/conda install -yc conda-forge cookiecutter neovim

python -m pip install git+https://github.com/mskar/radian git+https://github.com/mskar/ipython git+https://github.com/mskar/ptpython jupyter

## Jupyter

#### I don't use jupyterlab-git extension, I only demo it in classes
##### jupyter labextension install @jupyterlab/git
##### jupyter serverextension enable --py jupyterlab_git

~/miniconda/bin/conda create -yc conda-forge -n py python=3.8 joblib jupyterlab seaborn numpy pandas scikit-learn scipy

##### jupyter labextension install jupyterlab_vim

## Set up jupyterlab-github extension
#### jupyter labextension install @jupyterlab/github
#### pip install jupyterlab_github
##### Provide access token to GitHub extension
##### https://github.com/jupyterlab/jupyterlab-github#2-getting-your-credentials-from-github

### Jupyter settings
curl https://raw.githubusercontent.com/mskar/setup/master/shortcuts.jupyterlab-settings -o ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings
--create-dirs

## Setup PyCharm
### Sync settings from https://github.com/marskar/PyCharm
### Under File > Settings Repository..., select Overwrite Local
### Settings
### Select MacOS X 10.5+ Keymap and make the following changes:
#### - Editor Actions > Decrease Font Size : `Cmd -`
#### - Editor Actions > Focus Editor : `Shift Escape`
#### - Editor Actions > Increase Font Size : `Cmd +`
#### - Editor Actions > Reset Font Size : `Cmd 0`
#### - Editor Actions > Split Line :
#### - Main Menu > File > Save As...: `Cmd Shift S`
#### - Main Menu > Tool Windows > Commit :
#### - Main Menu > Edit > Undo : `Ctrl -`
#### - Main Menu > Edit > Redo : `Ctrl =`
#### - Main Menu > Edit > Paste : `Ctrl y`
#### - Main Menu > Edit > Delete : `Ctrl d`
#### - Main Menu > View > Recent Location : `Ctrl Shift e`
#### - Main Menu > Edit > Paste from History : `Ctrl Shift v`
#### - Main Menu > Help > Find Action... : `Cmd Shift p`
#### - Main Menu > Code > Code Completion > Basic : `Ctrl Shift Space`
#### - Editor Actions > Backspace : `Ctrl h`
#### - Editor Actions > Cut Line Backward : `Ctrl u`
#### - Editor Actions > Cut up to Line End : `Ctrl k`
#### - Editor Actions > Cut to Word Start : `Ctrl w` `Alt h`
#### - Editor Actions > Cut to Word End : `Ctrl d`
#### - Editor Actions > Move Caret to Previous Word : `Alt b`
#### - Editor Actions > Move Caret to Next Word : `Alt f`
#### - Other > Images > Actual Size : `Cmd 0`
#### - Other > Images > Zoom In : `Cmd +`
#### - Other > Images > Zoom Out : `Cmd -`
#### - Plug-ins > Git > Checkout Revision : `Enter`
#### - Plug-ins > Git > Checkout Selected : `Enter`
#### - Plug-ins > Python > Split Cell : `Ctrl Shift -`
#### - Plug-ins > Python > Execute Selection in Python Console: `Cmd Enter`
#### - Plug-ins > Terminal > Shift Focus To Editor : `Shift+Escape`
### In Appearance & Behavior > Appearance, Select Darcula theme and select Fura Code Nerd Font size 14
### Using `Cmd Shift A` or going to View > Appearance at the Top, enable Details in Tree Views, disable Tool Windows Bars and Navigation Bar
### In MacOS System Preferences: Keyboard > Shortcuts > Services, uncheck Open man Page in Terminal (`Cmd Shift M`) and Search man Page Index in Terminal (`Cmd Shift A`)
### In MacOS System Preferences: Keyboard > Shortcuts > Keyboard, uncheck Turn keyboard access on and off after making sure all of the other shortcuts are enabled
### In MacOS System Preferences: Keyboard > Shortcuts > Keyboard, change ctrl function shortcuts to ctrl num shortcuts:
#### - `Ctrl F2` -> `Ctrl 2` (Move focus to the menu bar)
#### - `Ctrl F3` -> `Ctrl 3` (Move focus to the Dock)
#### - `Ctrl F4` -> `Ctrl 4` (Move focus to active or next window)
#### - `Ctrl F5` -> `Ctrl 5` (Move focus to the window toolbar)
#### - `Ctrl F6` -> `Ctrl 6` (Move focus to the floating window)
#### - `Ctrl F7` -> `Ctrl 7` (Change the way Tab moves focus)
#### - `Ctrl F8` -> `Ctrl 8` (Move focus to status menus)
### In Editor > Font, select Fura Code Nerd Font size 16 as main and Jetbrains Mono as fallback and Enable font ligatures
### In Editor > Code Style, set visual guides to 80 characters
### Check Change font size (Zoom) with Command+Mouse Wheel in Editor > General
### Check Show Whitespace in Editor > General > Appearance
### If you use the Deep Ocean Editor theme from the [Material UI](https://www.material-theme.com/) plugin, change docstring (Doc comment > Text) color to [`4cbb17` aka kelly green](https://www.beautycolorcode.com/4cbb17) and line comment color to [`DF00FF` aka psychedelic purple](https://www.beautycolorcode.com/df00ff) under Editor > Color Scheme > Python and Editor > Color Scheme > Language Defaults, respectively
### In Build, Execution, Deployment > Console, select Use existing console for "Run with Python Console"
### Disable Material UI to got back to Darcula theme, but keep Code Editor theme as Deep Ocean
#### Editor > Color Scheme : Material Deep Ocean
#### Appearance and Behavior > Appearance > Theme : Darcula
### In Editor > General > Editor Tabs, Select None for Tab placement (current file is shown at the top)
### Install [IdeaVim](https://github.com/JetBrains/ideavim) plugin
### Install [BashSupport](https://plugins.jetbrains.com/plugin/4230-bashsupport) plugin
### Install [Markdown](https://plugins.jetbrains.com/plugin/7793-markdown/) plugin
### Install [R Language Support](http://holgerbrandl.github.io/r4intellij/) plugin
### Fix shortcut conflicts under Preferences > Vim emulation: `Ctrl i/j/m/t` to IDE
### When setting run configurations (`Ctrl Alt r`), set working directory to project root under Environment and deselect Run with Python Console under Execution

## Install RStudio (this also installs `r-essentials`; RStudio was working for me as part of Anaconda 5.2.0)
##### Installing r into base environment breaks nvim-R
~/miniconda/bin/conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse r-languageserver python

curl https://raw.githubusercontent.com/mskar/setup/master/rstudio-prefs.json -o ~/.config/rstudio/rstudio-prefs.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/editor_bindings.json -o ~/.config/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/master/rstudio_bindings.json -o ~/.config/rstudio/keybindings/rstudio_bindings.json --create-dirs

### Install and symlink macvim (brew installed macvim conflicts with brew installed vim)
##### ln -s /usr/local/Cellar/macvim/**/MacVim.app/ /Applications/MacVim.app
~/miniconda/bin/conda init zsh
