# Remap CapsLock to control/esc and right alt+h/j/k/l to arrow keys
# Remap windows ctrl shortcuts to left alt and windows windows key to bash alt shortcuts
# The most important is [CapsUnlocked script](https://github.com/kshenoy/CapsUnlocked/releases)
1. Install [AutoHotkey](https://www.autohotkey.com/), in home directory if necessary
2. Create a ShellNew directory in C://Windows if necessary
3. Move ahk scripts to StartUp https://www.autohotkey.com/docs/FAQ.htm#Startup
  - Replace username in this Windows path, if using Explorer.exe: `C:\Users\USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
  - Replace username in this UNIX path, if using a UNIX terminal: `"/mnt/c/Users/USERNAME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"`
# Install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- Activate Windows Subsystem for Linux via the Windows Features GUI

# Install [Windows Terminal](https://github.com/microsoft/terminal#installing-and-running-windows-terminal) via Microsoft Store

# Optional: Install [Hyper terminal](https://hyper.is/) as a backup

# [Install FiraCode font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf) (download and double click)

# Install Linux distros via Microsoft Store
- Debian
- Kali
- Ubuntu

# In Windows Terminal (or Hyper), install shell dependencies
sudo apt-get update && apt-get upgrade
sudo apt-get install build-essential curl file git -y


# Download terminal config files

## Hyper
curl https://raw.githubusercontent.com/py4ds/setup/master/windows/profile.json -o /mnt/c/Users/*/AppData/Roaming/Hyper/profile.json --create-dirs

## Windows Terminal
curl https://raw.githubusercontent.com/py4ds/setup/master/windows/.hyper.js -o /mnt/c/Users/*/AppData/Roaming/Hyper/.hyper.js --create-dirs

# Install homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

## Configure Homebrew in your ~/.profile by running
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >>~/.profile

## Add Homebrew to your PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## We recommend that you install GCC by running:
brew install gcc

# Install Z shell and oh-my-zsh et al.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# Download config files
curl https://raw.githubusercontent.com/py4ds/setup/master/windows/.zshrc -o ~/.zshrc

curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

# Set up terminal clipboard (https://superuser.com/a/1345241)
- Install VcXsrv (if it starts after installing, stop it).
- Start it using the newly installed program XLaunch (search in the start menu).
- Go with all the defaults options, and ensure the clipboard options are checked.
- At the end, save the configuration to a file, config.xlaunch (use that to start it from now on).

# Install vim and neovim
sudo apt install vim-gtk3 -y
sudo apt install neovim -y
sudo apt install make -y

# Shell programs needed for aliases
## Install fzf (fuzzy finder)
## Install bat and exa (for fzf file preview)
## Install fasd and fd (to provide inputs for fzf)
## Install xpdf (e.g. pdftotext - for fzf PDF file preview)
## Install vim and neovim
# kali linux: sudo apt install gcc clang
brew install bash bat exa fasd fd fzf hub neovim sc-im tmux vim xpdf

## Download dotfiles (configuration files)
### Vim
curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.au.vimrc -o ~/.au.vimrc

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.map.vimrc -o ~/.map.vimrc

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.plug.vimrc -o ~/.plug.vimrc

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.set.vimrc -o ~/.set.vimrc

### Neovim
curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/init.vim -o ~/.config/nvim/init.vim --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/au.vim -o ~/.config/nvim/au.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/map.vim -o ~/.config/nvim/map.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/plug.vim -o ~/.config/nvim/plug.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/set.vim -o ~/.config/nvim/set.vim

### SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

### JetBrains IDEs
curl https://raw.githubusercontent.com/py4ds/setup/master/ideavim/.ideavimrc -o ~/.ideavimrc

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


# Install miniconda
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o install_miniconda.sh && bash install_miniconda.sh

# Install scikit-learn JupyterLab and nodejs (required for git extension)
conda install -yc conda-forge nodejs scikit-learn numpy pandas matplotlib seaborn jupyterlab jupyterlab-git

## Building the extension was too slow in hyper
## I used ubuntu console instead
jupyter labextension install @jupyterlab/git

jupyter serverextension enable --py jupyterlab_git

# Work in progress section
2. Install homebrew: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`
3. Add homebrew to PATH: `export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH`
4. `brew install zsh`

## [Kali Linux](https://www.microsoft.com/store/apps/9PKR34TNCV07)

