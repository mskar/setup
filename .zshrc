
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# TERM=xterm-256color
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
# SABLE_AUTO_TITLE="true"

POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\uf0da'
POWERLEVEL9K_VCS_GIT_ICON='\ue60a'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='11'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='09'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs vcs dir time ram virtualenv anaconda battery)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_TIME_FORMAT="%D{%Y-%m-%d \uf073 %H:%M}" # \uf017 = clock

POWERLEVEL9K_STATUS_VERBOSE=false
#https://github.com/bhilburn/powerlevel9k
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "

POWERLEVEL9K_DIR_HOME_BACKGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="cyan"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="magenta"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='white'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='black'

POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='red'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='black'
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fasd fd fzf tmux git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='/usr/bin/vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Inititialize fasd and its aliases
eval "$(fasd --init auto)"

alias 0="dirs -v"
alias a="git add"
alias aa="git add --all"
alias aca="git add --all && git commit --amend"
alias acam="func() { git add --all && git commit --amend -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias acamp="func() { git add --all && git commit --amend -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias acap="git add --all && git commit --amend && git push --force"
alias acar="git add --all && git commit --amend --reuse-message=HEAD --reset-author"
alias acarp="git add --all && git commit --amend --reuse-message=HEAD --reset-author && git push --force"
alias ac="git add --all && git commit"
alias acm="func() { git add --all && git commit -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias acmp="func() { git add --all && git commit -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias acp="git add --all && git commit && git push"
alias acr="git add --all && git commit --reuse-message=HEAD --reset-author"
alias acrp="git add --all && git commit --reuse-message=HEAD --reset-author && git push"
alias ai="git add --interactive"
alias b="git branch"
alias ba="git branch -a"
alias bb="func() { git checkout $(echo '$(git --no-pager branch --color=always $@ | fzf --ansi --no-sort --reverse)'); }; func"
alias br="git branch -r"
alias c="func() { git clone $(echo '$1 ${1#*.*/}') && cd $(echo '${1#*.*/}'); }; func";
alias ca="git commit -a"
alias caa="git commit --amend -a"
alias car="git commit -a --reuse-message=HEAD --reset-author"
alias caam="func() { git commit --amend -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias caamp="func() { git commit --amend -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias caap="git commit --amend -a && git push --force"
alias caar="git commit --amend -a --reuse-message=HEAD --reset-author"
alias caarp="git commit --amend -a --reuse-message=HEAD --reset-author && git push --force"
alias cam="func() { git commit -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias camp="func() { git commit -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias cap="git commit -a && git push"
alias carp="git commit -a --reuse-message=HEAD --reset-author && git push"
alias cc="func() { git checkout $(echo '$(git log --color=always --date=short --format="%Cblue%h:%C(yellow)%ad %Creset%s %Cgreen[%cn]%Cred%d" $@ | fzf --ansi --no-sort --reverse --tiebreak=index | cut -d: -f1)'); }; func"
alias cf="git clean -f"
alias cfd="git clean -fd"
alias cm="func() { git commit -m \"$(echo '${*:-Changed files: $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")}')\"; }; func";
alias cn="git clean -n"
alias cnd="git clean -nd"
alias co="git checkout"
alias cob="git checkout -b"
alias coh="func() { git checkout $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias com="git checkout master"
alias d="git diff --word-diff=color"
alias dd="func() { git diff --word-diff=color $(echo '$(git log --color=always --date=short --format="%Cblue%h:%C(yellow)%ad %Creset%s %Cgreen[%cn]%Cred%d" $@ | fzf --ansi --no-sort --reverse --tiebreak=index | cut -d: -f1)'); }; func"
alias ds="git diff --word-diff=color --cached" # --staged is a synonym of --cached
alias dh="func() { git diff --word-diff=color $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias dc="git difftool -yt code --extcmd 'code --wait --diff'"
alias dcs="git difftool -yt code --extcmd 'code --wait --diff' --cached" # --staged is a synonym of --cached
alias dn="git difftool -yt nvim --extcmd 'nvim -d'"
alias dns="git difftool -yt nvim --extcmd 'nvim -d' --cached" # --staged is a synonym of --cached
alias du="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias dus="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached" # --staged is a synonym of --cached
# alias dp="git difftool -yt pycharm --extcmd 'pycharm diff $LOCAL $REMOTE'"
# alias dps="git difftool -yt pycharm --extcmd 'pycharm diff'"
alias dv="git difftool -yt vimdiff"
alias dvs="git difftool -yt vimdiff --cached" # --staged is a synonym of --cached
alias e="export"
# use fasd builtin f alias: alias f='fasd -f'
# use fd instead of find
alias fl='fasd -fl'
# fc is a built-in command that is used by fzf ctrl-r
alias fn="fasd -fe nvim"
alias fo="fasd -fe open"
alias fp="fasd -fe pycharm"
alias fu="fasd -fe 'nvim -u ~/.SpaceVim/init.vim'"
alias fv="fasd -fe '$EDITOR'" # relies on EDITOR variable from line 121
alias fixnames="for f in *\ *; do mv '$f' '${f// /-}'; done;"
alias g="grep --color=auto --exclude-dir={.git,.idea,.vscode}"
alias gi="grep -i --color=auto --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=auto --exclude-dir={.git,.idea,.vscode}"
alias gir="grep -ir --color=auto --exclude-dir={.git,.idea,.vscode}"
alias h='history'
alias i="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func";
alias ie="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func";
alias iee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func";
alias j="func() { local directory; directory=$(echo '$(fd ^ $@ --type d | fzf --no-sort --preview="CLICOLOR_FORCE=1 ls -G {}" --reverse)') && cd $(echo '$directory'); }; func";
# alias jj="directory=$(echo '$(dirs | tr " " "\n" | fzf)') && cd $(echo '$directory')"
alias jj="func() { local directory; directory=$(echo '$(fasd -Rdl | fzf --no-sort --preview="CLICOLOR_FORCE=1 ls -G {}" --reverse)') && cd $(echo '$directory'); }; func";
alias jl="func() { jupyter lab $(echo '$(fd ^ $@ --type f --extension ipynb | fzf -m --preview="jupyter nbconvert --to markdown {} --stdout" || echo -h)'); }; func";
alias jn="func() { jupyter notebook $(echo '$(fd ^ $@ --type f --extension ipynb | fzf -m --preview="jupyter nbconvert --to markdown {} --stdout" || echo -h)'); }; func";
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && cd $(echo '${ntimes// /../}'); }; func";
alias l="git log --pretty=format:'%C(yellow)%h %Creset%s %Cblue[%cn]%Cred%d' --decorate"
alias lp="git log -p --word-diff=color"
alias la="ls -a"
alias lah="ls -ah"
alias lal="ls -al"
alias ll="ls -l"
alias ld="git log --pretty=format:'%C(yellow)%h %C(green)[%ad] %Creset%s %Cblue[%cn]%Cred%d' --decorate --date=short"
alias lr="git log --pretty=format:'%C(yellow)%h %C(green)[%ad] %Creset%s %Cblue[%cn]%Cred%d' --decorate --date=relative"
alias m="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func";
alias mc="git mergetool -yt code --extcmd 'code --wait'"
alias mcs="git mergetool -yt code --extcmd 'code --wait' --cached"
alias mn="git mergetool -yt nvim --extcmd 'nvim -d'"
alias mns="git mergetool -yt nvim --extcmd 'nvim -d' --cached"
alias mt="git mergetool -yt vimdiff" # mv is taken
alias mts="git mergetool -yt vimdiff --cached"
alias mu="git mergetool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias mus="git mergetool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached"
# alias mp="git mergetool -yt pycharm --extcmd 'pycharm merge'"
# alias mps="git mergetool -yt pycharm --extcmd 'pycharm merge'"
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func";
alias n="nvim"
alias nd="func() { n $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias nf="func() { n $(echo '$(fd ^ $@ --type f | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" || echo -h)'); }; func";
# alias ng="func() { n $(echo '$(grep -nr --exclude-dir={.git,.idea,.vscode} --color=always $@ * | fzf --ansi --no-sort --reverse | cut -d: -f1,2 | sed "s/:/ +/")'); }; func";
alias ng="func() { read -r file line <<<$(echo '$(grep -nr --exclude-dir={.git,.idea,.vscode} --color=always ${@:-^} * | fzf --ansi --no-sort --reverse | cut -d: -f1,2 | sed "s/:/ +/")') && [ ! -z $(echo '$file') ] || [ ! -z $(echo '$line') ] && n $(echo '$file' '$line'); }; func";
alias nl="func() { n $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} ${@:-^} * | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" --reverse || echo -h)'); }; func";
alias nh="n -c History" # this only works with -c, not --cmd
alias nn="n $(echo '$(fasd -Rfl | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" --reverse || echo -h)')"
alias no="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias nr="n $(echo '$(n -u NONE -es "+pu =v:oldfiles" +%p +q! | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" --reverse || echo -h)')"
alias ns="func() { n -S $(echo '~/.config/nvim/session/$1.vim'); }; func";
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias nu="n -u ~/.SpaceVim/init.vim"
alias o="open"
alias od="func() { o $(echo '$(fd ^ $@ --type d | fzf -m --no-sort --preview="CLICOLOR_FORCE=1 ls -G {}" --reverse || echo -h)'); }; func";
alias of="func() { o $(echo '$(fd ^ $@ --type f | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" --reverse || echo -h)'); }; func";
alias oo="o $(echo '$(fasd -Ral | fzf -m || echo -h)')"
alias p="git push"
alias pc="pycharm"
alias pd="pycharm diff"
alias py="python"
alias pm="pycharm merge"
alias pf="git push --force"
alias pom="git push origin master"
alias r="ranger"
alias rr="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func";
alias rot13="func() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < $(echo '$1') > temp.txt && mv temp.txt $(echo '$1'); }; func";
alias ra="git remote add"
alias rau="git remote add upstream"
alias rc="git rebase --continue"
alias rs="git reset --soft" # resets by default to HEAD
alias rh="func() { git reset $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhh="func() { git reset --hard $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rsh="func() { git reset --soft $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rq="git rebase --quit"
alias rs="git rebase --skip"
alias rv="git remote -v"
alias s="git status"
alias sa="git stash apply"
alias sc="git stash clear"
alias sd="git stash drop"
alias sl="git stash list"
alias sp="git stash pop"
alias spa="git stash save --all && git pull && git stash apply"
alias spp="git stash save --all && git pull && git stash pop"
alias ss="git stash show"
alias t="tmux"
alias tt="tmux attach -t $(echo '$(tmux list-sessions | fzf -m --no-sort | cut -d: -f1)')"
alias ta="tmux attach -t"
alias ti="tmux info"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new -s"
alias ts="tmux switch -t"
alias u="git pull"
alias uo="git pull origin"
alias uom="git pull origin master"
alias ur="git pull --rebase"
alias uru="git pull --rebase upstream"
alias urum="git pull --rebase upstream master"
alias v="$EDITOR"
alias vd="func() { v $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias vf="func() { v $(echo '$(fd ^ $@ --type f | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" --reverse || echo -h)'); }; func";
# alias vg="func() { v $(echo '$(grep -nr --exclude-dir={.git,.idea,.vscode} --color=always $@ * | fzf --ansi --no-sort --reverse | cut -d: -f1,2 | sed "s/:/ +/")'); }; func";
alias vg="func() { local file; local line; read -r file line <<<$(echo '$(grep -nr --exclude-dir={.git,.idea,.vscode} --color=always ${@:-^} * | fzf --ansi --no-sort --reverse | cut -d: -f1,2 | sed "s/:/ +/")') && [ ! -z $(echo '$file') ] || [ ! -z $(echo '$line') ] && v $(echo '$file' '$line'); }; func";
alias vl="func() { v $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} ${@:-^} * | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" --reverse || echo -h)'); }; func";
alias vh="v -c History" # this only works with -c, not --cmd
alias vn="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias vo="v -c 'browse oldfiles'" # this only works with -c, not --cmd
# alias vr="v $(echo '${$(v -u ~/.vimrc -es "+set nonumber" "+pu =v:oldfiles" +%p +q! | fzf -m || echo -h)/\~/$HOME}')"
alias vr="v $(echo '${$(grep "^> " ~/.viminfo | cut -c3- | fzf -m --reverse || echo -h)/\~/$HOME}')"
alias vs="func() { v -S $(echo '~/.vim/session/$1.vim'); }; func";
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias vu="v -u ~/.SpaceVim/vimrc"
alias vv="v $(echo '$(fasd -Rfl | fzf -m --no-sort --preview "bat --style=numbers --color=always {}" --reverse || echo -h)')"
# use z alias from fasd plugin instead of z plugin
alias zc="fasd -de code"
alias zl="fasd -dl" # list all directories
alias zn="fasd -de nvim"
alias zo="fasd -de open"
alias zp="fasd -de pycharm"
alias zu="fasd -de 'vim -u ~/.SpaceVim/vimrc'"
alias zv="fasd -de '$EDITOR'"

# brew installed python
# export PATH=/usr/local/bin/python3:$PATH
# miniconda python
export PATH=$HOME/miniconda3/bin:$PATH

bindkey -v
bindkey '\e.' insert-last-word
bindkey '\eb' backward-word
bindkey '\ed' delete-word
bindkey '\ef' forward-word
bindkey '\el' down-case-word
bindkey '\et' transpose-words
bindkey '\eu' up-case-word
bindkey '\ey' yank-pop
bindkey '^?' backward-delete-char
bindkey '^n' down-history
bindkey '^p' up-history
bindkey '^_' undo
bindkey '^a' beginning-of-line
bindkey '^b' backward-char
bindkey '^d' delete-char
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^h' backward-delete-char
bindkey '^k' kill-line
bindkey '^u' backward-kill-line
bindkey '^w' backward-kill-word
bindkey '\eh' backward-kill-word
bindkey '^y' yank

# the above is modified from https://dougblack.io/words/zsh-vi-mode.html

# ctrl-d in normalmode brings up info about the thing under the caret!!!

# https://www.youtube.com/watch?v=eLEo4OQ-cuQ
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# https://nuclearsquid.com/writings/edit-long-commands/
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line; zle -N edit-command-line
# Emacs style
bindkey '^x^e' edit-command-line
# Vi style:
# bindkey -M vicmd v edit-command-line

# https://github.com/clvv/fasd#tab-completion
bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (files and directories)
bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

# taken from https://emily.st/2013/05/03/zsh-vi-cursor/
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      echo -ne '\e[1 q';; # block cursor
        viins|main) echo -ne '\e[5 q';; # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    echo -ne '\e[1 q' # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

export KEYTIMEOUT=1

prompt_context() {}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# https://github.com/sharkdp/fd#using-fd-with-fzf
# https://github.com/junegunn/fzf#respecting-gitignore
export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
