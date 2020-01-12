# Why Mac?
## Modifier keys
### The Command key is used for MacOS keyboard shortcuts, limiting conflicts with Unix shortcuts that use Alt/Option or Control.
### The best option would be to install Linux on a Mac and configure the modifier keys (Cmd/Alt/Ctrl) to work like in MacOS, but who has time for that?
## Longevity
### Macs are built to last. I am writing this in 2019 on a 2014 MacBook Air. No PC has ever lasted this long in my experience.
## MacOS
### MacOS is UNIX-based, unlike the Windows, though the Windows Subsystem for Linux
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

## Install Homebrew (this also installs xcode tools needed for git)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Karabiner
## Install Karabiner-Elements from homepage dmg https://pqrs.org/osx/karabiner/
brew cask install karabiner-elements
## Download karabiner dotfile (configuration file)
curl https://raw.githubusercontent.com/py4ds/setup/master/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
#### Under Complex modifications > Rules you should see
##### Change caps_lock to control if pressed with other keys, to escape if pressed alone. (from Change caps_lock key (rev 4))
##### Change right_command+hjkl to arrow keys (from Examples)
##### Bash style Emacs key bindings (rev 2) (from Emacs key bindings (rev 12))
##### Emacs key bindings [option+keys] (rev 5) (from Emacs key bindings (rev 12))

## Install Fira Code Nerdfont
brew cask install caskroom/fonts/font-firacode-nerd-font
## In terminal, under Profiles > Text: Set background to black, set text to white, and select Fura Code Nerdfont size 18

## Install iterm2
brew cask install iterm2

curl https://raw.githubusercontent.com/py4ds/setup/master/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
## In iterm2, select General > Preferences: Select load preferences from a local folder or URL
## In iterm2, select Appearance > Theme: Minimal
## In iterm2, select Profiles > Keys: Both option keys to Esc+
## In iterm2, select Profiles > Terminal, Under Notifications, Silence bell
## In iterm2, select Fura Code Nerdfont size 18 in Profiles > Text > Change Font and check Use Ligatures

## Install oh-my-zsh et al.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### When prompted to change shell, enter Y

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

curl https://raw.githubusercontent.com/py4ds/setup/master/.zshrc -o ~/.zshrc && source ~/.zshrc

## Install fzf
brew install fzf && $(brew --prefix)/opt/fzf/install

## Install tree
brew install tree

## Download and source dotfiles (configuration files)
curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local -o ~/.vimrc.local

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local.bundles -o ~/.vimrc.local.bundles

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc

## Or clone the github repo and copy the dotfiles to the right places
git clone https://github.com/py4ds/setup ~/py4ds/setup

cp ~/py4ds/setup/.zshrc ~

cp ~/py4ds/setup/.ideavimrc ~

cp ~/py4ds/setup/com.googlecode.iterm2.plist ~

cp ~/py4ds/setup/vim/.vimrc* ~

mkdir -p ~/.config/nvim/ && cp ~/py4ds/setup/neovim/*.vim ~/.config/nvim/

mkdir -p ~/.config/karabiner/ && cp ~/py4ds/setup/karabiner.json ~/.config/karabiner/

## Install neovim
brew install neovim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_init.vim -o ~/.config/nvim/local_init.vim --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_bundles.vim -o ~/.config/nvim/local_bundles.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/init.vim -o ~/.config/nvim/init.vim


## Set up SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim
curl https://raw.githubusercontent.com/py4ds/setup/master/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

## TODO: what do vim and neovim depend on?
brew install ctags

pip install flake8 jedi neovim

## Install flycut
brew cask install flycut

## Install shiftit
brew cask install shiftit

# Install terminal tools (e.g. pdftotext)
brew install xpdf

## Install keycastr
# brew cask install keycastr

## Install tmux
brew install tmux

## Install oh my tmux
git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -s -f ~/.tmux/.tmux.conf
curl https://raw.githubusercontent.com/py4ds/setup/master/.tmux.conf.local -o ~/.tmux.conf.local
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Python and R

## [Install Anaconda](https://www.anaconda.com/distribution/): this can include the VS code text editor
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o install_miniconda.sh && bash install_miniconda.sh

## Install PyCharm (on Ubuntu use snap)
brew cask install pycharm

curl https://raw.githubusercontent.com/py4ds/setup/master/.ideavimrc -o ~/.ideavimrc
## Sync settings from https://github.com/marskar/PyCharm
## Under File > Settings Repository..., select Overwrite Local

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

## Install java and JDK to stop the the JDK popups
brew cask install java

## Setup Jupyter Lab with the jupyterlab-git extension
conda install -yc conda-forge nodejs jupyterlab jupyterlab-git

jupyter labextension install @jupyterlab/git

jupyter serverextension enable --py jupyterlab_git

jupyter labextension install jupyterlab_vim
# jupyter labextension install @jupyterlab/github
# pip install jupyterlab_github
## Provide access token to GitHub extension
## https://github.com/jupyterlab/jupyterlab-github#2-getting-your-credentials-from-github

## Install RStudio (this also installs `r-essentials`; RStudio was working for me as part of Anaconda 5.2.0)
conda install -yc r rstudio

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/user-settings -o ~/.rstudio-desktop/monitored/user-settings/user-settings --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/editor_bindings.json -o ~/.R/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/rstudio_bindings.json -o ~/.R/rstudio/keybindings/rstudio_bindings.json

## Install Visual Studio Code
brew cask install visual-studio-code

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/settings.json -o ~/Library/ApplicationSupport/Code/User

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/keybindings.json -o ~/Library/ApplicationSupport/Code/User

code --install-extension ms-python.python

code --install-extension ms-vsliveshare.vsliveshare

code --install-extension vscodevim.vim

# Install inkscape (to create vector art, e.g. logos)
brew cask install xquartz

brew cask install inkscape

