# Environment
# https://github.com/sharkdp/fd#using-fd-with-fzf
# https://github.com/junegunn/fzf#respecting-gitignore
# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
export PATH=/usr/local/bin:$PATH
export DOOMDIR=$HOME/.doom/doom-emacs-config
export EDITOR=$(brew --prefix)/bin/nvim
export MANPAGER="nvim -c 'set ft=man' -"
export PAGER="less"
export PATH=$(brew --prefix)/Caskroom/miniforge/base/bin:$PATH
export KEYTIMEOUT=1
export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="'--bind=change:top,ctrl-k:kill-line,alt-p:toggle-preview,alt-w:toggle-preview-wrap,alt-y:execute-silent(echo {} | pbcopy)' --cycle --exit-0 --inline-info --multi --no-height --no-sort --preview='if [ -d {} ]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi' --preview-window='70%:hidden' --reverse --tiebreak=index"
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
autoload -U compinit && compinit
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
alias aa="func() { local files=$(echo '$(git status -s | fzf --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=2.. --preview="if [ \$(git ls-files --other --exclude-standard {2..} | sed s/\ //g) ]; then; git diff --color=always --color-words --no-index -- /dev/null {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; git diff --color=always --color-words {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi" | cut -c4-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git add $(echo '$@') --; }; func"
alias ac="git add --all && git commit --reedit-message=HEAD"
alias aca="git add --all && git commit --amend --reset-author"
alias acam="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; } --reset-author; func"
alias acamp="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force-if-includes --force-with-lease; }; func"
alias acampf="func() { git add --all && git commit --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func"
alias acap="git add --all && git commit --amend --reset-author && git push --force-if-includes --force-with-lease"
alias acapf="git add --all && git commit --amend --reset-author && git push --force"
alias acar="git add --all && git commit --amend --reset-author --reuse-message=HEAD"
alias acarp="git add --all && git commit --amend --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias acarpf="git add --all && git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias acm="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias acmp="func() { git add --all && git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias acp="git add --all && git commit --reedit-message=HEAD && git push"
alias acpf="git add --all && git commit --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias acr="git add --all && git commit --reset-author --reuse-message=HEAD"
alias acr="git add --all && git commit --reset-author --reuse-message=HEAD"
alias acrp="git add --all && git commit --reset-author --reuse-message=HEAD && git push"
alias acrp="git add --all && git commit --reset-author --reuse-message=HEAD && git push"
alias acrpf="git add --all && git commit --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias adduser="func() { curl -X PUT --user mskar:$(echo '$(pass ${4:-ga/github/token})') -H 'Accept: application/vnd.github.v3+json' https://$(echo '${3:-git.generalassemb.ly}')/api/v3/orgs/py/memberships/$(echo '$1') -d '{\"role\":\"$(echo '$(${2:-member})')\"}'; }; func"
alias ai="git add --interactive"
alias am="git commit --amend --reset-author"
alias amp="git commit --amend --reset-author && git push --force-if-includes --force-with-lease"
alias ampf="git commit --amend --reset-author && git push --force"
alias amr="git commit --amend --reset-author --reuse-message=HEAD"
alias amrp="git commit --amend --reset-author --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias amrpf="git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias ap="git add --patch"
alias b="git branch"
alias bD="git branch -D" # delete branch (even if not merged)
alias ba="git branch --all"
alias bb="func() { local branch=$(echo '$(git branch --color=always --verbose | fzf --ansi --bind="alt-y:execute-silent(echo {} | cut -c3- | cut -d \  -f1 | pbcopy),alt-x:execute-silent(git branch -D {1})+reload(git branch --color=always --verbose)" --preview="git diff --color=always \$(echo \$(git rev-parse --abbrev-ref HEAD)..{1}) | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" | cut -c3- | cut -d " " -f1)') && [ $(echo '$branch') ] && git checkout $(echo '$branch'); }; func"
alias bbd="brew bundle dump --describe"
alias bbi="brew bundle install --global"
alias bd="git branch --delete" # delete fully merged branch
alias bi="brew install"
alias bic="brew install --cask"
alias bl="brew list"
alias blc="brew list --cask"
alias bm="git branch --move"
alias bmm="git branch --move master main && git push --set-upstream origin main && git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main"
alias bo="brew outdated"
alias boc="brew outdated --cask"
alias br="git branch --remotes"
alias brg="batgrep" # uses ripgrep (rg)
alias bs="func() { git branch --set-upstream-to=origin/$(echo '${1:-main}') $(echo '${1:-main}'); }; func"
alias bu="brew upgrade"
alias buc="brew upgrade --cask"
alias buo="brew upgrade $(echo '$(brew outdated --formula | cut -f1 | tr "\n" " ")')"
alias buco="brew upgrade --cask $(echo '$(brew outdated --cask | cut -f1 | tr "\n" " ")')"
alias bx="brew uninstall"
alias bxc="brew uninstall --cask"
alias c="func() { git clone $(echo '$1 ${${1#*.*[:/]}%.*}') && cd $(echo '${${1#*.*[:/]}%.*}'); }; func" # clone and cd into repo (${parameter#pattern} removes pattern from the beginning, while ${parameter%pattern} removes pattern from the end
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
alias cam="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func"
alias camp="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func"
alias campf="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force-if-includes --force-with-lease; }; func"
alias cap="git commit --all --reedit-message=HEAD && git push"
alias capf="git commit --all --reedit-message=HEAD && git push --force-if-includes --force-with-lease"
alias car="git commit --all --reuse-message=HEAD"
alias carp="git commit --all --reuse-message=HEAD && git push"
alias carpf="git commit --all --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias cda="conda deactivate"
alias ce="conda env"
alias ccf="conda env create --file"
alias ccn="conda create -yc conda-forge -n"
alias cee="conda env export > environment.yaml"
alias cel="conda env list"
alias cer="conda env remove"
alias cern="conda env remove -n"
alias cerp="conda env remove -p"
alias ceu="conda env update"
alias ci="conda install -yc conda-forge"
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
alias coo="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- $@') }; func"
alias cop="git checkout --patch"
alias cp-="git cherry-pick -"
alias cpa="git cherry-pick --abort"
alias cpc="git cherry-pick --continue"
alias cpick="git cherry-pick"
alias cpm0="git cherry-pick main~0"
alias cpm1="git cherry-pick main~"
alias cpm2="git cherry-pick main~2"
alias cpm3="git cherry-pick main~3"
alias cpm="git cherry-pick main"
alias cpmn="func() { git cherry-pick $(echo 'main~${1:-0} ${@:2}'); }; func"
alias cpn="func() { git cherry-pick $(echo '${1:-main}~${2:-1}'); }; func"
alias cpnn="func() { git cherry-pick $(echo '${1:-main}~${2:-1}..${1:-main}'); }; func"
alias cpp="func() { local commits=$(echo '$(git log ${1:-main} --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commits') ] && git cherry-pick $(echo '$commits') }; func"
alias cpq="git cherry-pick --quit"
alias cps="git cherry-pick --skip"
alias cr="conda remove"
alias crp="git commit --reuse-message=HEAD && git push"
alias crpf="git commit --reuse-message=HEAD && git push --force-if-includes --force-with-lease"
alias cu="conda update -y"
alias cx="conda uninstall -y"
alias d="git diff"
alias db="batdiff"
alias dc="git difftool -yt code --extcmd 'code --wait --diff'"
alias dcc="git difftool -yt code --extcmd 'code --wait --diff' --cached"
alias dcm="git difftool -yt code --extcmd 'code --wait --diff' main"
alias dcs="git diff --compact-summary"
alias dd="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && dt $(echo '$commit -- $@') }; func"
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
alias dm3="git diff main~3"
alias dm="git diff main"
alias dmn="func() { git diff $(echo 'main~${1:-0} ${@:2}'); }; func"
alias dn="git difftool -yt nvim --extcmd 'nvim -d'"
alias dnc="git difftool -yt nvim --extcmd 'nvim -d' --cached"
alias dnm="git difftool -yt nvim --extcmd 'nvim -d' main"
alias dns="git diff --name-status"
alias dp="git difftool -yt pycharm --extcmd 'pycharm diff $LOCAL $REMOTE'"
alias dps="git difftool -yt pycharm --extcmd 'pycharm diff'"
alias ds="git diff --staged"
alias dsf="delta --side-by-side --diff-so-fancy"
alias dsh="delta --side-by-side --diff-highlight"
alias dss="delta --side-by-side"
alias dt="git difftool -yt vimdiff" # difftool is dt to match mergetool (mt)
alias dtc="git difftool -yt vimdiff --cached"
alias dtm="git difftool -yt vimdiff main" # difftool is dt to match mergetool (mt)
alias duh="du -h"
alias dw="git diff --word-diff=color"
alias e="emacsclient -t --alternate-editor emacs"
alias ec="emacs -q --load ~/.config/emacs/init.el"
alias ed="emacs -q --load  ~/.doom/doom-emacs/init.el"
alias edc="emacs --daemon -q --load ~/.config/emacs/init.el"
alias edd="emacs --daemon -q --load ~/.doom/doom-emacs/init.el"
alias eds="emacs --daemon -q --load ~/.emacs.d/init.el"
alias ee="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 emacsclient -t --alternate-editor -- ; }; func"
alias eq="emacs -q"
alias es="emacs -q --load ~/.emacs.d/init.el"
alias ex="emacsclient -e '(kill-emacs)'"
alias ez="emacsclient -t --alternate-editor emacs ~/.zshrc"
alias f="fasd -f"
alias fA="fasd -A"
alias fD="fasd -D"
alias fb="fd --type f -X bat"
alias fcl="fc -l"
alias fcld="fc -ld"
alias fclf="fc -lf"
alias ff="fd --type f"
alias fl="fasd -fl"
alias flat="func() { find $(echo '${1-.}') -mindepth 2 -type f -exec gmv -ft $(echo '${1-.}') '{}' + && find $(echo '${1-.}') -mindepth 1 -depth -type d -exec rmdir {} +; }; func"
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
alias gg="func() { local commit_file=$(echo '$(git grep -l ${1:-^} $(git rev-list --all --abbrev-commit) -- ${@:2} | fzf --bind="alt-enter:execute-silent(git checkout {1} -- {2})+down" --delimiter=: --no-multi --nth=2.. --preview="git diff HEAD --color=always {1} {2} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$commit_file') ] && echo -n $(echo '$commit_file') | tr ':' '\0' | xargs -0 git checkout; }; func"
alias gi="grep -i --color=always --exclude-dir={.git,.idea,.vscode}"
alias gir="grep -ir --color=always --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=always --exclude-dir={.git,.idea,.vscode}"
alias h2s="func() { local name=$(echo '${1:-origin}') && [ $(echo '$name') ] && git remote set-url $(echo '$name $(git remote get-url $name | sed "s+https://+git@+;s+/+:+")') }; func"
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
alias hrc="func() { gh repo create $(echo '$1') --private $(echo '${@:3}') -y && cd $(echo '$1'); }; func"
alias hrcd="func() { gh repo create $(echo '$1') --private --description \"$(echo '${*# }')\" -y && cd $(echo '$1'); }; func"
alias hrci="func() { gh repo create $(echo '$1') --internal $(echo '${@:2}') -y && cd $(echo '$1'); }; func"
alias hrcid="func() { gh repo create $(echo '$1') --internal --description \"$(echo '${*# }')\" -y && cd $(echo '$1'); }; func"
alias hrcp="func() { gh repo create $(echo '$1') --public $(echo '${@:2}') -y && cd $(echo '$1'); }; func"
alias hrcpd="func() { gh repo create $(echo '$1') --public --description \"$(echo '${*# }')\" -y && cd $(echo '$1'); }; func"
alias hrf="gh repo fork"
alias hrv="gh repo view"
alias hrvw="gh repo view --web"
alias i="func() { cookiecutter gh:mskar/cookiecutter --no-input proj_name=$(echo '$1') proj_desc=$(echo '${2:-""}') is_private=$(echo '${3:-"false"}') user_name=$(echo '${4:-"mskar"}') full_name=$(echo '${5:-"Martin Skarzynski"}') && [ $(echo '$1') ] && cd $(echo '$(echo "$1" | tr "[:upper:]" "[:lower:]" | tr " " "_")') && make git env; }; func"
alias ig="func() { echo $(echo 'echo $@ | tr " " "\n" >> $(git rev-parse --show-toplevel)/.gitignore'); }; func"
alias ii="func() { local files=$(echo '$(git ls-files --others --exclude-standard | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -I file bash -c 'echo "file" >> \$(git rev-parse --show-toplevel)/.gitignore'; }; func"
alias it="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func"
alias ite="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func"
alias itee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func"
alias j="func() { local directory=$(echo '$(fd --color=always --type d ^ $@ | fzf --ansi --no-multi)') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && cd $(echo '$directory'); }; func"
alias jj="func() { local directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --with-nth=4..)') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && cd $(echo '$directory'); }; func"
alias jl="func() { local ipynb=$(echo '$(fd --color=always --type f --extension ipynb $@ | fzf --ansi --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func"
alias jll="func() { local ipynb=$(echo '$(fasd -Rfl | grep ".ipynb$" | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func"
alias jn="func() { local ipynb=$(echo '$(fd --color=always --type f --extension ipynb $@ | fzf --ansi --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func"
alias jnl="jupyter notebook list"
alias jnn="func() { local ipynb=$(echo '$(fasd -Rfl | grep ".ipynb$" | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && [ -f $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func"
alias jo="func() { local url=$(echo '$(jupyter notebook list | sed 1d | fzf --delimiter=" :: " --nth=1 --with-nth=2 --no-multi --preview="exa --all --classify --color=always -L=2 -T {2} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$url') ] && open $(echo '$url'); }; func"
alias jt="jupytext"
alias jtp="func() { local file=$(echo '${1:-${PWD##*/}}.py') && touch $(echo '$file') && jupytext --set-kernel $(echo '${2:-python3}') $(echo '$file') && jupytext --to notebook --execute $(echo '$file') && jupytext --set-formats $(echo '${3:-ipynb,py,Rmd}') $(echo '${file/%.py/.ipynb}'); }; func"
alias jtr="func() { local file=$(echo '${1:-${PWD##*/}}.r') && touch $(echo '$file') && jupytext --set-kernel $(echo '${2:-ir}') $(echo '$file') && jupytext --to notebook --execute $(echo '$file') && jupytext --set-formats $(echo '${3:-ipynb,r,Rmd}') $(echo '${file/%.[rR]/.ipynb}'); }; func"
alias jts="jupytext --sync"
alias jtt="jupytext --to"
alias jtn="jupytext --to notebook"
alias jte="jupytext --to notebook --execute"
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && [ -d $(echo '${ntimes// /../}') ] && cd $(echo '${ntimes// /../}'); }; func"
alias kg="func() { ssh-keygen -t rsa -b 4096 -f $(echo '$1') -C $(echo '$1') && ssh-add ~/.ssh/$(echo '$1') && cat ~/.ssh/$(echo '$1').pub; }; func"
alias l="git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D'"
alias la="ls -a"
alias lah="ls -ah"
alias lal="ls -al"
alias ld="git log --format='%C(cyan)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --date=short"
alias lg="git log --format='%C(cyan)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --graph"
alias ll="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" -S $1 -- ${@:2} | fzf --ansi --bind="alt-y:execute-silent(echo {-1} | pbcopy)" --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- ${@:2}') }; func"
alias llm="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' --left-right -- main...$(echo '${1:-upstream}'); }; func"
alias lm="git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' main"
alias lmh="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' origin/main..$(echo '${1:-HEAD}'); }; func"
alias lml="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' --left-right -- $(echo '${1:-upstream}')...main; }; func"
alias lmn="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' main --not $(echo '${1:-upstream}'); }; func"
alias lnm="func() { git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D' $(echo '${1:-upstream}') --not main; }; func"
alias lp="git log -p"
alias lr="git log --format='%C(cyan)%>(12,trunc)%ar %Creset%<(80,trunc)%s %Cblue%h %Cgreen%<(17,trunc)%cn %Cred%D'"
alias m="man"
alias ma="mamba activate"
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func"
alias mb="batman"
alias mc="git mergetool -t code --extcmd 'code --wait'"
alias mcc="git mergetool -t code --extcmd 'code --wait' --cached"
alias mcs="git mergetool -t code --extcmd 'code --wait' --staged"
alias md="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func"
alias mda="mamba deactivate"
alias me="mamba env"
alias mcn="mamba create -c conda-forge -n"
alias mcf="mamba env create -f"
alias mee="mamba env export > environment.yaml"
alias mel="mamba env list"
alias mer="mamba env remove"
alias mern="mamba env remove -n"
alias merp="mamba env remove -p"
alias meu="mamba env update"
alias mi="mamba install -yc conda-forge"
alias miz="mamba init zsh"
alias ml="mamba list"
alias mm="func() { local file=$(echo '$(git diff --diff-filter=U --name-only --relative | fzf --bind="alt-o:execute-silent(git checkout --ours {} && git add {})+reload(git diff --diff-filter=U --name-only --relative),alt-t:execute-silent(git checkout --theirs {} && git add {})+reload(git diff --diff-filter=U --name-only --relative)" --preview="git log --color=always --color-words --format=\"%n%C(cyan)%>(12,trunc)%ar %Cred%D %Creset%s %Cgreen%cn %Cblue%h\" --patch -- {} | sed 1d | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR '+silent Gvdiff!' -- $(echo '$file'); }; func"
alias mn="git mergetool -t nvim --extcmd 'nvim -d'"
alias mnc="git mergetool -t nvim --extcmd 'nvim -d' --cached"
alias mns="git mergetool -t nvim --extcmd 'nvim -d' --staged"
alias mp="mkdir -p"
alias mr="mamba remove"
alias mt="git mergetool -t vimdiff" # mv is taken
alias mtc="git mergetool -t vimdiff --cached"
alias mts="git mergetool -t vimdiff --staged"
alias mu="mamba update"
alias mx="mamba uninstall"
alias n="$(brew --prefix)/bin/nvim"
alias nS="func() { n -S $(echo '${@:-~/session.vim}'); }; func"
alias nd="func() { n $(date '+%Y-%m-%d')_$(echo '$1').md; }; func"
alias ne="func() { local files=$(echo '$(n -u NONE -es "+pu =v:oldfiles" +%p +q! | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias nf="func() { local files=$(echo '$(fd --color=always --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias nfh="func() { local files=$(echo '$(fd --color=always --type f --hidden $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias ng="func() { local file=$(echo '$(rg -l ${@:-^} | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && echo $(echo '$file') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim +$(echo '$(rg -n ${@:-^} $file | head -n 1 | cut -d: -f1)') --; }; func"
alias nh="n -c History" # this only works with -c, not --cmd
alias nl="func() { local files=$(echo '$(rg -l ${@:-^} | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias nn="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias no="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias nows="func() {find $(echo '${1-.}') -type f | sed 'p;s/ /_/g' | tr '\n' '\0' | xargs -0n2 mv; }; func"
alias np="func() { local files=$(echo '$(fd --color=always -e pdf --type f $@ | fzf --ansi --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias nr="func() { local files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias ns="func() { local staged=$(echo '$(git status --porcelain | grep "^M" | cut -c4- | fzf)') && [ $(echo '$staged') ] && echo $(echo '$staged') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func"
alias nu="func() { local unstaged=$(echo '$(git status --porcelain | grep "^.M" | cut -c4- | fzf)') && [ $(echo '$unstaged') ] && echo $(echo '$unstaged') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func"
alias nus="n -u ~/.SpaceVim/init.vim"
alias nw="func() { local files=$(echo '$(fd --color=always -e docx --type f $@ | fzf --ansi --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 nvim --; }; func"
alias nz="n ~/.zshrc"
alias n~="vim -esu NORC \"+pu=execute('digraphs')\" +%p +q! | grep n~ | cut -d ' ' -f38 | pbcopy"
alias o="open"
alias od="func() { local directory=$(echo '$(fd --color=always --type d $@ | fzf --ansi)') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && echo $(echo '$directory') | tr '\n' '\0' | xargs -0 open; }; func"
alias of="func() { local files=$(echo '$(fd --color=always --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias oh="func() { local files=$(echo '$(fd --color=always -e html --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias oo="func() { local both=$(echo '$(fasd -Ral | fzf --preview="if [[ \"$(fasd -Rdl)\" =~ {} ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open; }; func"
alias op="func() { local files=$(echo '$(fd --color=always -e pdf --type f $@ | fzf --ansi --preview="pdftotext -l 2 {} - | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias or="func() { local files=$(echo '$(fd --color=always -e Rproj --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias ow="func() { local files=$(echo '$(fd --color=always -e docx --type f $@ | fzf --ansi --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func"
alias p="git push"
alias pa="pass add"
alias pb="prettybat"
alias pc="pass -c"
alias pd="pycharm diff"
alias pe="pass edit"
alias pf="git push --force-if-includes --force-with-lease"
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
alias pm="pass mv"
alias po="git push origin"
alias pod="git push origin --delete"
alias pof="git push origin --force-if-includes --force-with-lease"
alias pom="git push origin main"
alias pomf="git push origin main --force-if-includes --force-with-lease"
alias pou="git push origin --set-upstream"
alias poum="git push origin --set-upstream main"
alias pp="func() { local password=$(echo '$(fd . ~/.password-store --extension gpg --type f --exec echo {.} | cut -d/ -f5- | fzf --no-multi --no-preview)') && [ $(echo '$password') ] && echo $(echo '$password') | xargs pass $(echo '${@:--c}'); }; func"
alias pr="pass rm"
alias ps="pass search"
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
alias raa="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote add"
alias rab="func() { local name=${1:-origin} && git remote add bit https://bitbucket.org/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias rah="func() { local name=${1:-origin} && git remote add hub https://github.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
alias ral="func() { local name=${1:-origin} && git remote add lab https://gitlab.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func"
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
alias rd="rmdir"
alias re="Rscript -e"
alias red="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_file=\"$(date +%Y-%m-%d)_${1%.[Rr]md}.${2:-docx}\"'))\"; }; func"
alias ref="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func"
alias rew="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=rmarkdown::word_document(reference_docx=\"${2:-reference.docx}\")'))\"; }; func"
alias rf="func() { local file=$(echo '$(rga --files-with-matches $@ | fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" --phony --query "$1" --bind "change:reload: rga --files-with-matches {q} $2")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && open $(echo '$file'); }; func"
alias rh0="git reset HEAD~0"
alias rh1="git reset HEAD~1"
alias rh2="git reset HEAD~2"
alias rh3="git reset HEAD~3"
alias rgb="batgrep" # uses ripgrep (rg)
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
alias rr="func() { local files=$(echo '$(git diff HEAD --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --staged --worktree --; }; func"
alias rrm="git remote remove"
alias rrmm="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | cut -f1 | xargs -L1 git remote remove"
alias rrmo="git remote remove origin"
alias rrmu="git remote remove upstream"
alias rrn="git remote rename"
alias rrnn="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | cut -f1 | sed 's/\(.*\)/\1 \1/g' | vipe | xargs -L1 git remote rename"
alias rs="func() { local files=$(echo '$(git diff --staged --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --staged --; }; func"
alias rsa="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote set-url --add"
alias rsd="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote set-url --delete"
alias rsh="git remote set-head"
alias rsho="git remote set-head origin"
alias rshom="git remote set-head origin main"
alias rss="git remote -v | cut -d ' ' -f1 | uniq | fzf --multi | vipe | xargs -L1 git remote set-url"
alias rsu="git remote set-url"
alias rsub="git remote set-url bit"
alias rsuba="func() { git remote set-url bit $(echo '$@') --add; }; func"
alias rsuh="git remote set-url hub"
alias rsuha="func() { git remote set-url hub $(echo '$@') --add; }; func"
alias rsul="git remote set-url lab"
alias rsula="func() { git remote set-url lab $(echo '$@') --add; }; func"
alias rsuo="git remote set-url origin"
alias rsuoa="func() { git remote set-url --add origin $(echo '$@'); }; func"
alias rsuoab="func() { git remote set-url --add origin $(echo '$(git remote get-url bit)'); }; func"
alias rsuoah="func() { git remote set-url --add origin $(echo '$(git remote get-url hub)'); }; func"
alias rsuoal="func() { git remote set-url --add origin $(echo '$(git remote get-url lab)'); }; func"
alias rsuu="git remote set-url upstream"
alias rsuua="func() { git remote set-url upstream $(echo '$@') --add; }; func"
alias rv="git remote -v"
alias rw="func() { local files=$(echo '$(git diff HEAD --diff-filter=M --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --worktree --; }; func"
alias rz="func() { find $(echo '${1-.}') -mindepth 1 -print0 | rename --null --force --santize; }; func"
alias s2h="func() { local name=$(echo '${1:-origin}') && [ $(echo '$name') ] && git remote set-url $(echo '$name $(git remote get-url $name | sed "s+:+/+;s+git@+https://+")') }; func"
alias s="git status --show-stash"
alias sa="git stash apply"
alias saa="ssh-add -A"
alias sal="ssh-add -l"
alias sb="git stash branch"
alias sc="git stash clear"
alias sd="git stash drop"
alias shn="func() { git show $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shnc="func() { git show --compact-summary $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shnco="func() { git show --compact-summary --oneline $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shnn="func() { git show --name-status $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
alias shnno="func() { git show --name-status --oneline $(echo 'HEAD~${1:-0} ${@:2}'); }; func"
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
alias ss="func() { local stash=$(echo '$(git stash list --format="%gd %s" | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy),alt-a:execute-silent(git stash apply {1})+reload(git stash list --format=%gd\ %s),alt-enter:execute-silent(git stash pop {1})+reload(git stash list --format=%gd\ %s),alt-x:execute-silent(git stash drop {1})+reload(git stash list --format=%gd\ %s)" --no-multi --preview="git stash show --color=always {1} | delta | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="60%" --with-nth=4.. | cut -d " " -f1)') && [ $(echo '$stash') ] && git stash pop $(echo '$stash') }; func"
alias su="git stash push && git pull --rebase"
alias sub="git stash push && git pull --rebase && git stash branch"
alias sun="git status --untracked-files=no"
alias sup="git stash push && git pull --rebase && git stash pop"
alias sw-="git switch -"
alias sw="git switch"
alias swC="git switch -C"
alias swc="git switch -c"
alias sz="source ~/.zshrc"
alias t="tldr"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias ti="tmux info"
alias tj="func() { local directory=$(echo '$(fd --color=always --type d ^ $@ | fzf --ansi --no-multi)') && local session=$(echo '${directory##*/}') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && [ $(echo '$session') ] && tmux new -ds $(echo '$session') -c $(echo '$directory'); tmux switch -t $(echo '$session') || tmux attach -t $(echo '$session'); }; func"
alias tjj="func() { local directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --with-nth=4..)') && local session=$(echo '${1:-${directory##*/}}') && [ $(echo '$directory') ] && [ -d $(echo '$directory') ] && [ $(echo '$session') ] && tmux new -ds $(echo '$session') -c $(echo '$directory'); tmux attach -t $(echo '$session') || tmux switch -t $(echo '$session'); }; func"
alias tka="tmux kill-session -a"
alias tkt="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new"
alias tnds="tmux new -ds"
alias tns="tmux new -s"
alias ts="tmux switch"
alias tst="tmux switch -t"
alias tt="func() { local session=$(echo '${1:-${PWD##*/}}') && [ $(echo '$session') ] && tmux new -ds $(echo '$session'); tmux attach -t $(echo '$session') || tmux switch -t $(echo '$session'); }; func"
alias tta="tmux attach -t $(echo '$(tmux list-sessions | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy)" --delimiter=: --no-multi --no-sort | cut -d: -f1)')"
alias ttk="func() { local sessions=$(echo '$(tmux list-sessions | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy)" --delimiter=: --no-sort | cut -d: -f1)') && echo $(echo '$sessions') | tr '\n' '\0' | xargs -0n1 -I '{}' tmux kill-session -t '{}'; }; func"
alias tts="tmux switch -t $(echo '$(tmux list-sessions | fzf --bind="alt-y:execute-silent(echo {1} | pbcopy)" --delimiter=: --no-multi --no-sort | cut -d: -f1)')"
alias tx="tmux kill-server"
alias txx="pkill -f tmux"
alias u="git pull --rebase"
alias uo="git pull --rebase origin"
alias uom="git pull --rebase origin main"
alias uu="git pull --rebase upstream"
alias uum="git pull --rebase upstream main"
alias v="$(brew --prefix)/bin/vim"
alias vS="func() { v -S $(echo '${@:-~/session.vim}'); }; func"
alias vd="func() { v $(date '+%Y-%m-%d')_$(echo '$1').md; }; func"
alias ve="func() { local files=$(echo '$(v -es --noplugin -u ~/.vimrc "+set nonumber" "+pu =v:oldfiles" +%p +q! | sed /^.$/d | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vf="func() { local files=$(echo '$(fd --color=always --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vfh="func() { local files=$(echo '$(fd --color=always --type f --hidden $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vg="func() { local file=$(echo '$(rg -l ${@:-^} | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && [ -f $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o vim +$(echo '$(rg -n ${@:-^} $file | head -n 1 | cut -d: -f1)') --; }; func"
alias vh="v -c History" # this only works with -c, not --cmd
alias vl="func() { local files=$(echo '$(rg -l ${@:-^} | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n ${*:-^} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vo="v -c 'browse oldfiles'" # this only works with -c, not --cmd
alias vp="func() { local files=$(echo '$(fd --color=always -e pdf --type f $@ | fzf --ansi --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vr="func() { local files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vs="func() { local staged=$(echo '$(git status --porcelain | grep "^M" | cut -c4- | fzf)') && [ $(echo '$staged') ] && echo $(echo '$staged') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func"
alias vu="func() { local unstaged=$(echo '$(git status --porcelain | grep "^.M" | cut -c4- | fzf)') && [ $(echo '$unstaged') ] && echo $(echo '$unstaged') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vus="v -u ~/.SpaceVim/vimrc"
alias vv="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o vim $(echo '$@') --; }; func"
alias vw="func() { local files=$(echo '$(fd --color=always -e docx --type f $@ | fzf --ansi --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 -o vim --; }; func"
alias vz="v ~/.zshrc"
alias w="which"
alias ww="func() { local files=$(echo '$(fd --color=always -e js --type f $@ | fzf --ansi)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 webstorm; }; func"
alias x="exa --classify --color=always"
alias xR="exa --classify --color=always --recurse"
alias xa="exa --classify --color=always --all"
alias xat="exa --classify --color=always --all --tree"
alias xd="exa --classify --color=always --only-dirs"
alias xe="func() { local both=$(echo '$(exa --all --classify --color=always $@ | fzf --ansi)') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open --; }; func"
alias xf="git clean --force"
alias xfd="git clean -fd"
alias xi="git clean --interactive"
alias xid="git clean -id"
alias xl="exa --classify --color=always --long"
alias xo="exa --classify --color=always --oneline"
alias xr="exa --classify --color=always --reverse"
alias xt="exa --classify --color=always --tree"
alias xx="func() {local untracked=$(echo '$(git clean -dfn | sed s/^Would\ remove\ // | fzf)') && [ $(echo '$untracked') ] && echo $(echo '$untracked') | tr '\n' '\0' | xargs -0 git clean -df; }; func"
alias y="fc -ln -1 | pbcopy"
alias yy="func() { local cmds=$(echo '$(fc -ln $@ | fzf -m --tac)') && [ $(echo '$cmds') ] && echo $(echo '$cmds') | pbcopy; }; func"
alias z="fasd -d"
alias zc="fasd -de code"
alias zl="fasd -dl" # list all directories
alias zn="fasd -de 'nvim'"
alias zo="fasd -de open"
alias zp="fasd -de pycharm"
alias zv="fasd -de '$EDITOR'"
alias zz="fasd_cd() { local _fasd_ret=$(echo '$(fasd -e echo $@)') && [ $(echo '$_fasd_ret') ] && [ -d $(echo '$_fasd_ret') ] && cd $(echo '$_fasd_ret') || echo $(echo '$_fasd_ret'); }; fasd_cd -di"

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

