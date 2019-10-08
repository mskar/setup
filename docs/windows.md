# Remap CapsLock to control/esc and alt+h/j/k/l to arrow keys
1. Download and run [CapsUnlocked](https://github.com/kshenoy/CapsUnlocked/releases)
2. Install [AutoHotkey](https://www.autohotkey.com/), in home directory if necessary
3. Create a ShellNew directory in C://Windows if necessary
4. Move ahk scripts to StartUp https://www.autohotkey.com/docs/FAQ.htm#Startup 
  - Replace username in this path: `C:\Users\USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
# Install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- Activate Windows Subsystem for Linux via the Windows Features GUI

# Install Hyper terminal https://hyper.is/
# Add hyper config file to the path below (Replace username in the path)
curl https://raw.githubusercontent.com/py4ds/setup/master/.hyper.js -o /mnt/c/Users/{userName}/AppData/Roaming/Hyper/.hyper.js

# Update apt-get
sudo apt-get update

# Install Z shell
sudo apt install zsh

# Make bash start zsh automatically
echo "if [ -t 1 ]; then\n\texec zsh\nfi" >> ~/.bashrc

# [Install FiraCode font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf) (download and double click)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### When prompted to change shell, enter Y

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

curl https://raw.githubusercontent.com/py4ds/setup/master/.zshrc -o ~/.zshrc && source ~/.zshrc

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Add git and vim config files
curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local -o ~/.vimrc.local

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local.bundles -o ~/.vimrc.local.bundles

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc && source ~/.vimrc


# Work in progress section
2. Install homebrew: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`
3. Add homebrew to PATH: `export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH`
4. `brew install zsh`

## [Kali Linux](https://www.microsoft.com/store/apps/9PKR34TNCV07)
