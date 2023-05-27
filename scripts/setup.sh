# This repo contains my setup files for Mac (local) and Linux (remote).

# Installation
## Run the command below in a terminal to set up a new macOS computer:
## curl -s https://raw.githubusercontent.com/mlptv/setup/main/scripts/setup.sh | /bin/bash

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

curl https://raw.githubusercontent.com/maptv/setup/main/macos.terminal -o ~/macos.terminal

### Run the defaults commands below to setup MacOS

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

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
### Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

### https://www.defaults-write.com/delete-the-hiding-dock-delay-in-os-x/
defaults write com.apple.Dock autohide-delay -float 0

### https://macos-defaults.com/dock/autohide-time-modifier.html#set-to-0
defaults write com.apple.dock autohide-time-modifier -float 0

### https://macos-defaults.com/misc/enable-spring-load-actions-on-all-items.html#set-to-true
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

### Disable the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

### Disable the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

### Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

### Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

### Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

## Sound

#### Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

#### Disable user interface sound effects
defaults write "Apple Global Domain" com.apple.sound.uiaudio.enabled -int 0

#### Disable user interface sound effects
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool false

#### Disable feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

#### Disable flashing the screen when an alert sound occurs (accessibility)
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

### Under Sound > Sound Effects "Show Sound in menu bar" (doesn't work?)
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/Displays.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu"

## Finder

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

### Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

### Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

### Finder icons
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 3

### https://macos-defaults.com/finder/quitmenuitem.html#set-to-true
### Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
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

## Misc
### Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

### Use metric units
defaults write NSGlobalDomain AppleMetricUnits -bool true

### Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

### Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

### Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

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
##### This messes up ctrl u and k in alacritty and kitty
sudo curl https://raw.githubusercontent.com/maptv/setup/main/undead.icns -o /Library/Keyboard\ Layouts/undead.icns

sudo curl https://raw.githubusercontent.com/maptv/setup/main/undead.keylayout -o /Library/Keyboard\ Layouts/undead.layout

#### Download Default MacOS keybinding dictionary file `DefaultKeyBinding.dict` to `/Library/Keybindings/`

curl https://raw.githubusercontent.com/maptv/setup/main/DefaultKeyBinding.dict -o ~/Library/KeyBindings/DefaultKeyBinding.dict --create-dirs

### For additional keyboard setup, we need Karabiner, but to install Karabiner, let's use Homebrew.

# 3: Brew - commandline package manager
## Install Homebrew (this also installs xcode tools needed for git)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$($(brew --prefix)/bin/brew shellenv)"') >> ~/.zprofile

eval "$($(brew --prefix)/bin/brew shellenv)"

git config --global user.email 13444106+maptv@users.noreply.github.com

curl https://raw.githubusercontent.com/maptv/setup/main/.Brewfile -o ~/.Brewfile

brew bundle install --global || true

# 4: Generate SSH keys for GitHub, GitLab, and Bitbucket

model=$(sysctl hw.model | cut -d\  -f2)

yes y | ssh-keygen -t ed25519 -f ~/.ssh/$(whoami)_$model -C $(whoami)_$model -N ''

ssh-add ~/.ssh/$(whoami)_$model

cat ~/.ssh/$(whoami)_$model.pub | pbcopy

echo "Host *\n\tUseKeychain yes\n\tAddKeysToAgent yes\n\tIdentityFile ~/.ssh/$(whoami)_$model" >> ~/.ssh/config

# 5: MacOS Applications
## Install Ewka Nerdfont

git clone https://github.com/maptv/ewka ~/maptv/ewka

cp ~/maptv/ewka/nerd/* ~/Library/Fonts

## Install r (so that the rmarkdown render alias and Nvim-R work in base environment)
### Use brew install --cask r: https://rstats.wtf/set-up-an-r-dev-environment.html#what-about-homebrew

# Vimac
## Download, unzip, and move Vimac.app to Applications
### https://install.appcenter.ms/users/dexterleng/apps/vimac/distribution_groups/sparkle
## Set Vimac scroll mode shortcut to `Ctrl Shift S` (default: `Ctrl S`)
## Set Vimac hint mode shortcut to `Ctrl Shift Space` (default: `Ctrl Space`)
### Notes:
### `Cmd Shift Space` conflicts with vscode "trigger parameter hints"
### the equivalent shortcut in PyCharm, `Cmd P`, conflicts with vscode's quickOpen
### PyCharm uses `Cmd Shift O` for quick open files and `Cmd E` for recent files

# Permissions

# App shortcuts
## Set VimR to be the default txt file editor
duti -s com.qvacua.VimR txt all

duti -s org.jupyter.jupyterlab-desktop ipynb all

# Hammerspoon
curl https://raw.githubusercontent.com/maptv/setup/main/init.lua -o ~/.hammerspoon/init.lua --create-dirs

## miro window manager spoon
### use `Alt Shift` as the modifier à la Amethyst
curl https://raw.githubusercontent.com/miromannino/miro-windows-manager/master/MiroWindowsManager.spoon.zip | tar -xf - -C ~/.hammerspoon/Spoons

curl https://raw.githubusercontent.com/maptv/setup/main/MiroWindowsManager.lua -o ~/.hammerspoon/Spoons/MiroWindowsManager.spoon/init.lua --create-dirs

# Terminal config files
curl https://raw.githubusercontent.com/maptv/setup/main/alacritty.yml -o ~/.config/alacritty/alacritty.yml --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/kitty.conf -o ~/.config/kitty/kitty.conf --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/.hyper.js -o ~/.hyper.js --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/config.yaml -o ~/Library/Application\ Support/tabby/config.yaml --create-dirs

# CopyQ
## Load copyq.ini (commands) and copyq.cpq (configuration)

### Notes:
### Keyboard shortcuts:
### `Ctrl Alt C` summons the CopyQ window
### `Ctrl Alt D` pastes the today's ISO date
### `Ctrl Alt J` pastes and copies next
### `Ctrl Alt K` pastes and copies previous
### `Ctrl Alt S` shows the CopyQ tray (mnemonic: show tray)
### `Ctrl Alt V` edits the clipboard (mnemonic: vim)
### `Ctrl Alt X` pastes as plain text (mnemonic: remove (x) formatting)

## Set builtin "Move focus" macOS Keyboard shortcuts in System Preferences > Keyboard > Shortcuts > Keyboard
### Move focus to menu bar: `Alt Cmd A` (A is for Apple)
### Move focus to Dock: `Alt Cmd Z` (Z is below A and S on the keyboard)
### Move focus to active or next window: `Cmd '` (' looks similar to `)
#### Which automatically enables, move focus to previous window: `Cmd Shift ;`
#### that I decided it was worth overwriting the Emacs hippie completion binding
### Toggle all of the focus shortcuts except "Move focus to status menus": `Alt O`
### Move focus to window toolbar: `Alt Cmd T` (mnemonic: toolbaR, works a bit like Alt R in Emacs in that it jumps back and forth)
### Move focus to floating window: `Alt Cmd W`
### Move focus to status menus: `Alt Cmd S`
### Change the way Tab moves focus: `Alt Cmd Tab`
### Turn keyboard access on or off: `Alt Cmd K`

## Set up Vimac
### Hint Mode shortcut: `Ctrl Q`
### Scroll Mode shortcut: `Ctrl S`
### Maximize Scroll Mode sensitivity

## Set up Mac terminal
### In terminal, under Profiles > Text: Select Ewka Nerd Font size 18
### In terminal, under Profiles > Advanced: Deselect audible bell

## Set up iterm2
curl https://raw.githubusercontent.com/maptv/setup/main/com.googlecode.iterm2.plist -o ~/Library/Preferences/com.googlecode.iterm2.plist

### Load iterm.json, which includes the settings below
### curl https://raw.githubusercontent.com/maptv/setup/main/iterm.json -o ~/iterm.json
### In iterm2, select General > Preferences: Select load preferences from a local folder or URL
### In iterm2, select Appearance > Theme: Minimal
### In iterm2, select Profiles > Keys: Both option keys to Esc+
### In iterm2, select Profiles > Terminal > Notifications: Silence bell
### In iterm2, select Profiles > Text > Change Font: Ewka Nerdfont size 18, Use Ligatures
### In iterm2, set Profiles > General > Command > Send text at start: tmux attach || tmux new \; split-window -v \; select-pane -t :.+
### In iterm2, set Keys > Key Bindings > Send hex code 0x11 ^;
### In iterm2, set Profiles > Keys > Key Mappings to send enter/return key codes:
#### Send ^[ [13;2u with Shift Return
#### Send ^[ [13;5u with Ctrl Return
#### Send ^[ [13;6u with Ctrl Shift Return
#### Send ^[ [13;3u with Cmd Return
#### Send ^[ [13;4u with Shift Cmd Return
#### Send ^[ <M-C-CR> with Ctrl Shift Cmd Return

## Set up karabiner
curl https://raw.githubusercontent.com/maptv/setup/main/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs

#### Under Complex modifications > Rules you should see
##### Change caps_lock to control if pressed with other keys, to escape if pressed alone. (from Change caps_lock key (rev 4))
##### Change return to control if pressed with other keys, to return if pressed alone (from Change return to control)
##### Bash style Emacs key bindings (rev 2) (from Emacs key bindings (rev 12))
##### Emacs key bindings [option+keys] (rev 5) (from Emacs key bindings (rev 12))

# 6: Command line tools
## Set up fzf (fuzzy finder)
## Set up bat and exa (for fzf file preview)
## Set up fasd and fd (to provide inputs for fzf)
## Set up xpdf (e.g. pdftotext - for fzf PDF file preview)
## Set up vim and neovim

## Use terminal emacs in the terminal (overwrite link to GUI Emacs installed via cask)
brew link --overwrite emacs

## Create locations for undo files (just in case they are not created automatically)
mkdir -p ~/.vim/undodir

mkdir -p ~/.local/share/nvim/undo

## Install fzf key bindings and fuzzy completion using the install script which runs the commented out code below
### source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
### source /opt/homebrew/opt/fzf/shell/key-bindings.bash
### source /opt/homebrew/opt/fzf/shell/completion.zsh
### source /opt/homebrew/opt/fzf/shell/completion.bash
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-fish --no-update-rc

# Use Bash as a backup
curl https://raw.githubusercontent.com/maptv/setup/main/.bash_profile -o ~/.bash_profile

curl https://raw.githubusercontent.com/maptv/setup/main/.inputrc -o ~/.inputrc

## Download dotfiles (configuration files)

# Zsh config
curl https://raw.githubusercontent.com/maptv/setup/main/.zshrc -o ~/.zshrc

# powerlevel10k config
curl https://raw.githubusercontent.com/maptv/setup/main/.p10k.zsh -o ~/.p10k.zsh

# git
## config
curl https://raw.githubusercontent.com/maptv/setup/main/.gitconfig -o ~/.gitconfig

## Regular expressions for diffs
### https://tekin.co.uk/2020/10/better-git-diff-output-for-ruby-python-elixir-and-more
### https://gist.github.com/tekin/12500956bd56784728e490d8cef9cb81
curl https://gist.githubusercontent.com/tekin/12500956bd56784728e490d8cef9cb81/raw/e474af61231687b0e1a4ec59d4becd97537ef6c0/.gitattributes -o ~/.gitattributes

## automatically ignored files
# git config, ignore, and attributes
curl https://raw.githubusercontent.com/maptv/setup/main/.gitignore -o ~/.gitignore

### Vim
curl https://raw.githubusercontent.com/maptv/setup/main/.vimrc -o ~/.vimrc

### Vim snippets
curl https://raw.githubusercontent.com/maptv/setup/main/all.snippets -o ~/.config/coc/ultisnips/all.snippets --create-dirs

### Neovim
curl https://raw.githubusercontent.com/maptv/setup/main/init.vim -o ~/.config/nvim/init.vim --create-dirs

curl https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/R/tmux_split.vim -o ~/tmux_split.vim

### Neovim GUIs
curl https://raw.githubusercontent.com/maptv/setup/main/ginit.vim -o ~/.config/nvim/ginit.vim --create-dirs

### COC (Conqueror Of Completion)
curl https://raw.githubusercontent.com/maptv/setup/main/coc-settings.json -o ~/.config/nvim/coc-settings.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/coc-settings.json -o ~/.vim/coc-settings.json --create-dirs

## SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

## Lunar Vim

yes y | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

curl https://raw.githubusercontent.com/maptv/setup/main/config.lua -o ~/.config/lvim/config.lua --create-dirs

### JetBrains IDEs
curl https://raw.githubusercontent.com/maptv/setup/main/.ideavimrc -o ~/.ideavimrc

## Set up emacs

### Spacemacs

git clone https://github.com/syl20bnr/spacemacs ~/spacemacs

curl https://raw.githubusercontent.com/maptv/setup/main/.spacemacs -o ~/.spacemacs

### Doom emacs

rm -rf ~/.emacs.d

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

curl https://raw.githubusercontent.com/maptv/setup/main/config.el -o ~/.config/doom/config.el

curl https://raw.githubusercontent.com/maptv/setup/main/packages.el -o ~/.config/doom/packages.el

## Set up oh my tmux
curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf

curl https://raw.githubusercontent.com/maptv/setup/main/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Set up ipython
curl https://raw.githubusercontent.com/maptv/setup/main/ipython_config.py -o ~/.ipython/profile_default/ipython_config.py --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/keybindings.py -o ~/.ipython/profile_default/startup/keybindings.py --create-dirs

## Set up ptpython
curl https://raw.githubusercontent.com/maptv/setup/main/config.py -o ~/Library/Application\ Support/ptpython/config.py --create-dirs

## Set up radian
curl https://raw.githubusercontent.com/maptv/setup/main/.radian_profile -o ~/.radian_profile

ln -sf .radian_profile radian_profile.R

## Set up btm
curl https://raw.githubusercontent.com/maptv/setup/main/bottom.toml -o ~/.config/bottom/bottom.toml --create-dirs

## Set up TabNine
curl https://raw.githubusercontent.com/maptv/setup/main/tabnine_config.json -o ~/.config/TabNine/tabnine_config.json --create-dirs

# 6: Conda environments (base, Python and R)
### Install cookiecutter (for i alias) and neovim (for vim plugins)
$(brew --prefix)/Caskroom/mambaforge/base/bin/mamba install -yc conda-forge python neovim

$(brew --prefix)/Caskroom/mambaforge/base/bin/mamba create -yc conda-forge -n py python joblib jupyterlab seaborn neovim numpy pandas scikit-learn jupyterlab_vim scipy

##### Installing r into base environment breaks nvim-R
$(brew --prefix)/Caskroom/mambaforge/base/bin/mamba create -yc conda-forge -n r r-essentials r-tidyverse r-irkernel python neovim jupyterlab jupyterlab_vim

# 7: Code editors

### Jupyter settings
curl https://raw.githubusercontent.com/maptv/setup/main/shortcuts.jupyterlab-settings -o ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/vimrc.jupyterlab-settings -o ~/.jupyter/lab/user-settings/jupyterlab-vimrc/vimrc.jupyterlab-settings --create-dirs

### PyCharm settings
curl https://raw.githubusercontent.com/maptv/setup/main/settings.zip -o ~/settings.zip

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
#### - Main Menu > View > Quick Documentation: `Ctrl q`
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
### In Appearance & Behavior > Appearance, Select Darcula theme and select Ewka Nerd Font size 14
### Using `Cmd Shift A` or going to View > Appearance at the Top, enable Details in Tree Views, disable Tool Windows Bars and Navigation Bar
### In MacOS System Preferences: Keyboard > Shortcuts > Services, uncheck Open man Page in Terminal (`Cmd Shift M`) and Search man Page Index in Terminal (`Cmd Shift A`)
### In MacOS System Preferences: Keyboard > Shortcuts > Keyboard, uncheck Turn keyboard access on and off after making sure all of the other shortcuts are enabled
### In MacOS System Preferences: Keyboard > Shortcuts > Keyboard, change ctrl function shortcuts to ctrl num shortcuts:
### In Editor > Font, select Ewka Nerd Font size 16 as main and Jetbrains Mono as fallback and Enable font ligatures
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
curl https://raw.githubusercontent.com/maptv/setup/main/rstudio-prefs.json -o ~/.config/rstudio/rstudio-prefs.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/editor_bindings.json -o ~/.config/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/rstudio_bindings.json -o ~/.config/rstudio/keybindings/rstudio_bindings.json --create-dirs

# Initialize conda for z shell
$(brew --prefix)/bin/mamba init zsh

# Set up vscode and vscodium 
curl https://raw.githubusercontent.com/maptv/setup/main/settings.json -o ~/Library/Application\ Support/Code/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/settings.json -o ~/Library/Application\ Support/VSCodium/User/settings.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/keybindings.json -o ~/Library/Application\ Support/Code/User/keybindings.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/main/keybindings.json -o ~/Library/Application\ Support/VSCodium/User/keybindings.json --create-dirs

# Install vscode and vscodium extensions
$(brew --prefix)/bin/codium --install-extension asvetliakov.vscode-neovim

$(brew --prefix)/bin/codium --install-extension ms-python.python

$(brew --prefix)/bin/codium --install-extension ms-toolsai.jupyter

$(brew --prefix)/bin/codium --install-extension ms-toolsai.jupyter-keymap

$(brew --prefix)/bin/codium --install-extension ms-toolsai.jupyter-renderers

$(brew --prefix)/bin/codium --install-extension ms-toolsai.vscode-jupyter-cell-tags

$(brew --prefix)/bin/codium --install-extension ms-toolsai.vscode-jupyter-slideshow

$(brew --prefix)/bin/codium --install-extension quarto.quarto

$(brew --prefix)/bin/codium --install-extension REditorSupport.r

$(brew --prefix)/bin/codium --install-extension TabNine.tabnine-vscode

$(brew --prefix)/bin/code --install-extension asvetliakov.vscode-neovim

$(brew --prefix)/bin/code --install-extension ms-python.black-formatter

$(brew --prefix)/bin/code --install-extension ms-python.python

$(brew --prefix)/bin/code --install-extension ms-python.vscode-pylance

$(brew --prefix)/bin/code --install-extension ms-toolsai.jupyter

$(brew --prefix)/bin/code --install-extension ms-toolsai.jupyter-keymap

$(brew --prefix)/bin/code --install-extension ms-toolsai.jupyter-renderers

$(brew --prefix)/bin/code --install-extension ms-toolsai.vscode-jupyter-cell-tags

$(brew --prefix)/bin/code --install-extension ms-toolsai.vscode-jupyter-slideshow

$(brew --prefix)/bin/code --install-extension quarto.quarto

$(brew --prefix)/bin/code --install-extension withfig.fig

$(brew --prefix)/bin/code --install-extension REditorSupport.r

$(brew --prefix)/bin/code --install-extension TabNine.tabnine-vscode

# Non-automated steps
## Give Hammerspoon Accessibility permissions and enable Launch Hammerspoon at login
## Restart computer to enable macOS settings set via defaults
## Load in the profile saved in the `macos.terminal` file
## Give karabiner_grabber and karabiner_observer Input Monitoring permission
## Set the following keyboard shortcuts:
### Mission Control
#### Mission Control: Ctrl Alt Shift Cmd Up
#### Application windows: Ctrl Alt Shift Cmd Up
#### Move left a space: Ctrl Alt Shift Cmd Left
#### Switch to Desktop 1: Ctrl Alt Shift Cmd 1
#### Switch to Desktop 2: Ctrl Alt Shift Cmd 2
#### Switch to Desktop 3: Ctrl Alt Shift Cmd 3
#### Switch to Desktop 4: Ctrl Alt Shift Cmd 4
#### Switch to Desktop 5: Ctrl Alt Shift Cmd 5
### Keyboard
#### Change the way Tab moves focus: Alt Cmd Tab
#### Turn keyboard access on or off: Alt Cmd K
#### Move focus to the menu bar: Alt Cmd A (A is for Apple)
#### Move focus to the Dock: Alt Cmd Z (Z is below A and S)
#### Move focus to the active or next window: Cmd ; (like Cmd `)
#### Move focus to the window toolbar: Alt Cmd T
#### Move focus to the floating window: Alt Cmd W
#### Move focus to the next window: Cmd ` (Default)
#### Move focus to the status menus: Alt Cmd S
## Set Sound options
### Set alert volume to zero
### Disable Play sound on startup
## Add all Google profiles in Chrome
### Each profile automatically should have
#### SurfingKeys extension with settings loaded from https://raw.githubusercontent.com/maptv/setup/main/surfingkeys.js
#### Vimium extension with settings restored from https://raw.githubusercontent.com/maptv/setup/main/vimium-options.json
#### LastPass extension
#### BitWarden extension
## Add all Internet Accounts in System Preferences
## Install Homerow: https://www.homerow.app
### Grant Accessibility permissions to CopyQ, altTab, Homerow, Hammerspoon, VimR and Alfred
### Enable launch on login for CopyQ, altTab, Homerow, Hammerspoon, VimR and Alfred
### Select ABC under Auto-switch Input Source
### Click Disable search & show all labels
## Set up Displays
### The resolution of display link dual monitors should be 3840
### Set resolution of main monitor to 2650 and MacBook monitor to 1280, so the two add up to 3840
### Click "Arrange..." and Arrange the monitors so that the main monitor and the MacBook monitor line up with the dual link dual monitors
### Move the white band from the top of MacBook monitor to the main monitor, the monitor order should now be:
#### 1: main monitor
#### 2: MacBook monitor
#### 3: far right monitor
#### 4: dual link dual monitors
#### 5: far right monitor


# Terminals
## iTerm: set up to automatically run tmux attach
## alacritty: set up to automatically run tmux attach
## kitty: need to manually run tmux attach
## tabby: can't figure how to remap ctrl ; to ctrl q
## hyper: can't figure how to remap ctrl ; to ctrl q
## terminal: can't figure how to remap ctrl ; to ctrl q
