# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
TERM=xterm-256color
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
# SABLE_AUTO_TITLE="true"

POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='220'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\uf0da'
POWERLEVEL9K_VCS_GIT_ICON='\ue60a'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='09'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='10'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='11'
POWERLEVEL9K_DIR_HOME_BACKGROUND="12"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="13"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="14"
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
# POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"

#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
POWERLEVEL9K_ANACONDA_BACKGROUND='214'
POWERLEVEL9K_RAM_BACKGROUND='147'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs vcs virtualenv anaconda dir time ram battery)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_TIME_FORMAT="%D{%Y-%m-%d \uf073 %H:%M}" # \uf017 = clock

POWERLEVEL9K_STATUS_VERBOSE=false
#https://github.com/bhilburn/powerlevel9k
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "

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
# fasd # I don't think this plugin does anything useful: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fasd
# fd # Adds completion for fd: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/fd/_fd
# fzf # enables fzf fuzzy auto-completion and key bindings: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
# git # I don't think this plugin does anything useful: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# github # TODO Replace these functions with alises: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github
# ripgrep # Adds completion for ripgrep: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ripgrep
# tmux # I don't think this plugin does anything useful: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

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

# Initialize fasd and its aliases
eval "$(fasd --init auto)"

# git
## add
alias a="git add"
alias aa="func() { local files; files=$(echo '$(git status -s | fzf --nth=2.. --preview="if [ \$(git ls-files --other --exclude-standard {2..} | sed s/\ //g) ]; then; git diff --color=always --color-words --no-index -- /dev/null {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; git diff --color=always --color-words {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi" | cut -c4-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git add $(echo '$@') --; }; func"
# Add --reedit-message=HEAD to all git commit aliases not named *r*, *a*a*, or *m*
alias ac="git add --all && git commit --reedit-message=HEAD"
alias aca="git add --all && git commit --amend --reset-author"
alias aca="git add --all && git commit --amend --reset-author"
alias acam="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; } --reset-author; func";
alias acamp="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func";
alias acap="git add --all && git commit --amend --reset-author && git push --force"
alias acap="git add --all && git commit --amend --reset-author && git push --force"
alias acar="git add --all && git commit --amend --reset-author --reuse-message=HEAD"
alias acarp="git add --all && git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias acm="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias acmp="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias acp="git add --all && git commit --reedit-message=HEAD && git push"
alias acpf="git add --all && git commit --reedit-message=HEAD && git push --force"
alias acr="git add --all && git commit --reset-author --reuse-message=HEAD"
alias acr="git add --all && git commit --reset-author --reuse-message=HEAD"
alias acrp="git add --all && git commit --reset-author --reuse-message=HEAD && git push"
alias acrp="git add --all && git commit --reset-author --reuse-message=HEAD && git push"
alias acrpf="git add --all && git commit --reset-author --reuse-message=HEAD && git push --force"
alias ai="git add --interactive"
alias ap="git add --patch"
## branch
alias b="git branch"
alias bD="git branch -D" # delete branch (even if not merged)
alias ba="git branch --all"
alias bb="func() { local branch; branch=$(echo '$(git branch --color=always --verbose | fzf --ansi --bind="alt-x:execute-silent(git branch -D {1})+reload(git branch --color=always --verbose)" --preview="git diff --color=always \$(echo \$(git rev-parse --abbrev-ref HEAD)..{1}) | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" | cut -c3- | cut -d " " -f1)') && [ $(echo '$branch') ] && git checkout $(echo '$branch'); }; func"
alias bd="git branch --delete" # delete fully merged branch
alias bs="git branch --set-upstream-to=origin/master master"
## clone
alias c="func() { git clone $(echo '$1 ${1#*.*/}') && cd $(echo '${1#*.*/}'); }; func";
## commit
alias am="git commit --amend --reset-author"
alias amp="git commit --amend --reset-author && git push --force"
alias amr="git commit --amend --reset-author --reuse-message=HEAD"
alias amrp="git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias caa="git commit --all --amend --reset-author"
alias caam="func() { git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author; }; func";
alias caamp="func() { git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func";
alias caap="git commit --all --amend --reset-author && git push --force"
alias caar="git commit --all --amend --reset-author --reuse-message=HEAD"
alias caarp="git commit --all --amend --reset-author --reuse-message=HEAD && git push --force"
# ca is used below for a conda alias
alias cam="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias camp="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias campf="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
alias cap="git commit --all --reedit-message=HEAD && git push"
alias capf="git commit --all --reedit-message=HEAD && git push --force"
alias car="git commit --all --reuse-message=HEAD"
alias carp="git commit --all --reuse-message=HEAD && git push"
alias carpf="git commit --all --reuse-message=HEAD && git push --force"
alias cc="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- $@') }; func"
alias cm="func() { git commit --message \"$(echo '${*:-Changed files: $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")}')\"; }; func";
alias cmp="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias cmpf="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
# cr is used below for a conda alias
alias crp="git commit --reuse-message=HEAD && git push"
alias crpf="git commit --reuse-message=HEAD && git push --force"
## clean
alias cf="git clean -f"
alias cfd="git clean -fd"
alias cff="func() {local untracked; untracked=$(echo '$(git clean -dfn | sed s/^Would\ remove\ // | fzf)') && [ $(echo '$untracked') ] && echo $(echo '$untracked') | tr '\n' '\0' | xargs -0 git clean -df; }; func";
alias cn="git clean -n"
alias cnd="git clean -nd"
## checkout
alias co="git checkout"
alias cob="git checkout -b"
alias cof="func() { local files; files=$(echo '$(git diff HEAD --diff-filter=M --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git checkout HEAD --; }; func"
alias coh="func() { git checkout $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias com="git checkout master"
## diff
alias d="git diff --word-diff=color"
alias dc="git difftool -yt code --extcmd 'code --wait --diff'"
alias dcs="git difftool -yt code --extcmd 'code --wait --diff' --cached" # --staged is a synonym of --cached
alias dd="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && dt $(echo '$commit -- $@') }; func"
alias dh="func() { git diff --word-diff=color $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias dl="git diff --word-diff=color"
alias dn="git difftool -yt nvim --extcmd 'nvim -d'"
alias dns="git difftool -yt nvim --extcmd 'nvim -d' --cached" # --staged is a synonym of --cached
alias ds="git diff --word-diff=color --cached" # --staged is a synonym of --cached
alias dt="git difftool -yt vimdiff" # difftool is dt to match mergetool (mt)
alias dts="git difftool -yt vimdiff --cached" # --staged is a synonym of --cached
alias du="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias dus="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached" # --staged is a synonym of --cached
alias dw="git diff --word-diff=color"
# alias dp="git difftool -yt pycharm --extcmd 'pycharm diff $LOCAL $REMOTE'"
# alias dps="git difftool -yt pycharm --extcmd 'pycharm diff'"
## hub
alias h='hub'
alias hb="hub browse"
alias hc="hub create"
alias hd="hub delete"
alias hf="hub fork"
alias hg="hub gist"
alias hi="hub issue"
alias ho="hub compare"
alias hp="hub pr"
alias hr="hub release"
alias hs="hub ci-status"
alias hs="hub sync"
alias hu="hub pull-request"
## ignore (put in .gitignore)
alias ig="func() { echo $(echo 'echo $@ | tr " " "\n" >> $(git rev-parse --show-toplevel)/.gitignore'); }; func";
alias ii="func() { local files; files=$(echo '$(git ls-files --others --exclude-standard | fzf)') && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -I file bash -c 'echo "file" >> \$(git rev-parse --show-toplevel)/.gitignore'; }; func";
## init
alias i="func() { cookiecutter gh:mskar/cookiecutter --no-input proj_name=$(echo '$1') proj_desc=$(echo '${2:-""}') is_private=$(echo '${3:-"false"}') user_name=$(echo '${4:-"mskar"}') full_name=$(echo '${5:-"Martin Skarzynski"}') && cd $(echo '$(echo "$1" | tr "[:upper:]" "[:lower:]" | tr " " "_")') && make git; }; func";
## grep
alias gg="func() { local commit_file; commit_file=$(echo '$(git grep -l ${1:-^} $(git rev-list --all --abbrev-commit) -- ${@:2} | fzf --bind="alt-enter:execute-silent(git checkout {1} -- {2})+down" --delimiter=: --no-multi --nth=2.. --preview="git diff HEAD --color=always {1} {2} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$commit_file') ] && echo -n $(echo '$commit_file') | tr ':' '\0' | xargs -0 git checkout; }; func"
## log
alias l="git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D'"
alias ld="git log --format='%C(cyan)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --date=short"
alias ll="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" -S $1 -- ${@:2} | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- ${@:2}') }; func"
alias lp="git log -p --word-diff=color"
alias lr="git log --format='%C(cyan)%>(12,trunc)%ar %Creset%<(80,trunc)%s %Cblue%h %Cgreen%<(17,trunc)%cn %Cred%D'"
## merge
alias mc="git mergetool -t code --extcmd 'code --wait'"
alias mcs="git mergetool -t code --extcmd 'code --wait' --cached"
alias mm="func() { local file; file=$(echo '$(git diff --diff-filter=U --name-only --relative | fzf --bind="alt-o:execute-silent(git checkout --ours {} && git add {})+reload(git diff --diff-filter=U --name-only --relative),alt-t:execute-silent(git checkout --theirs {} && git add {})+reload(git diff --diff-filter=U --name-only --relative)" --preview="git log --color=always --color-words --format=\"%n%C(cyan)%>(12,trunc)%ar %Cred%D %Creset%s %Cgreen%cn %Cblue%h\" --merge --patch -- {} | sed 1d | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +Gvdiff! -- $(echo '$file'); }; func";
alias mn="git mergetool -t nvim --extcmd 'nvim -d'"
alias mns="git mergetool -t nvim --extcmd 'nvim -d' --cached"
alias mt="git mergetool -t vimdiff" # mv is taken
alias mts="git mergetool -t vimdiff --cached"
alias mu="git mergetool -t nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias mus="git mergetool -t nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached"
# alias mp="git mergetool -t pycharm --extcmd 'pycharm merge'"
# alias mps="git mergetool -t pycharm --extcmd 'pycharm merge'"
## push
alias p="git push"
alias pf="git push --force"
alias po="git push origin"
alias pof="git push origin --force"
alias pom="git push origin master"
alias pomf="git push origin master --force"
## rebase
alias rba="git rebase --abort"
alias rbc="git rebase --continue"
alias rbq="git rebase --quit"
alias rbs="git rebase --skip"
## remote
alias ra="git remote add"
alias rah="func() { git remote add hub https://github.com/$(echo '$@'); }; func";
alias ral="func() { git remote add lab https://gitlab.com/$(echo '$@'); }; func";
alias rao="git remote add origin"
alias rau="git remote add upstream"
alias rrm="git remote remove"
alias rrmo="git remote remove origin"
alias rrmu="git remote remove upstream"
alias rsu="git remote set-url"
alias rsuo="git remote set-url origin"
alias rsuoa="func() { git remote set-url origin $(echo '$@') --add; }; func";
alias rsuu="git remote set-url upstream"
alias rsuua="func() { git remote set-url upstream $(echo '$@') --add; }; func";
alias rv="git remote -v"
## reset
alias r="git reset"
alias rh="func() { git reset $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhh="func() { git reset --hard $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhs="func() { git reset --soft $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rr="func() { local files; files=$(echo '$(git diff --cached --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git reset HEAD --; }; func"
alias rs="git reset --soft" # resets by default to HEAD
## stash
alias sa="git stash apply"
alias sb="git stash branch"
alias sc="git stash clear"
alias sd="git stash drop"
alias sl="git stash list"
alias sp="git stash push"
alias ss="func() { local stash; stash=$(echo '$(git stash list --format="%gd %s" | fzf --bind="alt-enter:execute-silent(git stash pop {1})+reload(git stash list --format=%gd\ %s),alt-x:execute-silent(git stash drop {1})+reload(git stash list --format=%gd\ %s)" --no-multi --preview="git stash show --color=always {1} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="60%" --with-nth=4.. | cut -d " " -f1)') && [ $(echo '$stash') ] && git stash pop $(echo '$stash') }; func"
alias su="git stash push && git pull"
alias sub="git stash push && git pull && git stash branch"
alias sup="git stash push && git pull && git stash pop"
## status
alias s="git status"
## update (git pull)
alias u="git pull"
alias uo="git pull origin"
alias uom="git pull origin master"
alias ur="git pull --rebase"
alias uru="git pull --rebase upstream"
alias urum="git pull --rebase upstream master"

# installation and environment management
## brew
alias bi="brew install"
alias bl="brew list"
alias br="git branch --remotes"
## conda
alias ca="conda activate"
alias cda="conda deactivate"
alias ce="conda env"
alias cec="conda env create -yc conda-forge -n"
alias cee="conda env export > environment.yaml"
alias cel="conda env list"
alias cer="conda env remove"
alias cern="conda env remove -n"
alias cerp="conda env remove -p"
alias ceu="conda env update"
alias ci="conda install -yc conda-forge"
alias ciz="conda init zsh"
alias cl="conda list"
alias cr="conda remove"
alias cu="conda update"

# edit file(s)
## fasd
### fc is a built-in command that is used by fzf ctrl-r
alias fn="fasd -fe 'nvim'"
alias fo="fasd -fe open"
alias fp="fasd -fe pycharm"
alias fu="fasd -fe 'nvim -u ~/.SpaceVim/init.vim'"
alias fv="fasd -fe '$EDITOR'" # relies on EDITOR variable from line 121
## jupyter notebooks
alias jl="func() { local ipynb; ipynb=$(echo '$(fd --type f --extension ipynb ^ $@ | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func";
alias jn="func() { local ipynb; ipynb=$(echo '$(fd --type f --extension ipynb ^ $@ | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func";
## neovim
alias n="nvim"
alias nd="func() { n $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ne="func() { local files; files=$(echo '$(n -u NONE -es "+pu =v:oldfiles" +%p +q! | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias nf="func() { local files; files=$(echo '$(fd --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias ng="func() { local file; file=$(echo '$(rg -l $@ | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias nh="n -c History" # this only works with -c, not --cmd
alias nl="func() { local files; files=$(echo '$(rg -l $@ | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nn="func() { local files; files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias no="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias np="func() { local files; files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nr="func() { local files; files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias ns="func() { n -S $(echo '~/.config/nvim/session/$1.vim'); }; func";
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias nu="n -u ~/.SpaceVim/init.vim"
alias nw="func() { local files; files=$(echo '$(fd -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0 -n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 nvim --; }; func";
## pycharm
alias pc="pycharm"
alias pd="pycharm diff"
alias pm="pycharm merge"
alias pp="func() { local files; files=$(echo '$(fd -e js --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 pycharm; }; func";
alias py="python"
# vim
alias v="$EDITOR"
alias vd="func() { v $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ve="func() { local files; files=$(echo '$(v -es --noplugin -u ~/.vimrc "+set nonumber" "+pu =v:oldfiles" +%p +q! | sed /^.$/d | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vf="func() { local files; files=$(echo '$(fd --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vfh="func() { local files; files=$(echo '$(fd --type f --hidden ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vg="func() { local file; file=$(echo '$(rg -l $@ | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias vh="v -c History" # this only works with -c, not --cmd
alias vl="func() { local files; files=$(echo '$(rg -l $@ | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vo="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias vp="func() { local files; files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vr="func() { local files; files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vs="func() { v -S $(echo '~/.vim/session/$1.vim'); }; func";
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias vu="v -u ~/.SpaceVim/vimrc"
alias vv="func() { local files; files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vw="func() { local files; files=$(echo '$(fd -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0 -n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
# webstorm
alias ww="func() { local files; files=$(echo '$(fd -e js --type f ^ $@ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 webstorm; }; func";

# list files and dirs
## exa
alias e="exa --all --classify --color=always"
alias et="exa --all --classify --color=always --tree"
alias el="exa --all --classify --color=always --tree | less"
alias em="exa --all --classify --color=always --tree | more"
## fasd
### use fasd builtin f alias: alias f='fasd -f'
alias fl='fasd -fl'
## ls
alias la="ls -a"
alias lah="ls -ah"
alias lal="ls -al"
### use fasd builtin z alias: alias z='fasd -d'

# grep
alias g="grep --color=always --exclude-dir={.git,.idea,.vscode}"
alias gi="grep -i --color=always --exclude-dir={.git,.idea,.vscode}"
alias gir="grep -ir --color=always --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=always --exclude-dir={.git,.idea,.vscode}"

# jump through the filesystem
alias 0="directory=$(echo '$(dirs -v | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --preview="exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --with-nth=4..)') && cd $(echo '$directory')"
alias j="func() { local directory; directory=$(echo '$(fd --type d ^ $@ | fzf --no-multi --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && cd $(echo '$directory'); }; func";
alias jj="func() { local directory; directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --with-nth=4..)') && cd $(echo '$directory'); }; func";
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && cd $(echo '${ntimes// /../}'); }; func";
### use fasd builtin zz alias

# make directory
alias m="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func";

# open
alias o="open"
## files
alias of="func() { local files; files=$(echo '$(fd --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias oh="func() { local files; files=$(echo '$(fd -e html --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias op="func() { local files; files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias or="func() { local files; files=$(echo '$(fd -e Rproj --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias ow="func() { local files; files=$(echo '$(fd -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
## directories
alias od="func() { local directory; directory=$(echo '$(fd --type d ^ $@ | fzf --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && [ $(echo '$directory') ] && echo $(echo '$directory') | tr '\n' '\0' | xargs -0 open; }; func";
## both
alias ee="func() { local both; both=$(echo '$(exa --all --classify --color=always $@ | fzf --ansi --preview="if [[ {} == */ ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open --; }; func"
alias oo="func() { local both; both=$(echo '$(fasd -Ral | fzf --preview="if [[ \"$(fasd -Rdl)\" =~ {} ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open; }; func"

# tmux
alias t="tmux"
alias ta="tmux attach -t"
alias ti="tmux info"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new -s"
alias ts="tmux switch -t"
alias tt="tmux attach -t $(echo '$(tmux list-sessions | fzf -m --no-sort | cut -d: -f1)')"

# Open dir in ...
### use z alias from fasd plugin instead of z plugin
alias zc="fasd -de code"
alias zl="fasd -dl" # list all directories
alias zn="fasd -de 'nvim'"
alias zo="fasd -de open"
alias zp="fasd -de pycharm"
alias zu="fasd -de 'vim -u ~/.SpaceVim/vimrc'"
alias zv="fasd -de '$EDITOR'"

# Misc
## remove spaces from names
alias fixnames="for f in *\ *; do mv '$f' '${f// /-}'; done;"
## if then else
alias it="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func";
alias ite="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func";
alias itee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func";
# map
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func";
# alias r="ranger"
alias render="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func";
alias rot13="func() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < $(echo '$1') > temp.txt && mv temp.txt $(echo '$1'); }; func";
alias sz="source ~/.zshrc"

# Suffix aliases: use with fzf ctrl-t: even with multiple files
# first file listed determines the command used to open all files
# e.g. `open` will be used when running `image.png file.txt`
# putting file.txt first will open both files in $EDITOR
# Run *.md to open all markdown files in $EDITOR
alias -s ipynb='jupyter lab'
alias -s zip=unzip
alias -s {R,r,rmd,Rmd,vim}="nvim"
alias -s {ahk,js,json,md,py,rst,sh,toml,tex,txt,yaml,yml}="$EDITOR"
alias -s {csv,tsv}=scim
alias -s {doc,docx,html,pdf,ppt,pptx,xls,xlsx}=open
alias -s {gif,jpeg,jpg,png,tiff}=open

# brew installed python
# export PATH=/usr/local/bin/python3:$PATH
# miniconda python
export PATH=$HOME/miniconda/bin:$PATH

bindkey -v
bindkey -M viins '\e.' insert-last-word
bindkey -M viins '\eb' backward-word
bindkey -M viins '\ed' kill-word
bindkey -M viins '\ef' forward-word
bindkey -M viins '\eh' backward-kill-word
bindkey -M viins '\el' down-case-word
bindkey -M viins '\et' transpose-words
bindkey -M viins '\eu' up-case-word
bindkey -M viins '\ey' yank-pop
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^_' undo
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^b' backward-char
bindkey -M viins '^d' delete-char
bindkey -M viins '^e' end-of-line
bindkey -M viins '^f' forward-char
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^k' kill-line
bindkey -M viins '^n' down-history
bindkey -M viins '^p' up-history
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^y' yank

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

# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings

export FZF_DEFAULT_OPTS="--bind=change:top,alt-p:toggle-preview,alt-w:toggle-preview-wrap --cycle --exit-0 --inline-info --multi --no-height --no-sort --preview='bat --style=numbers --color=always {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --preview-window='70%:hidden' --reverse --tiebreak=index"
export FZF_CTRL_T_OPTS="--select-1"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

export FZF_ALT_C_OPTS="--no-multi --preview 'exa --all --classify --color=always -L=2 -T {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --select-1"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/marskar/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/marskar/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/marskar/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/marskar/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

