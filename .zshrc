# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# Environment
# https://github.com/sharkdp/fd#using-fd-with-fzf
# https://github.com/junegunn/fzf#respecting-gitignore
# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
export PATH=~/.local/bin:/usr/local/texlive/2021basic/bin/universal-darwin:/usr/local/bin:$PATH
export DOOMDIR=$HOME/.doom/doom-emacs-config
export EDITOR=$(brew --prefix)/bin/nvim
export MANPAGER="nvim +Man! +Page"
export MANWIDTH=999
export PAGER=less
export PATH=$(brew --prefix)/Caskroom/mambaforge/base/bin:$PATH
export KEYTIMEOUT=1
export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="'--bind=change:top,ctrl-k:kill-line,ctrl-/:toggle-preview,ctrl-\\:toggle-preview-wrap,alt-y:execute-silent(echo {} | pbcopy)' --cycle --exit-0 --inline-info --multi --no-height --no-sort --preview='if [ -d {} ]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi' --preview-window='70%:hidden' --reverse --tiebreak=index"
export FZF_CTRL_T_OPTS="--select-1"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"
export FZF_ALT_C_OPTS="--no-multi --preview 'exa --all --classify --color=always -L=2 -T {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --select-1"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
# source $HOME/zsh-vim-mode/zsh-vim-mode.plugin.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
WORDCHARS='_'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5' # https://stackoverflow.com/a/47313453
DISABLE_MAGIC_FUNCTIONS=true
CONDA_AUTO_ACTIVATE_BASE=false

# https://cirw.in/blog/bracketed-paste
set zle_bracketed_paste
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Options
# https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/
setopt always_to_end
setopt auto_menu              # show completion menu on successive tab press
setopt autocd
setopt autopushd
setopt complete_in_word
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_save_no_dups
setopt hist_verify            # show command with history expansion to user before running it
setopt pushdignoredups
setopt pushdminus
setopt rmstarsilent
setopt share_history          # share command history data
unsetopt flow_control

# Modules
# https://www.refining-linux.org/archives/40-ZSH-Gem-5-Menu-selection.html
# https://unix.stackexchange.com/a/323282
# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52#gistcomment-3079386
# https://nuclearsquid.com/writings/edit-long-commands/
# https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92#7b11
autoload -U compinit && compinit -C
zstyle ':completion:*' menu select
zmodload -i zsh/complist
autoload -U edit-command-line; zle -N edit-command-line

# Aliases
alias -- -='cd -'
alias -g ......='../../../../..'
alias -g .....='../../../..'
alias -g ....='../../..'
alias -g ...='../..'
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias 0="directory=$(echo '$(dirs -v | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --preview="exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --with-nth=4..)') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && cd $(echo '$directory')"
alias 1="cd -"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"
alias 6="cd -6"
alias 7="cd -7"
alias 8="cd -8"
alias 9="cd -9"
alias \?="func() { alias | grep $(echo '$@') | bat --language=sh --plain; }; func"
alias a="git add"
alias a\.="git add ."
alias a\.c="git add . && git commit --reedit-message=HEAD"
alias a\.ca="git add . && git commit --amend --reset-author"
alias a\.cam="func() { git add . && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; } --reset-author; func"
alias a\.camp="func() { git add . && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force-if-includes --force-with-lease; }; func"
alias a\.campf="func() { git add . && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func"
alias a\.cap="git add . && git commit --amend --reset-author && git push --force-if-includes --force-with-lease"
alias a\.capf="git add . && git commit --amend --reset-author && git push --force"
alias a\.car="git add . && git commit --amend --reset-author --reuse-message=HEAD"
alias a\.carp="git add . && git commit --amend --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias a\.carpf="git add . && git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias a\.cm="func() { git add . && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias a\.cmp="func() { git add . && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias a\.cmpf="func() { git add . && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force-if-includes --force-with-lease; }; func"
alias a\.cp="git add . && git commit --reedit-message=HEAD && git push"
alias a\.cpf="git add . && git commit --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias aa="git add --all"
alias aac="git add --all && git commit --reedit-message=HEAD"
alias aaca="git add --all && git commit --amend --reset-author"
alias aacam="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; } --reset-author; func"
alias aacamp="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force-if-includes --force-with-lease; }; func"
alias aacampf="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func"
alias aacap="git add --all && git commit --amend --reset-author --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias aacapf="git add --all && git commit --amend --reset-author --reedit-message=HEAD && git push --force"
alias aacar="git add --all && git commit --amend --reset-author --reuse-message=HEAD"
alias aacarp="git add --all && git commit --amend --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias aacarpf="git add --all && git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias aacm="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias aacmp="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias aacmpf="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force-if-includes --force-with-lease; }; func"
alias aacp="git add --all && git commit --reedit-message=HEAD && git push"
alias aacpf="git add --all && git commit --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias adduser="func() { curl -X PUT --user mskar:$(echo '$(pass ${4:-ga/github/token})') -H 'Accept: application/vnd.github.v3+json' https://$(echo '${3:-git.generalassemb.ly}')/api/v3/orgs/py/memberships/$(echo '$1') -d '{\"role\":\"$(echo '$(${2:-member})')\"}'; }; func"
alias af="func() { local files=$(echo '$(git status -s | fzf --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=2.. --preview="if [ \$(git ls-files --other --exclude-standard {2..} | sed s/\ //g) ]; then; git diff --color=always --color-words --no-index -- /dev/null {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; git diff --color=always --color-words {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi" | cut -c4-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git add $(echo '$@') --; }; func"
alias ai="git add --interactive"
alias aic="git add --interactive && git commit --reedit-message=HEAD"
alias aica="git add --interactive && git commit --amend --reset-author"
alias aicam="func() { git add --interactive && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; } --reset-author; func"
alias aicamp="func() { git add --interactive && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force-if-includes --force-with-lease; }; func"
alias aicampf="func() { git add --interactive && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func"
alias aicap="git add --interactive && git commit --amend --reset-author --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias aicapf="git add --interactive && git commit --amend --reset-author --reedit-message=HEAD && git push --force"
alias aicar="git add --interactive && git commit --amend --reset-author --reuse-message=HEAD"
alias aicarp="git add --interactive && git commit --amend --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias aicarpf="git add --interactive && git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias aicm="func() { git add --interactive && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias aicmp="func() { git add --interactive && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias aicp="git add --interactive && git commit --reedit-message=HEAD && git push"
alias aicp="git add --interactive && git commit --reedit-message=HEAD && git push"
alias aicpf="git add --interactive && git commit --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias aicpf="git add --interactive && git commit --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias ap="git add --patch"
alias b="git branch"
alias bD="git branch -D" # delete branch (even if not merged)
alias ba="bit save"
alias ba="git branch --all"
alias bbd="brew bundle dump --describe"
alias bbdf="brew bundle dump --describe --force"
alias bbi="brew bundle install --global"
alias bc="bit clone"
alias bco="bit checkout"
alias bd="git branch --delete" # delete fully merged branch
alias bf="func() { local branch=$(echo '$(git branch --color=always --verbose | fzf --ansi --bind="alt-y:execute-silent(echo {} | cut -c3- | cut -d \  -f1 | pbcopy),alt-x:execute-silent(git branch -D {1})+reload(git branch --color=always --verbose)" --preview="git diff --color=always \$(echo \$(git rev-parse --abbrev-ref HEAD)..{1}) | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" | cut -c3- | cut -d " " -f1)') && [ $(echo '$branch') ] && git checkout $(echo '$branch'); }; func"
alias bh="bit show"
alias bi="brew install"
alias bic="brew install --cask"
alias bl="brew list"
alias blc="brew list --cask"
alias blog="bit log"
alias bm="git branch --move"
alias bmm="git branch --move master main && git push --set-upstream origin main && git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main"
alias bo="brew outdated"
alias boc="brew outdated --cask"
alias bp="prettybat"
alias br="git branch --remotes"
alias bs="func() { git branch --set-upstream-to=origin/$(echo '${1:-main}') $(echo '${1:-main}'); }; func"
alias bt="bit status"
alias bu="brew upgrade"
alias buc="brew upgrade --cask"
alias buco="brew upgrade --cask $(echo '$(brew outdated --cask | cut -f1 | tr "\n" " ")')"
alias buo="brew upgrade $(echo '$(brew outdated --formula | cut -f1 | tr "\n" " ")')"
alias bw="bit switch"
alias bx="brew uninstall"
alias bxc="brew uninstall --cask"
alias by="bit sync"
alias c="func() { local directory=$(echo '${2:-${${1#*.*[:/]}%.*}}') && git clone $(echo '$1 $directory ${@:3}') && cd $(echo '$directory'); }; func" # clone and cd into repo, ${parameter#pattern} removes pattern from the beginning, while ${parameter%pattern} removes pattern from the end
alias ca="conda activate"
alias caa="git commit --all --amend --reset-author"
alias caam="func() { git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author; }; func"
alias caamp="func() { git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force-if-includes --force-with-lease; }; func"
alias caampf="func() { git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func"
alias caap="git commit --all --amend --reset-author && git push --force-if-includes --force-with-lease"
alias caapf="git commit --all --amend --reset-author && git push --force"
alias caar="git commit --all --amend --reset-author --reuse-message=HEAD"
alias caarp="git commit --all --amend --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias caarpf="git commit --all --amend --reset-author --reuse-message=HEAD && git push --force"
alias cai="git commit --amend --interactive --reset-author"
alias caim="func() { git commit --amend --interactive --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author; }; func"
alias caimp="func() { git commit --amend --interactive --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force-if-includes --force-with-lease; }; func"
alias caimpf="func() { git commit --amend --interactive --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func"
alias caip="git commit --amend --interactive --reset-author && git push --force-if-includes --force-with-lease"
alias caipf="git commit --amend --interactive --reset-author && git push --force"
alias cair="git commit --amend --interactive --reset-author --reuse-message=HEAD"
alias cairp="git commit --amend --interactive --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias cairpf="git commit --amend --interactive --reset-author --reuse-message=HEAD && git push --force"
alias cam="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias camp="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias campf="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force-if-includes --force-with-lease; }; func"
alias cap="git commit --amend && git push --force-if-includes --force-with-lease"
alias capf="git commit --amend && git push --force"
alias car="git commit --amend --reset-author --reuse-message=HEAD"
alias carp="git commit --amend --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias carpf="git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias ccf="conda env create --file"
alias ccn="conda create -yc conda-forge -n"
alias cda="conda deactivate"
alias cdf="git clean -df"
alias cdff="func() {local untracked=$(echo '$(git clean -dfn | sed s/^Would\ remove\ // | fzf)') && [ $(echo '$untracked') ] && echo $(echo '$untracked') | tr '\n' '\0' | xargs -0 git clean -df; }; func"
alias cdi="git clean -di"
alias ce="conda env"
alias ce="conda env"
alias cee="conda env export > environment.yaml"
alias cel="conda env list"
alias cer="conda env remove"
alias cern="conda env remove -n"
alias cerp="conda env remove -p"
alias ceu="conda env update"
alias cf="git clean --force"
alias cff="func() {local untracked=$(echo '$(git clean --force --dry-run | sed s/^Would\ remove\ // | fzf)') && [ $(echo '$untracked') ] && echo $(echo '$untracked') | tr '\n' '\0' | xargs -0 git clean --force; }; func"
alias ci="conda install -yc conda-forge"
alias cim="func() { git commit --interactive --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias cimp="func() { git commit --interactive --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias cimpf="func() { git commit --interactive --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force-if-includes --force-with-lease; }; func"
alias cip="git commit --interactive && git push --force-if-includes --force-with-lease"
alias cipf="git commit --interactive && git push --force"
alias cir="git commit --interactive --reset-author --reuse-message=HEAD"
alias cirp="git commit --interactive --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias cirpf="git commit --interactive --reset-author --reuse-message=HEAD && git push --force"
alias ciz="conda init zsh"
alias cl="conda list"
alias cm="func() { git commit --message \"$(echo '${*:-Changed files: $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")}')\"; }; func"
alias cmp="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias cmpf="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force-if-includes --force-with-lease; }; func"
alias cn="git clean -n"
alias cnd="git clean -nd"
alias co-="git checkout -"
alias co="git checkout"
alias cob="git checkout -b"
alias cof="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- $@') }; func"
alias coh0="git checkout HEAD~0"
alias coh1="git checkout HEAD~1"
alias coh2="git checkout HEAD~2"
alias coh3="git checkout HEAD~3"
alias coh="git checkout HEAD"
alias cohn="func() { git checkout $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias com0="git checkout HEAD~0"
alias com1="git checkout HEAD~1"
alias com2="git checkout HEAD~2"
alias com3="git checkout HEAD~3"
alias com="git checkout main"
alias comn="func() { git checkout $(echo 'main~${1:-0} ${@:2}'); }; func"
alias cop="git checkout --patch"
alias cp-="git cherry-pick -"
alias cpa="git cherry-pick --abort"
alias cpc="git cherry-pick --continue"
alias cpf="func() { local commits=$(echo '$(git log ${1:-main} --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commits') ] && git cherry-pick $(echo '$commits') }; func"
alias cpick="git cherry-pick"
alias cpm0="git cherry-pick main~0"
alias cpm1="git cherry-pick main~"
alias cpm2="git cherry-pick main~2"
alias cpm3="git cherry-pick main~3"
alias cpm="git cherry-pick main"
alias cpmn="func() { git cherry-pick $(echo 'main~${1:-0} ${@:2}'); }; func"
alias cpn="func() { git cherry-pick $(echo '${1:-main}~${2:-1}'); }; func"
alias cpnn="func() { git cherry-pick $(echo '${1:-main}~${2:-1}..${1:-main}'); }; func"
alias cpq="git cherry-pick --quit"
alias cps="git cherry-pick --skip"
alias cr="conda remove"
alias cra="create-react-app"
alias cu="conda update -y"
alias cx="conda uninstall -y"
alias d="git diff"
alias db="batdiff"
alias dbr="func() { docker build . --tag $(echo '$1') && docker run --detach --env TIMEOUT=0,GRACEFUL_TIMEOUT=0 --name $(echo '$1') $(echo '$1') $(echo '$@:2'); }; func"
alias dbrp="func() { docker build . --tag $(echo '$1') && docker run --detach --env TIMEOUT=0,GRACEFUL_TIMEOUT=0 --name $(echo '$1') $(echo '$1') --publish $(echo '$2:$2') $(echo '$@:3'); }; func"
alias dbt="func() { docker build . --tag $(echo '$1') ; }; func"
alias dc="git diff --cached"
alias df="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git difftool --no-prompt --tool vimdiff $(echo '$commit -- $@') }; func"
alias dh0="git diff HEAD~0"
alias dh1="git diff HEAD~1"
alias dh2="git diff HEAD~2"
alias dh3="git diff HEAD~3"
alias dh="git diff HEAD"
alias dhl="delta -h | less -r"
alias dhn="func() { git diff $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias dm0="git diff main~0"
alias dm1="git diff main~1"
alias dm2="git diff main~2"
alias dm="git diff main"
alias dmn="func() { git diff $(echo 'main~${1:-0} ${@:2}'); }; func"
alias dp="git difftool --no-prompt --extcmd 'pycharm diff $LOCAL $REMOTE'"
alias dps="git difftool --no-prompt --extcmd 'pycharm diff'"
alias dr="func() { docker run --env TIMEOUT=0,GRACEFUL_TIMEOUT=0 $(echo '$1') $(echo '${2:-.}'); }; func"
alias ds="docker stop $(echo 'docker ps -aq')"
alias dsf="delta --side-by-side --diff-so-fancy"
alias dsh="delta --side-by-side --diff-highlight"
alias dss="delta --side-by-side"
alias dt="git difftool --no-prompt --tool vimdiff" # difftool is dt to match mergetool (mt)
alias dtc="git difftool --no-prompt --extcmd 'code --wait --diff'"
alias dtc="git difftool --no-prompt --tool vimdiff --cached"
alias dtcc="git difftool --no-prompt --extcmd 'code --wait --diff' --cached"
alias dtcm="git difftool --no-prompt --extcmd 'code --wait --diff' main"
alias dtcs="git difftool --no-prompt --extcmd 'code --wait --diff' --staged"
alias dtm="git difftool --no-prompt --tool vimdiff main" # difftool is dt to match mergetool (mt)
alias dtn="git difftool --no-prompt --extcmd 'nvim -d'"
alias dtnc="git difftool --no-prompt --extcmd 'nvim -d' --cached"
alias dtnm="git difftool --no-prompt --extcmd 'nvim -d' main"
alias dtns="git difftool --no-prompt --extcmd 'nvim -d' --staged" # same as --cached
alias dts="git difftool --no-prompt --tool vimdiff --staged" # same as --cached
alias dtv="git difftool --no-prompt --tool vimdiff" # difftool is dt to match mergetool (mt)
alias dtvm="git difftool --no-prompt --tool vimdiff main" # difftool is dt to match mergetool (mt)
alias dtvs="git difftool --no-prompt --tool vimdiff --staged" # same as --cached
alias duh="du -h"
alias dw="git diff --word-diff=color"
alias dx="docker rm -f $(echo 'docker ps -aq')"
alias e="emacsclient -t --alternate-editor emacs"
alias ec="emacs -q --load ~/.config/emacs/init.el"
alias ed="emacs -q --load  ~/.doom/doom-emacs/init.el"
alias edc="emacs --daemon -q --load ~/.config/emacs/init.el"
alias edd="emacs --daemon -q --load ~/.doom/doom-emacs/init.el"
alias eds="emacs --daemon -q --load ~/.emacs.d/init.el"
alias ef="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 emacsclient -t --alternate-editor -- ; }; func"
alias ei="emacs -q --load ~/.emacs.d/init.el"
alias eq="emacs -q"
alias eql="emacs -q --load"
alias es="eval `ssh-agent -s`"
alias ex="emacsclient -e '(kill-emacs)'"
alias ez="emacsclient -t --alternate-editor emacs ~/.zshrc"
alias f="fasd -f"
alias fA="fasd -A"
alias fD="fasd -D"
alias fb="fd --type f -X bat"
alias fcl="fc -l"
alias fcld="fc -ld"
alias fclf="fc -lf"
alias fco="func() { git fetch -fu $(echo '${2:-origin} refs/pull/$1/head:pr/$1') && git checkout $(echo 'pr/$1'); }; func"
alias ff="fd --type f"
alias fl="fasd -fl"
alias flat="func() { find $(echo '${1:-.}') -mindepth 2 -type f -exec gmv -ft $(echo '${1:-.}') '{}' + && find $(echo '${1:-.}') -mindepth 1 -depth -type d -exec rmdir {} +; }; func"
alias fn="fasd -fe nvim"
alias fnc="fasd -fe nvim -b current"
alias fnv="fasd -fe nvim -b viminfo"
alias fo="fasd -fe open"
alias fos="fasd -fe open -b spotlight"
alias fp="fasd -fe pycharm"
alias fv="fasd -fe vim"
alias fvc="fasd -fe vim -b current"
alias fvv="fasd -fe vim -b viminfo"
alias g="grep --color=always --exclude-dir={.git,.idea,.vscode}"
alias gb="batgrep" # combines ripgrep (rg) and bat
alias gf="func() { local commit_file=$(echo '$(git grep -l ${1:-^} $(git rev-list --all --abbrev-commit) -- ${@:2} | fzf --bind="alt-enter:execute-silent(git checkout {1} -- {2})+down" --delimiter=: --no-multi --nth=2.. --preview="git diff HEAD --color=always {1} {2} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$commit_file') ] && echo -n $(echo '$commit_file') | tr ':' '\0' | xargs -0 git checkout; }; func"
alias gi="grep -i --color=always --exclude-dir={.git,.idea,.vscode}"
alias gir="grep -ir --color=always --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=always --exclude-dir={.git,.idea,.vscode}"
alias h2s="func() { local name=$(echo '${1:-origin}') && [ $(echo '$name') ] && git remote set-url $(echo '$name $(git remote get-url $name | sed "s+https://+git@+;s+/+:+")') }; func"
alias h="func() { $(echo '$@') --help || $(echo '$@') -h || tldr $(echo '$@') || man $(echo '$@') }; func"
alias ha="gh auth"
alias hai="gh auth login"
alias hao="gh auth logout"
alias har="gh auth refresh"
alias has="gh auth status"
alias hc="gh config"
alias hcg="gh config get"
alias hcs="gh config set"
alias hg="gh gist"
alias hgc="gh gist create"
alias hgcd="func() { gh gist create $(echo '$1') --desc \"$(echo '${*# }')\"; }; func"
alias hgcp="gh gist create --public"
alias hgcpd="func() { gh gist create $(echo '$1') --public --desc \"$(echo '${*# }')\"; }; func"
alias hge="gh gist edit"
alias hgl="gh gist list"
alias hgv="gh gist view"
alias hi="gh issue"
alias hic="gh issue create"
alias hicl="gh issue close"
alias hil="gh issue list"
alias hiro="gh issue reopen"
alias his="gh issue status"
alias hiv="gh issue view"
alias hp="gh pr"
alias hpc="gh pr create"
alias hpch="gh pr checks"
alias hpcl="gh pr close"
alias hpco="gh pr checkout"
alias hpd="gh pr diff"
alias hpl="gh pr list"
alias hpm="gh pr merge"
alias hpr="gh pr ready"
alias hpr="gh pr review"
alias hpro="gh pr reopen"
alias hps="gh pr status"
alias hpv="gh pr view"
alias hr="gh repo"
alias hrc="func() { mkdir -p $(echo '$1') && cd $(echo '$1') && git init && gh repo create $(echo '$1') --private $(echo '${@:3}') --confirm; }; func"
alias hrcd="func() { mkdir -p $(echo '$1') && cd $(echo '$1') && git init && gh repo create $(echo '$1') --private --description \"$(echo '${*# }')\" --confirm; }; func"
alias hrci="func() { mkdir -p $(echo '$1') &&  cd $(echo '$1') &&  git init && gh repo create $(echo '$1') --internal $(echo '${@:2}') --confirm; }; func"
alias hrcid="func() { mkdir -p $(echo '$1') && cd $(echo '$1') &&  git init && gh repo create $(echo '$1') --internal --description \"$(echo '${*# }')\" --confirm; }; func"
alias hrcp="func() { mkdir -p $(echo '$1') && cd $(echo '$1') && git init && gh repo create $(echo '$1') --public $(echo '${@:2}') --confirm; }; func"
alias hrcpd="func() { mkdir -p $(echo '$1') && cd $(echo '$1') && git init && gh repo create $(echo '$1') --public --description \"$(echo '${*# }')\" --confirm; }; func"
alias hrf="gh repo fork"
alias hrv="gh repo view"
alias hrvw="gh repo view --web"
alias i="func() { cookiecutter gh:mskar/cookiecutter --no-input proj_name=$(echo '$1') proj_desc=$(echo '${2:-""}') is_private=$(echo '${3:-"false"}') user_name=$(echo '${4:-"mskar"}') full_name=$(echo '${5:-"Martin Skarzynski"}') && [ $(echo '$1') ] && cd $(echo '$(echo "$1" | tr "[:upper:]" "[:lower:]" | tr " " "_")') && make git env; }; func"
alias ig="func() { echo $(echo 'echo $@ | tr " " "\n" >> $(git rev-parse --show-toplevel)/.gitignore'); }; func"
alias igf="func() { local files=$(echo '$(git ls-files --others --exclude-standard | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -I file bash -c 'echo "file" >> \$(git rev-parse --show-toplevel)/.gitignore'; }; func"
alias it="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func"
alias ite="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func"
alias itee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func"
alias j="func() { local directory=$(echo '$(fd --color=always --type d ^ $@ | fzf --ansi --no-multi)') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && cd $(echo '$directory'); }; func"
alias jf="func() { local directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --with-nth=4..)') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && cd $(echo '$directory'); }; func"
alias jl="func() { local ipynb=$(echo '$(fd --color=always --type f --extension ipynb $@ | fzf --ansi --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func"
alias jlf="func() { local ipynb=$(echo '$(fasd -Rfl | grep ".ipynb$" | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func"
alias jn="func() { local ipynb=$(echo '$(fd --color=always --type f --extension ipynb $@ | fzf --ansi --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func"
alias jnf="func() { local ipynb=$(echo '$(fasd -Rfl | grep ".ipynb$" | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func"
alias jnl="jupyter notebook list"
alias jnlf="func() { local url=$(echo '$(jupyter notebook list | sed 1d | fzf --delimiter=" :: " --nth=1 --with-nth=2 --no-multi --preview="exa --all --classify --color=always -L=2 -T {2} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$url') ] && open $(echo '$url'); }; func"
alias jt="jupytext"
alias jte="jupytext --to notebook --execute"
alias jtn="jupytext --to notebook"
alias jtp="func() { local file=$(echo '${1:-${PWD##*/}}.py') && touch $(echo '$file') && jupytext --set-kernel $(echo '${2:-python3}') $(echo '$file') && jupytext --to notebook --execute $(echo '$file') && jupytext --set-formats $(echo '${3:-ipynb,py,Rmd}') $(echo '${file/%.py/.ipynb}'); }; func"
alias jtr="func() { local file=$(echo '${1:-${PWD##*/}}.r') && touch $(echo '$file') && jupytext --set-kernel $(echo '${2:-ir}') $(echo '$file') && jupytext --to notebook --execute $(echo '$file') && jupytext --set-formats $(echo '${3:-ipynb,r,Rmd}') $(echo '${file/%.[rR]/.ipynb}'); }; func"
alias jts="jupytext --sync"
alias jtt="jupytext --to"
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && [ -d $(echo '${ntimes// /../}') ] && cd $(echo '${ntimes// /../}'); }; func"
alias kg="func() { local label=$(echo '${1:-$(sysctl hw.model | cut -d\  -f2)}') && ssh-keygen -t rsa -b 4096 -f ~/.ssh/$(echo '$label') -C $(echo '$label') && ssh-add ~/.ssh/$(echo '$label') && cat ~/.ssh/$(echo '$label').pub | pbcopy && echo 'Host *\n\tUseKeychain yes\n\tAddKeysToAgent yes\n\tIdentityFile ~/.ssh/'$(echo '$label') >> ~/.ssh/config; }; func"
alias l="~/.local/bin/lvim"
alias lS="func() { lvim -S $(echo '${@:-~/session.vim}'); }; func"
alias la="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o lvim $(echo '$@') --; }; func"
alias lah="ls -ah"
alias lal="ls -al"
alias lc="func() { local cached=$(echo '$(git status --porcelain | grep "^M" | cut -c4- | fzf)') && [ $(echo '$cached') ] && echo $(echo '$cached') | tr '\n' '\0' | xargs -0 -o lvim $(echo '$@') --; }; func"
alias lcp="lvim -c Page"
alias lcu="lvim -c LvimUpdate -c q"
alias le="func() { local files=$(echo '$(v -es --noplugin -u ~/.vimrc "+set nonumber" "+pu =v:oldfiles" +%p +q! | sed /^.$/d | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o lvim $(echo '$@') --; }; func"
alias lf="func() { local files=$(echo '$(fd --color=always --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o lvim --; }; func"
alias lfh="func() { local files=$(echo '$(fd --color=always --type f --hidden $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o lvim --; }; func"
alias lg="func() { local file=$(echo '$(rg -l ${@:-^} | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o lvim +$(echo '$(rg -n ${@:-^} $file | head -n 1 | cut -d: -f1)') --; }; func"
alias lh="lvim -c History" # this only works with -c, not --cmd
alias lo="lvim -c 'browse oldfiles'" # this only works with -c, not --cmd
alias log="git log --format='%C(magenta)%h %C(yellow)%as %C(cyan)%>(8,trunc)%ar %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D'"
alias logd="git log --format='%C(cyan)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --date=short"
alias logf="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" -S $1 -- ${@:2} | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit~ -- ${@:2}') }; func"
alias logg="git log --format='%C(cyan)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --graph"
alias logl="func() { local files=$(echo '$(rg -l ${@:-^} | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o lvim --; }; func"
alias loglm="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' --left-right -- main...$(echo '${1:-upstream}'); }; func"
alias logm="git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' main"
alias logmh="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' origin/main..$(echo '${1:-HEAD}'); }; func"
alias logml="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' --left-right -- $(echo '${1:-upstream}')...main; }; func"
alias logmn="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' main --not $(echo '${1:-upstream}'); }; func"
alias lognm="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' $(echo '${1:-upstream}') --not main; }; func"
alias logp="git log -p"
alias logr="git log --format='%C(cyan)%>(12,trunc)%ar %Creset%<(80,trunc)%s %Cblue%h %Cgreen%<(17,trunc)%cn %Cred%D'"
alias lp="func() { local files=$(echo '$(fd --color=always -e pdf --type f $@ | fzf --ansi --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 -o lvim --; }; func"
alias lpp="lvim +Page"
alias lpu="lvim +LvimUpdate +q"
alias lr="func() { local files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o lvim $(echo '$@') --; }; func"
alias lt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func"
alias lu="func() { local unstaged=$(echo '$(git status --porcelain | grep "^.M" | cut -c4- | fzf)') && [ $(echo '$unstaged') ] && echo $(echo '$unstaged') | tr '\n' '\0' | xargs -0 -o lvim $(echo '$@') --; }; func"
alias lw="func() { local files=$(echo '$(fd --color=always -e docx --type f $@ | fzf --ansi --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 -o lvim --; }; func"
alias lz="lvim ~/.zshrc"
alias m="man"
alias ma="mamba activate"
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func"
alias mb="batman"
alias mc="git mergetool --extcmd 'code --wait'"
alias mcc="git mergetool --extcmd 'code --wait' --cached"
alias mcf="mamba env create -f"
alias mcn="mamba create -c conda-forge -n"
alias mcs="git mergetool --extcmd 'code --wait' --staged"
alias md="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func"
alias mda="mamba deactivate"
alias me="mamba env"
alias mee="mamba env export > environment.yaml"
alias mel="mamba env list"
alias mer="mamba env remove"
alias mern="mamba env remove -n"
alias merp="mamba env remove -p"
alias meu="mamba env update"
alias mf="func() { local file=$(echo '$(git diff --diff-filter=U --name-only --relative | fzf --bind="alt-o:execute-silent(git checkout --ours {} && git add {})+reload(git diff --diff-filter=U --name-only --relative),alt-t:execute-silent(git checkout --theirs {} && git add {})+reload(git diff --diff-filter=U --name-only --relative)" --preview="git log --color=always --color-words --format=\"%n%C(cyan)%>(12,trunc)%ar %Cred%D %Creset%s %Cgreen%cn %Cblue%h\" --patch -- {} | sed 1d | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR '+silent Gvdiff!' -- $(echo '$file'); }; func"
alias mi="mamba install -yc conda-forge"
alias miz="mamba init zsh"
alias ml="mamba list"
alias mn="git mergetool --extcmd 'nvim -d'"
alias mnc="git mergetool --extcmd 'nvim -d' --cached"
alias mns="git mergetool --extcmd 'nvim -d' --staged"
alias mp="mkdir -p"
alias mr="mamba remove"
alias mt="git mergetool --tool vimdiff" # mv is taken
alias mtc="git mergetool --tool vimdiff --cached"
alias mts="git mergetool --tool vimdiff --staged"
alias mu="mamba update"
alias mx="mamba uninstall"
alias n="$(brew --prefix)/bin/nvim"
alias nS="func() { n -S $(echo '${@:-~/session.vim}'); }; func"
alias na="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias nc="func() { local cached=$(echo '$(git status --porcelain | grep "^M" | cut -c4- | fzf)') && [ $(echo '$cached') ] && echo $(echo '$cached') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias ncp="nvim -c Page"
alias nd="nvim -d"
alias ne="func() { local files=$(echo '$(n -u NONE -es "+pu =v:oldfiles" +%p +q! | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias nf="func() { local files=$(echo '$(fd --color=always --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias nfh="func() { local files=$(echo '$(fd --color=always --type f --hidden $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias ng="func() { local file=$(echo '$(rg -l ${@:-^} | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && echo $(echo '$file') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim +$(echo '$(rg -n ${@:-^} $file | head -n 1 | cut -d: -f1)') --; }; func"
alias nh="n -c History" # this only works with -c, not --cmd
alias ni="npm install"
alias nig="npm install -g"
alias nl="func() { local files=$(echo '$(rg -l ${@:-^} | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias nn="func() { n $(date '+%Y-%m-%d')_$(echo '$1:-notes').md; }; func"
alias no="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias nows="func() {find $(echo '${1-.}') -type f | sed 'p;s/ /_/g' | tr '\n' '\0' | xargs -0n2 mv; }; func"
alias np="func() { local files=$(echo '$(fd --color=always -e pdf --type f $@ | fzf --ansi --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias npp="nvim +Page"
alias nr="func() { local files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias ns="npm start"
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func"
alias nu="func() { local unstaged=$(echo '$(git status --porcelain | grep "^.M" | cut -c4- | fzf)') && [ $(echo '$unstaged') ] && echo $(echo '$unstaged') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias nus="n -u ~/.SpaceVim/init.vim"
alias nw="func() { local files=$(echo '$(fd --color=always -e docx --type f $@ | fzf --ansi --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias nz="n ~/.zshrc"
alias n~="vim -esu NORC \"+pu=execute('digraphs')\" +%p +q! | grep n~ | cut -d ' ' -f38 | pbcopy"
alias o="open"
alias oa="func() { local both=$(echo '$(fasd -Ral | fzf --preview="if [[ \"$(fasd -Rdl)\" =~ {} ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open; }; func"
alias od="func() { local directory=$(echo '$(fd --color=always --type d $@ | fzf --ansi)') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && echo $(echo '$directory') | tr '\n' '\0' | xargs -0 open; }; func"
alias oe="func() { local files=$(echo '$(fd --color=always -e xlsx --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias of="func() { local files=$(echo '$(fd --color=always --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias oh="func() { local files=$(echo '$(fd --color=always -e html --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias op="func() { local files=$(echo '$(fd --color=always -e pdf --type f $@ | fzf --ansi --preview="pdftotext -l 2 {} - | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias or="func() { local files=$(echo '$(fd --color=always -e Rproj --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias ow="func() { local files=$(echo '$(fd --color=always -e docx --type f $@ | fzf --ansi --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias p="git push"
alias pa="pass add"
alias pc="pass -c"
alias pd="pycharm diff"
alias pe="pass edit"
alias pf="func() { local password=$(echo '$(fd . ~/.password-store --extension gpg --type f --exec echo {.} | cut -d/ -f5- | fzf --no-multi --no-preview)') && [ $(echo '$password') ] && echo $(echo '$password') | xargs pass $(echo '${@:--c}'); }; func"
alias pft="pkill -f tmux"
alias pg="pass generate"
alias pgi="pass git init"
alias pgi="pass git init"
alias pgl="pass git log"
alias pgp="pass git push"
alias pgpua="pass git push --set-upstream --all"
alias pgrao="pass git remote add origin"
alias pi="python -m pip install"
alias pie="python -m pip install --editable"
alias pit="python -m pip install --target"
alias piu="python -m pip install --upgrade"
alias pl="pass ls"
alias pm="python -m"
alias po="git push origin"
alias pod="git push origin --delete"
alias pof="git push origin --force-if-includes --force-with-lease"
alias pom="git push origin main"
alias pomf="git push origin main --force-if-includes --force-with-lease"
alias pou="git push origin --set-upstream"
alias poum="git push origin --set-upstream main"
alias pr="pass rm"
alias px="pip uninstall"
alias py="python"
alias q="at"
alias qb="at -b"
alias qc="at -c"
alias qf="at -f"
alias ql="at -l"
alias qm="at -m"
alias qq="atq -v"
alias qr="at -r"
alias r="git reset" # Resets the index but not the working tree (mixed)
alias ra="git remote add"
alias rab="func() { local name=$(echo '${1:-origin}') && git remote add bit https://bitbucket.org/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias raf="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote add"
alias rah="func() { local name=$(echo '${1:-origin}') && git remote add hub https://github.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias ral="func() { local name=$(echo '${1:-origin}') && git remote add lab https://gitlab.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias rao="git remote add origin"
alias raob="git remote add origin $(echo '$(git remote get-url bit)')"
alias raoh="git remote add origin $(echo '$(git remote get-url hub)')"
alias raol="git remote add origin $(echo '$(git remote get-url lab)')"
alias rau="git remote add upstream"
alias rb="git rebase"
alias rba="git rebase --abort"
alias rbc="git rebase --continue"
alias rbcm="git rebase $(echo '$(git branch --show-current)') main"
alias rbi="git rebase --interactive"
alias rbo="git rebase --onto"
alias rbq="git rebase --quit"
alias rbs="git rebase --skip"
alias rc="git rm --cached"
alias rcfr="git rm --cached -fr"
alias rd="rmdir"
alias re="Rscript -e"
alias rei="Rscript -e 'renv::init()'"
alias rf="func() { local file=$(echo '$(rga --files-with-matches $@ | fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" --phony --query "$1" --bind "change:reload: rga --files-with-matches {q} $2")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && open $(echo '$file'); }; func"
alias rgs="func() { rg -0l $(echo '$1') | xargs -0n1 sed -i '' \"s/$(echo '$1')/$(echo '$2')/g\" ; }; func" # combines ripgrep (rg) and sed
alias rh0="git reset HEAD~0"
alias rh1="git reset HEAD~1"
alias rh2="git reset HEAD~2"
alias rh3="git reset HEAD~3"
alias rh="git reset HEAD"
alias rhh0="git reset --hard HEAD~0"
alias rhh1="git reset --hard HEAD~1"
alias rhh2="git reset --hard HEAD~2"
alias rhh3="git reset --hard HEAD~3"
alias rhh="git reset --hard"
alias rhhn="func() { git reset --hard $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias rhn="func() { git reset $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias rhs0="git reset --soft HEAD~0"
alias rhs1="git reset --soft HEAD~1"
alias rhs2="git reset --soft HEAD~2"
alias rhs3="git reset --soft HEAD~3"
alias rhs="git reset --soft"
alias rhsn="func() { git reset --soft $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias ri="func() { for pkg in $(echo '$@'); do; $(echo 'Rscript -e "install.packages(\"${pkg}\", repos=\"https://cran.rstudio.com\")"'); done; }; func"
alias rot13="func() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < $(echo '$1') > temp.txt && mv temp.txt $(echo '$1'); }; func"
alias rp="git restore --patch"
alias rr="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"${1:-index.Rmd}\"'))\"; }; func"
alias rrb="func() { Rscript -e \"bookdown::render_book($(echo '\"index.Rmd\", $@'))\"; }; func"
alias rrd="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_file=\"$(date +%Y-%m-%d)_${1%.[Rr]md}.${2:-docx}\"'))\"; }; func"
alias rrf="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func"
alias rrm="git remote remove"
alias rrmf="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | cut -f1 | xargs -L1 git remote remove"
alias rrmo="git remote remove origin"
alias rrmu="git remote remove upstream"
alias rrn="git remote rename"
alias rrnf="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | cut -f1 | sed 's/\(.*\)/\1 \1/g' | vipe | xargs -L1 git remote rename"
alias rrs="func() { Rscript -e \"rmarkdown::render_site($(echo '$@'))\"; }; func"
alias rrw="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=rmarkdown::word_document(reference_docx=\"${2:-reference.docx}\")'))\"; }; func"
alias rs="git restore --source=HEAD --staged --"
alias rsf="func() { local files=$(echo '$(git diff --staged --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --staged --; }; func"
alias rsh="git remote set-head"
alias rsho="git remote set-head origin"
alias rshom="git remote set-head origin main"
alias rsu="git remote set-url"
alias rsua="git remote set-url --add"
alias rsuaf="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote set-url --add"
alias rsub="func() { local name=$(echo '${1:-origin}') && git remote set-url bit https://bitbucket.org/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias rsuba="func() { local name=$(echo '${1:-origin}') && git remote set-url bit https://bitbucket.org/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}') --add; }; func"
alias rsud="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote set-url --delete"
alias rsud="git remote set-url --delete"
alias rsuf="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote set-url"
alias rsuh="func() { local name=$(echo '${1:-origin}') && git remote set-url hub https://github.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias rsuha="func() { local name=$(echo '${1:-origin}') && git remote set-url hub https://github.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}') --add; }; func"
alias rsul="func() { local name=$(echo '${1:-origin}') && git remote set-url lab https://gitlab.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias rsula="func() { local name=$(echo '${1:-origin}') && git remote set-url lab https://gitlab.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}') --add; }; func"
alias rsuo="git remote set-url origin"
alias rsuoa="func() { git remote set-url origin $(echo '$@') --add; }; func"
alias rsuoba="func() { git remote set-url origin $(echo '$(git remote get-url bit)') --add; }; func"
alias rsuoha="func() { git remote set-url origin $(echo '$(git remote get-url hub)') --add; }; func"
alias rsuola="func() { git remote set-url origin $(echo '$(git remote get-url lab)') --add; }; func"
alias rsuu="git remote set-url upstream"
alias rsuua="func() { git remote set-url upstream $(echo '$@') --add; }; func"
alias rsw="git restore --source=HEAD --staged --worktree --"
alias rswf="func() { local files=$(echo '$(git diff HEAD --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --staged --worktree --; }; func"
alias rv="git remote -v"
alias rw="git restore --source=HEAD --worktree --"
alias rwf="func() { local files=$(echo '$(git diff HEAD --diff-filter=M --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --worktree --; }; func"
alias rz="func() { find $(echo '${1-.}') -mindepth 1 -print0 | rename --null --force --sanitize; }; func"
alias s2h="func() { local name=$(echo '${1:-origin}') && [ $(echo '$name') ] && git remote set-url $(echo '$name $(git remote get-url $name | sed "s+:+/+;s+git@+https://+")') }; func"
alias s="git status --show-stash"
alias sa="git stash apply"
alias sac="git submodule foreach git add --all && git submodule foreach git commit --reedit-message=HEAD"
alias saca="git submodule foreach git add --all && git submodule foreach git commit --amend --reset-author"
alias sacam="func() { git submodule foreach git add --all && git submodule foreach git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; } --reset-author; func"
alias sacamp="func() { git submodule foreach git add --all && git submodule foreach git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git submodule foreach git push --force-if-includes --force-with-lease; }; func"
alias sacampf="func() { git submodule foreach git add --all && git submodule foreach git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git submodule foreach git push --force; }; func"
alias sacap="git submodule foreach git add --all && git submodule foreach git commit --amend --reset-author && git submodule foreach git push --force-if-includes --force-with-lease"
alias sacapf="git submodule foreach git add --all && git submodule foreach git commit --amend --reset-author && git submodule foreach git push --force"
alias sacar="git submodule foreach git add --all && git submodule foreach git commit --amend --reset-author --reuse-message=HEAD"
alias sacarp="git submodule foreach git add --all && git submodule foreach git commit --amend --reset-author --reuse-message=HEAD && git submodule foreach git push --force-if-includes --force-with-lease"
alias sacarpf="git submodule foreach git add --all && git submodule foreach git commit --amend --reset-author --reuse-message=HEAD && git submodule foreach git push --force"
alias sacm="func() { git submodule foreach git add --all && git submodule foreach git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias sacmp="func() { git submodule foreach git add --all && git submodule foreach git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git submodule foreach git push; }; func"
alias sacp="git submodule foreach git add --all && git submodule foreach git commit --reedit-message=HEAD && git submodule foreach git push"
alias sacpf="git submodule foreach git add --all && git submodule foreach git commit --reedit-message=HEAD && git submodule foreach git push --force-if-includes --force-with-lease"
alias sacr="git submodule foreach git add --all && git submodule foreach git commit --reset-author --reuse-message=HEAD"
alias sacrp="git submodule foreach git add --all && git submodule foreach git commit --reset-author --reuse-message=HEAD && git submodule foreach git push"
alias sacrpf="git submodule foreach git add --all && git submodule foreach git commit --reset-author --reuse-message=HEAD && git submodule foreach git push --force-if-includes --force-with-lease"
alias saif="softwareupdate --all --install --force"
alias sak="ssh-agent -k"
alias sal="ssh-add --apple-load-keychain"
alias sau="func() { ssh-add --apple-use-keychain ~/.ssh/$(echo '$1'); }; func"
alias sb="git stash branch"
alias sc="git stash clear"
alias scaa="git submodule foreach git commit --all --amend --reset-author"
alias scaam="func() { git submodule foreach git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author; }; func"
alias scaamp="func() { git submodule foreach git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git submodule foreach git push --force-if-includes --force-with-lease; }; func"
alias scaampf="func() { git submodule foreach git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git submodule foreach git push --force; }; func"
alias scaap="git submodule foreach git commit --all --amend --reset-author && git submodule foreach git push --force-if-includes --force-with-lease"
alias scaapf="git submodule foreach git commit --all --amend --reset-author && git submodule foreach git push --force"
alias scaar="git submodule foreach git commit --all --amend --reset-author --reuse-message=HEAD"
alias scaarp="git submodule foreach git commit --all --amend --reset-author --reuse-message=HEAD && git submodule foreach git push --force-if-includes --force-with-lease"
alias scaarpf="git submodule foreach git commit --all --amend --reset-author --reuse-message=HEAD && git submodule foreach git push --force"
alias scam="func() { git submodule foreach git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias scamp="func() { git submodule foreach git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git submodule foreach git push; }; func"
alias scampf="func() { git submodule foreach git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git submodule foreach git push --force-if-includes --force-with-lease; }; func"
alias scap="git submodule foreach git commit --all --reedit-message=HEAD && git submodule foreach git push"
alias scapf="git submodule foreach git commit --all --reedit-message=HEAD && git submodule foreach git push --force-if-includes --force-with-lease"
alias scar="git submodule foreach git commit --all --reuse-message=HEAD"
alias scarp="git submodule foreach git commit --all --reuse-message=HEAD && git submodule foreach git push"
alias scarpf="git submodule foreach git commit --all --reuse-message=HEAD && git submodule foreach git push --force-if-includes --force-with-lease"
alias sd="git stash drop"
alias sf="func() { local stash=$(echo '$(git stash list --format="%gd %s" | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy),alt-a:execute-silent(git stash apply {1})+reload(git stash list --format=%gd\ %s),alt-enter:execute-silent(git stash pop {1})+reload(git stash list --format=%gd\ %s),alt-x:execute-silent(git stash drop {1})+reload(git stash list --format=%gd\ %s)" --no-multi --preview="git stash show --color=always {1} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="60%" --with-nth=4.. | cut -d " " -f1)') && [ $(echo '$stash') ] && git stash pop $(echo '$stash') }; func"
alias show="git show"
alias shown="func() { git show $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shownc="func() { git show --compact-summary $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shownco="func() { git show --compact-summary --oneline $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shownn="func() { git show --name-status $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shownno="func() { git show --name-status --oneline $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias sl="git stash list"
alias smn="func() { git show $(echo 'main~${1:-0} ${@:2}'); }; func"
alias smnc="func() { git show --compact-summary $(echo 'main~${1:-0} ${@:2}'); }; func"
alias smnco="func() { git show --compact-summary --oneline $(echo 'main~${1:-0} ${@:2}'); }; func"
alias smnn="func() { git show --name-status $(echo 'main~${1:-0} ${@:2}'); }; func"
alias smnno="func() { git show --name-status --oneline $(echo 'main~${1:-0} ${@:2}'); }; func"
alias sn="git show --name-status"
alias sno="git show --name-status --oneline"
alias sp="git stash push"
alias spop="git stash pop"
alias su="git stash push && git pull --rebase"
alias sub="git stash push && git pull --rebase && git stash branch"
alias sun="git status --untracked-files=no"
alias sup="git stash push && git pull --rebase && git stash pop"
alias sw-="git switch -"
alias sw="git switch"
alias swC="git switch -C"
alias swc="git switch -c"
alias sz="source ~/.zshrc"
alias t="tig"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tatf="tmux attach -t $(echo '$(tmux list-sessions | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy)" --delimiter=: --no-multi --no-sort | cut -d: -f1)')"
alias tb="tig blame"
alias tc="func() { local directory=$(echo '${2:-${${1#*.*[:/]}%.*}}') && local session=$(echo '${3:-${directory##*/}}') && git clone $(echo '$1 $directory') && cd $(echo '$directory'); if ! tmux has-session -t $(echo '$session') &>/dev/null; then; tmux new -ds $(echo '$session') -c $(echo '$directory'); fi; if [ -n '$TMUX' ]; then; tmux switch -t $(echo '$session'); else; tmux attach -t $(echo '$session'); fi; }; func" # clone and cd into repo then create or switch to or attach tmux session, ${parameter#pattern} removes pattern from the beginning, while ${parameter%pattern} removes pattern from the end
alias td="func() { local session=$(echo '${1:-${PWD##*/}}') && [ $(echo '$session') ]; if ! tmux has-session -t $(echo '$session') &>/dev/null; then; tmux new -ds $(echo '$session') -c $(echo '$directory'); fi; if [ -n '$TMUX' ]; then; tmux switch -t $(echo '$session'); else; tmux attach -t $(echo '$session'); fi; }; func"
alias tg="tig grep"
alias ti="tmux info"
alias tj="func() { local directory=$(echo '$(fd --color=always --type d ^ $@ | fzf --ansi --no-multi)') && local session=$(echo '${directory##*/}') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && [ $(echo '$session') ]; if ! tmux has-session -t $(echo '$session') &>/dev/null; then; tmux new -ds $(echo '$session') -c $(echo '$directory'); fi; if [ -n '$TMUX' ]; then; tmux switch -t $(echo '$session'); else; tmux attach -t $(echo '$session'); fi; }; func"
alias tjf="func() { local directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --with-nth=4..)') && local session=$(echo '${1:-${directory##*/}}') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && [ $(echo '$session') ]; if ! tmux has-session -t $(echo '$session') &>/dev/null; then; tmux new -ds $(echo '$session') -c $(echo '$directory'); fi; if [ -n '$TMUX' ]; then; tmux switch -t $(echo '$session'); else; tmux attach -t $(echo '$session'); fi; }; func"
alias tka="tmux kill-session -a"
alias tks="tmux kill-server"
alias tkt="tmux kill-session -t"
alias tktf="func() { local sessions=$(echo '$(tmux list-sessions | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy)" --delimiter=: --no-sort | cut -d: -f1)') && echo $(echo '$sessions') | tr '\n' '\0' | xargs -0n1 -I '{}' tmux kill-session -t '{}'; }; func"
alias tl="tmux list-sessions"
alias tn="tmux new"
alias tnds="tmux new -ds"
alias tns="tmux new -s"
alias ts="tmux switch"
alias tst="tmux switch -t"
alias tstf="tmux switch -t $(echo '$(tmux list-sessions | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy)" --delimiter=: --no-multi --no-sort | cut -d: -f1)')"
alias u="git pull --rebase"
alias uf="git pull --force --rebase"
alias uo="git pull --rebase origin"
alias uom="git pull --rebase origin main"
alias uu="git pull --rebase upstream"
alias uum="git pull --rebase upstream main"
alias v="$(brew --prefix)/bin/vim"
alias vS="func() { v -S $(echo '${@:-~/session.vim}'); }; func"
alias va="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vc="func() { local cached=$(echo '$(git status --porcelain | grep "^M" | cut -c4- | fzf)') && [ $(echo '$cached') ] && echo $(echo '$cached') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vcp="vim -c Page"
alias vd="vimdiff"
alias ve="func() { local files=$(echo '$(v -es --noplugin -u ~/.vimrc "+set nonumber" "+pu =v:oldfiles" +%p +q! | sed /^.$/d | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vf="func() { local files=$(echo '$(fd --color=always --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vfh="func() { local files=$(echo '$(fd --color=always --type f --hidden $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vg="func() { local file=$(echo '$(rg -l ${@:-^} | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o vim +$(echo '$(rg -n ${@:-^} $file | head -n 1 | cut -d: -f1)') --; }; func"
alias vh="v -c History" # this only works with -c, not --cmd
alias vl="func() { local files=$(echo '$(rg -l ${@:-^} | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vn="func() { v ~/mskar/notes/$(date '+%Y-%m-%d')_$(echo '${1:-notes}').md; }; func"
alias vo="v -c 'browse oldfiles'" # this only works with -c, not --cmd
alias vp="func() { local files=$(echo '$(fd --color=always -e pdf --type f $@ | fzf --ansi --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vpp="vim +Page"
alias vr="func() { local files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vs="func() { local staged=$(echo '$(git status --porcelain | grep "^M" | cut -c4- | fzf)') && [ $(echo '$staged') ] && echo $(echo '$staged') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func"
alias vu="func() { local unstaged=$(echo '$(git status --porcelain | grep "^.M" | cut -c4- | fzf)') && [ $(echo '$unstaged') ] && echo $(echo '$unstaged') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vus="v -u ~/.SpaceVim/vimrc"
alias vw="func() { local files=$(echo '$(fd --color=always -e docx --type f $@ | fzf --ansi --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vz="v ~/.zshrc"
alias w="which"
alias wf="func() { local files=$(echo '$(fd --color=always -e js --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 webstorm; }; func"
alias x="exa --classify --color=always"
alias xR="exa --classify --color=always --recurse"
alias xa="exa --classify --color=always --all"
alias xat="exa --classify --color=always --all --tree"
alias xd="exa --classify --color=always --only-dirs"
alias xf="func() { local both=$(echo '$(exa --all --classify --color=always $@ | fzf --ansi)') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open --; }; func"
alias xl="exa --classify --color=always --long"
alias xo="exa --classify --color=always --oneline"
alias xr="exa --classify --color=always --reverse"
alias xt="exa --classify --color=always --tree"
alias y="fc -ln -1 | pbcopy"
alias yf="func() { local cmds=$(echo '$(fc -ln $@ | fzf -m --tac)') && [ $(echo '$cmds') ] && echo $(echo '$cmds') | pbcopy; }; func"
alias z="fasd -d"
alias zc="fasd -de code"
alias zf="fasd_cd() { local _fasd_ret=$(echo '$(fasd -e echo $@)') && [ $(echo '$_fasd_ret') ] && [ -d $(echo '$_fasd_ret') ] && cd $(echo '$_fasd_ret') || echo $(echo '$_fasd_ret'); }; fasd_cd -di"
alias zl="fasd -dl" # list all directories
alias zn="fasd -de 'nvim'"
alias zo="fasd -de open"
alias zp="fasd -de pycharm"
alias zr="func() { zip -r $(echo '${1}.zip') (echo '${1}'); }; func"
alias zv="fasd -de '$EDITOR'"

# Suffix aliases: use with fzf ctrl-t: even with multiple files
# first file listed determines the command used to open all files
# e.g. `open` will be used when running `image.png file.txt`
# putting file.txt first will open both files in $EDITOR
# Run *.md to open all markdown files in $EDITOR
alias -s ipynb='jupyter lab'
alias -s zip=unzip
alias -s {R,r,rmd,Rmd,vim}="nvim"
alias -s {ahk,js,json,md,py,rst,toml,tex,txt,yaml,yml}="$EDITOR"
alias -s {csv,tsv}=scim
alias -s {doc,docx,html,pdf,ppt,pptx,xls,xlsx}=open
alias -s {gif,jpeg,jpg,png,tiff}=open

# ctrl-d in normalmode brings up info about the thing under the caret!!!

# Cursor
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

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FASD
eval "$(fasd --init zsh-hook zsh-wcomp-install zsh-wcomp)"

# expand alias
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/globalias
GLOBALIAS_FILTER_VALUES=(acam acamp acm acmp caam caamp cam camp campf cm cmp cmpf)

globalias() {
   # Get last word to the left of the cursor:
   # (z) splits into words using shell parsing
   # (A) makes it an array even if there's only one element
   local word=${${(Az)LBUFFER}[-1]}
   if [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]]; then
      zle _expand_alias
      zle expand-word
   fi
}
zle -N globalias

# Keybindings
# https://github.com/junegunn/fzf/issues/546#issuecomment-213344845
# https://en.wikipedia.org/wiki/GNU_Readline#Emacs_keyboard_shortcuts
# http://web.cs.elte.hu/zsh-manual/zsh_14.html#SEC49
bindkey -v
bindkey -M menuselect '^o' accept-and-infer-next-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M viins "^['" quote-line
bindkey -M viins "^[^e" globalias
bindkey -M viins '^ ' set-mark-command
bindkey -M viins '^/' undo
bindkey -M viins '^["' quote-region
bindkey -M viins '^[-' neg-argument
bindkey -M viins '^[.' insert-last-word
bindkey -M viins '^[<' beginning-of-buffer-or-history
bindkey -M viins '^[>' end-of-buffer-or-history
bindkey -M viins '^[^h' backward-kill-word
bindkey -M viins '^[b' backward-word
bindkey -M viins '^[c' capitalize-word
bindkey -M viins '^[d' kill-word
bindkey -M viins '^[f' forward-word
bindkey -M viins '^[h' kill-region
bindkey -M viins '^[l' down-case-word
bindkey -M viins '^[n' history-search-forward
bindkey -M viins '^[p' history-search-backward
bindkey -M viins '^[t' transpose-words
bindkey -M viins '^[u' up-case-word
bindkey -M viins '^[w' copy-region-as-kill
bindkey -M viins '^[x' execute-named-cmd
bindkey -M viins '^[y' yank-pop
bindkey -M viins '^_' undo
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^b' backward-char
bindkey -M viins '^d' delete-char
bindkey -M viins '^e' end-of-line
bindkey -M viins '^f' forward-char
bindkey -M viins '^g' send-break
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^k' kill-line
bindkey -M viins '^n' down-history
bindkey -M viins '^o' accept-line-and-down-history
bindkey -M viins '^p' up-history
bindkey -M viins '^r' fzf-history-widget
bindkey -M viins '^t' transpose-chars
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^x^a' fasd-complete
bindkey -M viins '^x^b' vi-match-bracket
bindkey -M viins '^x^d' fasd-complete-d
bindkey -M viins '^x^e' edit-command-line
bindkey -M viins '^x^f' fasd-complete-f
bindkey -M viins '^x^j' fzf-cd-widget
bindkey -M viins '^x^s' fzf-file-widget
bindkey -M viins '^x^u' undo
bindkey -M viins '^x^x' exchange-point-and-mark
bindkey -M viins '^xa' fasd-complete
bindkey -M viins '^xb' vi-match-bracket
bindkey -M viins '^xd' fasd-complete-d
bindkey -M viins '^xe' edit-command-line
bindkey -M viins '^xf' fasd-complete-f
bindkey -M viins '^xj' fzf-cd-widget
bindkey -M viins '^xs' fzf-file-widget
bindkey -M viins '^xu' undo
bindkey -M viins '^xx' exchange-point-and-mark
bindkey -M viins '^y' yank
bindkey -M viins "∫" backward-word
bindkey -M viins "ƒ" forward-word
bindkey -M viins "∂" delete-word
bindkey -M viins '˙' backward-kill-word
bindkey -M viins '≥' insert-last-word

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/usr/local/Caskroom/mambaforge/base/etc/profile.d/mamba.sh" ]; then
    . "/usr/local/Caskroom/mambaforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
