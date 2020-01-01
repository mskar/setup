
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
plugins=(fasd fd fzf git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='/usr/local/bin/vim'
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
alias aca="git add --all && git commit --amend"
alias acam="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit --amend -m $(echo '$message'); }; func"
alias acamp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit --amend -m $(echo '$message') && git push --force; }; func"
alias acap="git add --all && git commit --amend && git push --force"
alias acar="git add --all && git commit --amend --reuse-message=HEAD"
alias acarp="git add --all && git commit --amend --reuse-message=HEAD && git push --force"
alias acm="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit -m $(echo '$message'); }; func"
alias acmp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | cut -c4- | tr "\n" " ")'); fi && git add --all && git commit -m $(echo '$message') && git push; }; func"
alias acp="git add --all && git commit && git push"
alias acrp="git add --all && git commit --reuse-message=HEAD && git push"
alias ai="git add --interactive"
alias b="git branch"
alias ba="git branch -a"
alias br="git branch -r"
alias c="func() { git clone $(echo '$1 ${1#*.*/}') && cd $(echo '${1#*.*/}'); }; func";
alias caa="git commit --amend -a"
alias caam="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit --amend -am $(echo '$message'); }; func"
alias caamp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit --amend -am $(echo '$message') && git push --force; }; func"
alias caap="git commit --amend -a && git push --force"
alias caar="git commit --amend -a --reuse-message=HEAD"
alias caarp="git commit --amend -a --reuse-message=HEAD && git push --force"
alias cam="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit -am $(echo '$message'); }; func"
alias camp="func() { if $(echo '[ ! -z $1 ]'); then; message=$(echo '$@'); else; message='Changed files: '$(echo '$(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")'); fi && git commit -am $(echo '$message') && git push; }; func"
alias cap="git commit -a && git push"
alias carp="git commit -a --reuse-message=HEAD && git push"
alias cf="git clean -f"
alias cfd="git clean -fd"
alias cn="git clean -n"
alias cnd="git clean -nd"
alias co="git checkout"
alias coh1="git checkout HEAD^"
alias coh="git checkout HEAD"
alias com="git checkout master"
alias d="git diff --word-diff=color"
alias dc="git diff --word-diff=color --cached" # --staged is a synonym of --cached
alias dt="git difftool --tool vimdiff"
alias dtc="git difftool --tool vimdiff --cached" # --staged is a synonym of --cached
alias dty="git difftool -yt vimdiff"
alias dtyc="git difftool -yt vimdiff --cached" # --staged is a synonym of --cached
alias dh1="git diff --word-diff=color HEAD^"
alias dh="git diff --word-diff=color HEAD"
alias e="export"
# use fasd builtin f alias: alias f='fasd -f'
# use fd instead of find
alias fl='fasd -fl'
alias fn="fasd -fe nvim"
alias fo="fasd -fe open"
alias fv="fasd -fe '$EDITOR'" # relies on EDITOR variable from line 121
# alias fixname="for f in *\ *; do mv $f '$(date "+%Y-%m-%d")_${f// /-}"; done;"
alias g="grep --color=auto --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=auto --exclude-dir={.git,.idea,.vscode}"
alias h='history'
alias i="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func";
alias ie="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func";
alias iee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func";
alias j="func() { directory=$(echo '$(find $@ -type d -not -path "*.*" | fzf)') && cd $(echo '$directory'); }; func";
alias jj="func() { directory=$(echo '$(fasd -dl | fzf)') && cd $(echo '$directory'); }; func";
alias jl="func() { jupyter lab $(echo '$(fd $@ --type f --extension ipynb | fzf -m || echo -h)'); }; func";
alias jn="func() { jupyter notebook $(echo '$(fd $@ --type f --extension ipynb | fzf -m || echo -h)'); }; func";
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
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func";
alias n="nvim"
alias nd="nvim -d"
alias nf="func() { n $(echo '$(fd $@ --type f | fzf -m || echo -h)'); }; func";
# alias ng="func() { n $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | tr "\n" " ")'); }; func";
alias ng="func() { n $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | fzf -m || echo -h)'); }; func";
alias nn="n $(echo '$(fasd -fl | fzf -m || echo -h)')"
alias ns="func() { n -S $(echo '~/.config/nvim/session/$1.vim'); }; func";
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias o="open"
alias od="func() { open $(echo '$(find $@ -type d -not -path "*.*" | fzf -m  || echo -h)'); }; func";
alias of="func() { open $(echo '$(fd $@ --type f | fzf -m || echo -h)'); }; func";
alias oo="open $(echo '$(fasd -al | fzf -m || echo -h)')"
alias p="git push"
alias pf="git push --force"
alias pom="git push origin master"
alias r="ranger"
alias rr="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func";
alias rot13="func() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < $(echo '$1') > temp.txt && mv temp.txt $(echo '$1'); }; func";
alias ra="git remote add"
alias rau="git remote add upstream"
alias rc="git rebase --continue"
alias rh1="git reset HEAD^"
alias rh="git reset HEAD"
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
alias ta="tmux attach -t"
alias ti="tmux info"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new -s"
alias ts="tmux switch -t"
alias u="git pull"
alias ur="git pull --rebase"
alias uru="git pull --rebase upstream"
alias urum="git pull --rebase upstream master"
alias v="$EDITOR"
alias vd="v -d"
alias vf="func() { v $(echo '$(fd $@ --type f | fzf -m || echo -h)'); }; func";
alias vv="v $(echo '$(fasd -fl | fzf -m || echo -h)')"
# alias vg="func() { v $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | tr "\n" " ")'); }; func";
alias vg="func() { v $(echo '$(grep -lr --exclude-dir={.git,.idea,.vscode} $@ * | fzf -m || echo -h)'); }; func";
alias vn="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias vs="func() { v -S $(echo '~/.vim/session/$1.vim'); }; func";
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
# get z alias from from fasd plugin instead of z plugin
alias zl="fasd -dl" # list all directories
alias zn="fasd -de nvim"
alias zo="fasd -de open"
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
