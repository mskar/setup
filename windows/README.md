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

# Install Hyper terminal https://hyper.is/

# In Hyper
wsl.exe

# Update apt-get
sudo apt-get update && apt-get upgrade

# Install curl
sudo apt install curl -y

# Add hyper config file to the path below (Replace userName in the path in the `curl` command below)
curl https://raw.githubusercontent.com/py4ds/setup/master/windows/.hyper.js -o /mnt/c/Users/{userName}/AppData/Roaming/Hyper/.hyper.js

# Install Z shell
sudo apt install zsh -y

# Install git
sudo apt install git -y

# Install vim and neovim
sudo apt install vim-gtk3 -y
sudo apt install neovim -y
sudo apt install make -y

# [Install FiraCode font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf) (download and double click)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### When prompted to change shell, enter Y

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

curl https://raw.githubusercontent.com/py4ds/setup/blob/master/windows/.zshrc -o ~/.zshrc && source ~/.zshrc

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install

# Add git and vim config files
curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local -o ~/.vimrc.local

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local.bundles -o ~/.vimrc.local.bundles

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_init.vim -o ~/.config/nvim/local_init.vim --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_bundles.vim -o ~/.config/nvim/local_bundles.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/init.vim -o ~/.config/nvim/init.vim

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

