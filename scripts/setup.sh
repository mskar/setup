# This repo contains my setup files for Mac (local) and Linux (remote).

# Installation
### `curl -fsSL https://raw.githubusercontent.com/mskar/setup/main/scripts/setup.sh | /bin/bash`
## or
### `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mskar/setup/main/scripts/setup.sh)"`

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

# 1: MacOS terminal and defaults
### Open MacOS terminal using Spotlight search (Cmd Space)

### Curl the `macos.terminal` file

curl https://raw.githubusercontent.com/mskar/setup/main/macos.terminal -o ~/macos.terminal

### Run the defaults commands below to setup MacOS

## Theme

### Toggle theme with ctrl option cmd t
defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true

## Keyboard
### https://apple.stackexchange.com/a/83923
### In System Preferences > Keyboard > Keyboard:
#### Key Repeat: Fast
defaults write -g KeyRepeat -int 1

#### Delay Until Repeat: Short
defaults write -g InitialKeyRepeat -int 20

#### Repeatedly engage a key when held (no need to press multiple times)
defaults write -g ApplePressAndHoldEnabled -bool false

#### https://github.com/VSCodeVim/Vim#mac
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code

defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider

defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium

#### Set Caps Locks to be control in System Preferences > Keyboard > Modifier Keys... (this is also done via Karabiner in karabiner.json)

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

### https://www.intego.com/mac-security-blog/unlock-the-macos-docks-hidden-secrets-in-terminal/
defaults write com.apple.dock static-only -bool true

### 2-finger click on Dock and Turn Dock Hiding On
defaults write com.apple.dock autohide -bool true

### https://www.defaults-write.com/delete-the-hiding-dock-delay-in-os-x/
defaults write com.apple.Dock autohide-delay -float 0

### https://macos-defaults.com/dock/autohide-time-modifier.html#set-to-0
defaults write com.apple.dock autohide-time-modifier -float 0

### https://macos-defaults.com/misc/enable-spring-load-actions-on-all-items.html#set-to-true
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

## Sound
### Under General > Sound turn off all sounds

#### Disable user interface sound effects
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool false

#### Disable feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

#### Disable flashing the screen when an alert sound occurs (accessibility)
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

### Under General > Sound "Show volume in menu bar" (doesn't work?)
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/Displays.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu"

## Finder

### Finder icons
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 3

### https://macos-defaults.com/finder/quitmenuitem.html#set-to-true
defaults write com.apple.finder QuitMenuItem -bool true

### https://macos-defaults.com/finder/fxenableextensionchangewarning.html#set-to-false
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Keyboard
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

### Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

### Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

### https://github.com/mathiasbynens/dotfiles/blob/main/.macos#L157
### Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

### Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

defaults write NSGlobalDomain InitialKeyRepeat -int 20

### https://github.com/mathiasbynens/dotfiles/blob/main/.macos#L102
### Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

### Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

### Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

### Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

### Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

## Menu bar
### Under General > Appearance select 'Automatically hide and show the menu bar'
defaults write NSGlobalDomain _HIHideMenuBar -bool true

## Reset Finder and Dock to see results of `defaults` commands
killall Finder

killall Dock

# 2: Default MacOS keybindings and keyboard layout

### The default macOS keyboard has so-called "dead keys". Some of these "dead keys"
### interfere with GNU emacs/readline shortcuts that should be available by default
### everywhere. To deal with this problem, I created a keyboard layout called
### undead. I also created a `DefaultKeyBinding.dict` that provides many GNU
### emacs/readline shortcuts.


#### Download keyboard layout and icon files `undead.keylayout` and `undead.icns` to `/Library/Keyboard Layouts/`
curl https://raw.githubusercontent.com/mskar/setup/main/undead.icns -o ~/Library/Keyboard\ Layouts/undead.icns

curl https://raw.githubusercontent.com/mskar/setup/main/undead.keylayout -o ~/Library/Keyboard\ Layouts/undead.layout

#### Download Default MacOS keybinding dictionary file `DefaultKeyBinding.dict` to `/Library/Keybindings/`

curl https://raw.githubusercontent.com/mskar/setup/main/DefaultKeyBinding.dict -o ~/Library/KeyBindings/DefaultKeyBinding.dict --create-dirs

### For additional keyboard setup, we need Karabiner, but to install Karabiner, let's use Homebrew.

# 3: Brew - commandline package manager
## Install Homebrew (this also installs xcode tools needed for git)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

git config --global user.email 13444106+mskar@users.noreply.github.com

curl https://raw.githubusercontent.com/mskar/setup/main/Brewfile -o ~/.Brewfile

brew bundle install --global

# 4: MacOS Applications
## Install Karabiner-Elements with brew cask (below) or from homepage dmg https://pqrs.org/osx/karabiner/
## Install Fira Code Nerdfont and .app programs
## Install r (so that the rmarkdown render alias and Nvim-R work in base environment)
### Use brew cask install r: https://rstats.wtf/set-up-an-r-dev-environment.html#what-about-homebrew

# Vimac
## Download, unzip, and move Vimac.app to Applications
### https://install.appcenter.ms/users/dexterleng/apps/vimac/distribution_groups/sparkle
## Set Vimac scroll mode shortcut to `Ctrl Shift S` (default: `Ctrl S`)
## Set Vimac hint mode shortcut to `Ctrl Shift Space` (default: `Ctrl Space`)
### Notes:
### `Cmd Shift Space` conflicts with vscode "trigger parameter hints"
### the equivalent shortcut in PyCharm, `Cmd P`, conflicts with vscode's quickOpen
### PyCharm uses `Cmd Shift O` for quick open files and `Cmd E` for recent files

# Permissions ## Grant permissions to CopyQ, altTab, Vimac, VimR and Alfred

# App shortcuts
## Enable launch on login for CopyQ, altTab, and Vimac
## Set VimR to be the default txt file editor
duti -s com.qvacua.VimR txt all

duti -s com.jetbrains.DataSpell ipynb all

# Hammerspoon
curl https://raw.githubusercontent.com/mskar/setup/main/init.lua -o ~/.hammerspoon/init.lua --create-dirs

## miro window manager spoon
### use `Alt Shift` as the modifier à la Amethyst
curl -L https://github.com/miromannino/miro-windows-manager/raw/master/MiroWindowsManager.spoon.zip | tar -xf - -C ~/.hammerspoon/Spoons

# CopyQ
## Load copyq.ini (commands) and copyq.cpq (configuration)

### Notes:
### Keyboard shortcuts:
### `Ctrl Alt C` summons the CopyQ window
### `Ctrl Alt D` pastes the today's ISO date
### `Ctrl Alt J` pastes and copies next
### `Ctrl Alt K` pastes and copies previous
### `Ctrl Alt S` show the CopyQ tray (mnemonic: show tray)
### `Ctrl Alt V` edits the clipboard (mnemonic: vim)
### `Ctrl Alt X` pastes as plain text (mnemonic: remove (x) formatting)

## Set up Mac terminal
### In terminal, under Profiles > Text: Select Fura Code Nerdfont size 18
### In terminal, under Profiles > Advanced: Deselect audible bell

## Set up iterm2
curl https://raw.githubusercontent.com/mskar/setup/main/iterm.json -o ~/iterm.json

## Load iterm.json, which includes the settings below
## In iterm2, select General > Preferences: Select load preferences from a local folder or URL
## In iterm2, select Appearance > Theme: Minimal
## In iterm2, select Profiles > Keys: Both option keys to Esc+
## In iterm2, select Profiles > Terminal > Notifications: Silence bell
## In iterm2, select Profiles > Text > Change Font: Fura Code Nerdfont size 18, Use Ligatures
## In iterm2, set Profiles > General > Command > Send text at start: tmux attach || tmux new \; split-window -v \; select-pane -t :.+
## In iterm2, set Keys > Key Bindings > Send hex code 0x11 ^;

## Set up karabiner
curl https://raw.githubusercontent.com/mskar/setup/main/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs

#### Under Complex modifications > Rules you should see
##### Change caps_lock to control if pressed with other keys, to escape if pressed alone. (from Change caps_lock key (rev 4))
##### Change return to control if pressed with other keys, to return if pressed alone (from Change return to control)
##### Bash style Emacs key bindings (rev 2) (from Emacs key bindings (rev 12))
##### Emacs key bindings [option+keys] (rev 5) (from Emacs key bindings (rev 12))

# 5: Command line tools
## Install fzf (fuzzy finder)
## Install bat and exa (for fzf file preview)
## Install fasd and fd (to provide inputs for fzf)
## Install xpdf (e.g. pdftotext - for fzf PDF file preview)
## Install vim and neovim

## Use terminal emacs in the terminal (overwrite link to GUI Emacs installed via cask)
brew link --overwrite emacs

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
curl https://raw.githubusercontent.com/mskar/setup/main/.bash_profile -o ~/.bash_profile

curl https://raw.githubusercontent.com/mskar/setup/main/.inputrc -o ~/.inputrc

## Download dotfiles (configuration files)

# Zsh config
curl https://raw.githubusercontent.com/mskar/setup/main/.zshrc -o ~/.zshrc

# powerlevel10k config
curl https://raw.githubusercontent.com/mskar/setup/main/.p10k.zsh -o ~/.p10k.zsh

# git
## config
curl https://raw.githubusercontent.com/mskar/setup/main/.gitconfig -o ~/.gitconfig

## Regular expressions for diffs
### https://tekin.co.uk/2020/10/better-git-diff-output-for-ruby-python-elixir-and-more
### https://gist.github.com/tekin/12500956bd56784728e490d8cef9cb81
curl https://gist.githubusercontent.com/tekin/12500956bd56784728e490d8cef9cb81/raw/e474af61231687b0e1a4ec59d4becd97537ef6c0/.gitattributes -o ~/.gitattributes

## automatically ignored files
# git config, ignore, and attributes
curl https://raw.githubusercontent.com/mskar/setup/main/.gitignore -o ~/.gitignore

### Vim
curl https://raw.githubusercontent.com/mskar/setup/main/.vimrc -o ~/.vimrc

### Vim snippets
curl https://raw.githubusercontent.com/mskar/setup/main/all.snippets -o ~/.config/coc/ultisnips/all.snippets --create-dirs

### Neovim
curl https://raw.githubusercontent.com/mskar/setup/main/init.vim -o ~/.config/nvim/init.vim --create-dirs

curl https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/R/tmux_split.vim -o ~/tmux_split.vim

### Neovim GUIs
curl https://raw.githubusercontent.com/mskar/setup/main/ginit.vim -o ~/.config/nvim/ginit.vim --create-dirs

### COC (Conqueror Of Completion)
curl https://raw.githubusercontent.com/mskar/setup/main/coc-settings.json -o ~/.config/nvim/coc-settings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/main/coc-settings.json -o ~/.vim/coc-settings.json --create-dirs

## SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

## Lunar Vim

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

curl https://raw.githubusercontent.com/mskar/setup/main/config.lua -o ~/.config/lvim/config.lua --create-dirs

### JetBrains IDEs
curl https://raw.githubusercontent.com/mskar/setup/main/.ideavimrc -o ~/.ideavimrc

## Set up emacs
curl https://raw.githubusercontent.com/mskar/setup/main/init.el -o ~/.config/emacs/init.el --create-dirs

### Spacemacs
rm -rf ~/.emacs.d

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

curl https://raw.githubusercontent.com/mskar/setup/main/.spacemacs -o ~/.spacemacs

### Doom emacs
git clone https://github.com/hlissner/doom-emacs ~/.doom/doom-emacs

export DOOMDIR=~/.doom/doom-emacs-config

mkdir -p "$DOOMDIR"

echo | ~/.doom/doom-emacs/bin/doom install

~/.doom/doom-emacs/bin/doom sync

curl https://raw.githubusercontent.com/mskar/setup/main/config.el -o ~/.doom/doom-emacs-config/config.el

curl https://raw.githubusercontent.com/mskar/setup/main/packages.el -o ~/.doom/doom-emacs-config/packages.el

## Set up oh my tmux
curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf

curl https://raw.githubusercontent.com/mskar/setup/main/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Set up ipython
curl https://raw.githubusercontent.com/mskar/setup/main/ipython_config.py -o ~/.ipython/profile_default/ipython_config.py --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/main/keybindings.py -o ~/.ipython/profile_default/startup/keybindings.py --create-dirs

## Set up ptpython
curl https://raw.githubusercontent.com/mskar/setup/main/config.py -o ~/Library/Application\ Support/ptpython/config.py --create-dirs

## Set up radian
curl https://raw.githubusercontent.com/mskar/setup/main/.radian_profile -o ~/.radian_profile

ln -sf .radian_profile radian_profile.R

## Set up btm
curl https://raw.githubusercontent.com/mskar/setup/main/bottom.toml -o ~/.config/bottom/bottom.toml --create-dirs

## Set up TabNine
curl https://raw.githubusercontent.com/mskar/setup/main/tabnine_config.json -o ~/.config/TabNine/tabnine_config.json --create-dirs

# 6: Conda environments (base, Python and R)
### Install cookiecutter (for i alias) and neovim (for vim plugins)
mamba install -yc conda-forge neovim

mamba create -yc conda-forge -n py python=3.9 joblib jupyterlab seaborn numpy pandas scikit-learn scipy

##### Installing r into base environment breaks nvim-R
mamba create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse r-languageserver python

# 7: Code editors
### Radian, ipython, ptpython, and jupyter-vimrc extension
python -m pip install git+https://github.com/mskar/radian git+https://github.com/mskar/ipython git+https://github.com/mskar/ptpython jupyterlab-vimrc

## Visual Studio Code (vscodium)
curl https://raw.githubusercontent.com/mskar/setup/main/settings.json -o ~/Library/Application\ Support/VSCodium/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/main/keybindings.json -o ~/Library/Application\ Support/VSCodium/User/keybindings.json

codium --install-extension ms-vsliveshare.vsliveshare --force

codium --install-extension ms-python.python --force

codium --install-extension ms-python.vscode-pylance --force

codium --install-extension ikuyadeu.r --force

codium --install-extension tabnine.tabnine-vscode --force

codium --install-extension asvetliakov.vscode-neovim --force

## Jupyter
### Need to install jupyter via conda before installing extensions
### https://github.com/jupyterlab/jupyterlab/pull/9068#issuecomment-739993274
#### jupyter labextension install @axlair/jupyterlab_vim

#### I don't use jupyterlab-git extension, I only demo it in classes
##### jupyter labextension install @jupyterlab/git
##### jupyter serverextension enable --py jupyterlab_git
##### jupyter labextension install jupyterlab_vim

## Set up jupyterlab-github extension
#### jupyter labextension install @jupyterlab/github
#### pip install jupyterlab_github
##### Provide access token to GitHub extension
##### https://github.com/jupyterlab/jupyterlab-github#2-getting-your-credentials-from-github

### Jupyter settings
curl https://raw.githubusercontent.com/mskar/setup/main/shortcuts.jupyterlab-settings -o ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings --create-dirs

### PyCharm settings
curl https://raw.githubusercontent.com/mskar/setup/main/settings.zip -o ~/settings.zip

## Setup PyCharm
### Install PyCharm via Jetbrains Toolbox
### Sync settings from https://github.com/marskar/PyCharm
### Or load settings from `settings.zip`
### Or manually configure PyCharm by following the steps below
### Under File > Settings Repository..., select Overwrite Local
### Settings
### Select MacOS X 10.5+ Keymap and make the following changes:
#### - Editor Actions > Backspace : `Ctrl h`
#### - Editor Actions > Cut Line Backward : `Ctrl u`
#### - Editor Actions > Kill to Word End : `Alt d`
#### - Editor Actions > Cut up to Line End : `Ctrl k`
#### - Editor Actions > Decrease Font Size : `Cmd -`
#### - Editor Actions > Focus Editor : `Shift Escape`
#### - Editor Actions > Increase Font Size : `Cmd =`
#### - Editor Actions > Kill to Word Start : `Ctrl w`
#### - Editor Actions > Move Caret to Next Word : `Alt f`
#### - Editor Actions > Move Caret to Previous Word : `Alt b`
#### - Editor Actions > Reset Font Size : `Cmd 0`
#### - Editor Actions > Split Line :
#### - Main Menu > Edit > Delete : `Ctrl d`
#### - Main Menu > Edit > Paste : `Ctrl y`
#### - Main Menu > Edit > Redo : `Ctrl =`
#### - Main Menu > Edit > Undo : `Ctrl -`
#### - Main Menu > File > Save As...: `Cmd Shift S`
#### - Main Menu > Help > Find Action... : `Cmd Shift p`
#### - Main Menu > Tool Windows > Commit :
#### - Main Menu > Window > Active Tool Window > Resize > Stretch to Bottom : `Cmd Shift ,`
#### - Main Menu > Window > Active Tool Window > Resize > Stretch to Left : `Cmd Shift ,`
#### - Main Menu > Window > Active Tool Window > Resize > Stretch to Right : `Cmd Shift ;`
#### - Main Menu > Window > Active Tool Window > Resize > Stretch to Top : `Cmd Shift ;`
#### - Plug-ins > Git > Checkout Revision : `Enter`
#### - Plug-ins > Git > Checkout Selected : `Enter`
#### - Plug-ins > Python > Execute Selection in Python Console: `Cmd Enter`
#### - Plug-ins > Python > Split Cell : `Ctrl Shift -`
#### - Plug-ins > Terminal > Shift Focus To Editor : `Shift+Escape`
### In Appearance & Behavior > Appearance, Select Darcula theme and select Fura Code Nerd Font size 14
### Using `Cmd Shift A` or going to View > Appearance at the Top, enable Details in Tree Views, disable Tool Windows Bars and Navigation Bar
### In MacOS System Preferences: Keyboard > Shortcuts > Services, uncheck Open man Page in Terminal (`Cmd Shift M`) and Search man Page Index in Terminal (`Cmd Shift A`)
### In MacOS System Preferences: Keyboard > Shortcuts > Keyboard, uncheck Turn keyboard access on and off after making sure all of the other shortcuts are enabled
### In MacOS System Preferences: Keyboard > Shortcuts > Keyboard, change ctrl function shortcuts to ctrl num shortcuts:
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

## Set up RStudio
curl https://raw.githubusercontent.com/mskar/setup/main/rstudio-prefs.json -o ~/.config/rstudio/rstudio-prefs.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/main/editor_bindings.json -o ~/.config/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/mskar/setup/main/rstudio_bindings.json -o ~/.config/rstudio/keybindings/rstudio_bindings.json --create-dirs

# Initialize conda for z shell
$(brew --prefix)/bin/conda init zsh

# Non-automated steps
## Give Hammerspoon Accessibility permissions and enable Launch Hammerspoon at login
## Restart computer to enable macOS settings set via defaults
## Load in the profile saved in the `macos.terminal` file
## Give karabiner_grabber and karabiner_observer Input Monitoring permission
## load macos profile (macos.terminal)

