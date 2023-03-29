# Install brew
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Add brew to $PATH
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/ubuntu/.zprofile

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Make zsh the default shell
sudo chsh -s /usr/bin/zsh

# Zsh config
curl https://raw.githubusercontent.com/maptv/setup/master/macos/.zshrc -o ~/.zshrc

# powerlevel10k config
curl https://raw.githubusercontent.com/maptv/setup/master/macos/.p10k.zsh -o ~/.p10k.zsh

# git config
curl https://raw.githubusercontent.com/maptv/setup/master/.gitconfig -o ~/.gitconfig

# Shell programs needed for aliases
## Install fzf (fuzzy finder)
## Install bat and exa (for fzf file preview)
## Install fasd and fd (to provide inputs for fzf)
## Install xpdf (e.g. pdftotext - for fzf PDF file preview)
## Install vim and neovim
# Zsh theme: powerlevel10k
# Zsh plugins: zsh-autosuggestions and zsh-syntax-highlighting
brew install bash bat exa fasd fd fzf hub neovim tmux vim xpdf zsh-autosuggestions zsh-syntax-highlighting romkatv/powerlevel10k/powerlevel10k

## Install fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install --no-fish --completion --no-key-bindings --no-update-rc

# Use Bash as a backup
curl https://raw.githubusercontent.com/maptv/setup/master/macos/.bash_profile -o ~/.bash_profile

curl https://raw.githubusercontent.com/maptv/setup/master/macos/.inputrc -o ~/.inputrc

## Download dotfiles (configuration files)
### Vim
curl https://raw.githubusercontent.com/maptv/setup/master/vim/.vimrc -o ~/.vimrc

curl https://raw.githubusercontent.com/maptv/setup/master/vim/.au.vimrc -o ~/.au.vimrc

curl https://raw.githubusercontent.com/maptv/setup/master/vim/.map.vimrc -o ~/.map.vimrc

curl https://raw.githubusercontent.com/maptv/setup/master/vim/.plug.vimrc -o ~/.plug.vimrc

curl https://raw.githubusercontent.com/maptv/setup/master/vim/.set.vimrc -o ~/.set.vimrc

### Neovim
curl https://raw.githubusercontent.com/maptv/setup/master/neovim/init.vim -o ~/.config/nvim/init.vim

curl https://raw.githubusercontent.com/maptv/setup/master/neovim/au.vim -o ~/.config/nvim/au.vim

curl https://raw.githubusercontent.com/maptv/setup/master/neovim/map.vim -o ~/.config/nvim/map.vim

curl https://raw.githubusercontent.com/maptv/setup/master/neovim/plug.vim -o ~/.config/nvim/plug.vim

curl https://raw.githubusercontent.com/maptv/setup/master/neovim/set.vim -o ~/.config/nvim/set.vim

### SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/maptv/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

## Set up oh my tmux
curl https://raw.githubusercontent.com/maptv/setup/master/macos/.tmux.conf -o ~/.tmux.conf

curl https://raw.githubusercontent.com/maptv/setup/master/macos/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Python and R

## Install miniconda Python
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh

bash ~/miniconda.sh -bp $HOME/miniconda

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



## Install RStudio (this also installs `r-essentials`; RStudio was working for me as part of Anaconda 5.2.0)
##### Installing r into base environment breaks nvim-R
conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse

curl https://raw.githubusercontent.com/maptv/setup/master/rstudio/rstudio-prefs.json -o ~/.config/rstudio/rstudio-prefs.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/master/rstudio/editor_bindings.json -o ~/.config/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/maptv/setup/master/rstudio/rstudio_bindings.json -o ~/.config/rstudio/keybindings/rstudio_bindings.json

### Install and symlink macvim (brew installed macvim conflicts with brew installed vim)
##### ln -s /usr/local/Cellar/macvim/**/MacVim.app/ /Applications/MacVim.app
conda init zsh
