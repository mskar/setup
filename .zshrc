
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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs dir time background_jobs ram virtualenv anaconda battery)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_TIME_FORMAT="%D{%Y-%m-%d \uf073 %H:%M \uf017}"

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
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

alias 0="dirs -v"
alias a="git add"
alias aca="git add --all && git commit --amend --reuse-message=HEAD"
alias acam="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit --amend -m $(echo '$message'); }; func"
alias acamp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit --amend -m $(echo '$message') && git push; }; func"
alias acap="git add --all && git commit --amend --reuse-message=HEAD && git push --force"
alias acm="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit -m $(echo '$message'); }; func"
alias acmp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit -m $(echo '$message') && git push; }; func"
alias ai="git add --interactive"
alias b="git branch"
alias ba="git branch -a"
alias br="git branch -r"
alias c="func() { git clone $(echo '$1 ${1#*.*/}') && cd $(echo '${1#*.*/}'); }; func";
alias caa="git commit --amend -a --reuse-message=HEAD"
alias caam="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit --amend -am $(echo '$message'); }; func"
alias caamp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit --amend -am $(echo '$message') && git push; }; func"
alias caap="git commit --amend -a --reuse-message=HEAD && git push --force"
alias cam="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit -am $(echo '$message'); }; func"
alias camp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit -am $(echo '$message') && git push; }; func"
alias cf="git clean -f"
alias cfd="git clean -fd"
alias cn="git clean -n"
alias cnd="git clean -nd"
alias co="git checkout"
alias coh1="git checkout HEAD^"
alias coh="git checkout HEAD"
alias com="git checkout master"
alias d="git diff"
alias dc="git diff --cached" # --staged is a synonym of --cached
alias dt="git difftool --tool vimdiff"
alias dtc="git difftool --tool vimdiff --cached" # --staged is a synonym of --cached
alias dh1="git diff HEAD^"
alias dh="git diff HEAD"
alias e="export"
alias f="func() { for $(echo '$1') in $(echo '$2'); do; $(echo '$3'); done; }; func";
alias g="grep --color=auto --exclude-dir={.git,.idea,.vscode}";
alias h='history'
alias i="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func";
alias ie="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func";
alias iee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func";
alias j="func() { directory=$(echo '$(find $@ -type d -not -path "*.git*" | fzf)') && cd $(echo '$directory'); }; func";
alias jl="func() { jupyter lab $(echo '$(find $@ -type f -name "*.ipynb" -not -path "*.git*"| fzf || echo -h)'); }; func";
alias jn="func() { jupyter notebook $(echo '$(find $@ -type f -name "*.ipynb" -not -path "*.git*"| fzf || echo -h)'); }; func";
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && cd $(echo '${ntimes// /../}'); }; func";
alias l="git log --pretty=format:'%C(yellow)%h %Creset%s %Cblue[%cn]%Cred%d' --decorate"
alias la="ls -a"
alias ld="git log --pretty=format:'%C(yellow)%h %C(green)[%ad] %Creset%s %Cblue[%cn]%Cred%d' --decorate --date=short"
alias lr="git log --pretty=format:'%C(yellow)%h %C(green)[%ad] %Creset%s %Cblue[%cn]%Cred%d' --decorate --date=relative"
alias m="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func";
alias n="nvim"
alias nd="nvim -d"
alias nf="func() { n $(echo '$(find $@ -type f -not -path "*.git*" | tr "\n" " ")'); }; func";
alias nff="func() { n $(echo '$(find $@ -type f -not -path "*.git*" | fzf) || echo -h'); }; func";
alias ng="func() { n $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | tr "\n" " ")'); }; func";
alias ngf="func() { n $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | fzf || echo -h)'); }; func";
alias nn="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias o="func() { open $(echo '$(find $@ -type f -not -path "*.git*" | fzf || echo -h)'); }; func";
alias p="git push"
alias pf="git push --force"
alias pom="git push origin master"
alias r="ranger" # R will start an R interactive session
alias ra="git remote add"
alias rau="git remote add upstream"
alias rh1="git reset HEAD^"
alias rh="git reset HEAD"
alias rv="git remote -v"
alias s="git status"
alias sa="git stash apply"
alias sc="git stash clear"
alias sd="git stash drop"
alias sl="git stash list"
alias sp="git stash pop"
alias spa="git stash save && git pull && git stash apply"
alias spp="git stash save && git pull && git stash pop"
alias ss="git stash show"
alias t="tree"
alias u="git pull"
alias ur="git pull --rebase"
alias uru="git pull --rebase upstream"
alias urum="git pull --rebase upstream master"
alias v="/usr/local/bin/vim"
alias vd="/usr/local/bin/vimdiff"
alias vf="func() { v $(echo '$(find $@ -type f -not -path "*.git*" | tr "\n" " ")'); }; func";
alias vff="func() { v $(echo '$(find $@ -type f -not -path "*.git*" | fzf || echo -h)'); }; func";
alias vg="func() { v $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | tr "\n" " ")'); }; func";
alias vgf="func() { v $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | fzf || echo -h)'); }; func";
alias vn="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";

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

# taken from https://emily.st/2013/05/03/zsh-vi-cursor/
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

export KEYTIMEOUT=1

prompt_context() {}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
