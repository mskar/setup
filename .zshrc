# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment
# https://github.com/sharkdp/fd#using-fd-with-fzf
# https://github.com/junegunn/fzf#respecting-gitignore
# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export EDITOR=$(brew --prefix)/bin/nvim
export PATH=$HOME/miniconda/bin:$PATH
export KEYTIMEOUT=1
export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--bind=change:top,alt-p:toggle-preview,alt-w:toggle-preview-wrap --cycle --exit-0 --inline-info --multi --no-height --no-sort --preview='bat --style=numbers --color=always {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --preview-window='70%:hidden' --reverse --tiebreak=index"
export FZF_CTRL_T_OPTS="--select-1"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"
export FZF_ALT_C_OPTS="--no-multi --preview 'exa --all --classify --color=always -L=2 -T {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --select-1"
# brew installed packages
# export PATH=/usr/local/bin:$PATH
WORDCHARS='_'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5' # https://stackoverflow.com/a/47313453

# Options
# https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/
setopt always_to_end
setopt auto_menu         # show completion menu on successive tab press
setopt autocd
setopt autopushd
setopt complete_in_word
setopt correct
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_save_no_dups
setopt hist_verify            # show command with history expansion to user before running it
setopt pushdignoredups
setopt pushdminus
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
alias \?='alias | grep'
alias -- -='cd -'
alias -g ......='../../../../..'
alias -g .....='../../../..'
alias -g ....='../../..'
alias -g ...='../..'
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias 0="directory=$(echo '$(dirs -v | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --preview="exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --with-nth=4..)') && cd $(echo '$directory')"
alias 1="cd -"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"
alias 6="cd -6"
alias 7="cd -7"
alias 8="cd -8"
alias 9="cd -9"
alias a="git add"
alias aa="func() { local files=$(echo '$(git status -s | fzf --nth=2.. --preview="if [ \$(git ls-files --other --exclude-standard {2..} | sed s/\ //g) ]; then; git diff --color=always --color-words --no-index -- /dev/null {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; git diff --color=always --color-words {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi" | cut -c4-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git add $(echo '$@') --; }; func"
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
alias am="git commit --amend --reset-author"
alias amp="git commit --amend --reset-author && git push --force"
alias amr="git commit --amend --reset-author --reuse-message=HEAD"
alias amrp="git commit --amend --reset-author --reuse-message=HEAD && git push --force"
alias ap="git add --patch"
alias b="git branch"
alias bD="git branch -D" # delete branch (even if not merged)
alias ba="git branch --all"
alias bb="func() { local branch=$(echo '$(git branch --color=always --verbose | fzf --ansi --bind="alt-x:execute-silent(git branch -D {1})+reload(git branch --color=always --verbose)" --preview="git diff --color=always \$(echo \$(git rev-parse --abbrev-ref HEAD)..{1}) | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" | cut -c3- | cut -d " " -f1)') && [ $(echo '$branch') ] && git checkout $(echo '$branch'); }; func"
alias bd="git branch --delete" # delete fully merged branch
alias bi="brew install"
alias bl="brew list"
alias br="git branch --remotes"
alias bs="git branch --set-upstream-to=origin/master master"
alias bu="brew upgrade"
alias bx="brew uninstall"
alias c="func() { git clone $(echo '$1 ${${1#*.*[:/]}%.*}') && cd $(echo '${${1#*.*[:/]}%.*}'); }; func"; # clone and cd into repo (${parameter#pattern} removes pattern from the beginning, while ${parameter%pattern} removes pattern from the end
alias ca="conda activate"
alias caa="git commit --all --amend --reset-author"
alias caam="func() { git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author; }; func";
alias caamp="func() { git commit --all --amend --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" --reset-author && git push --force; }; func";
alias caap="git commit --all --amend --reset-author && git push --force"
alias caar="git commit --all --amend --reset-author --reuse-message=HEAD"
alias caarp="git commit --all --amend --reset-author --reuse-message=HEAD && git push --force"
alias cam="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias camp="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias campf="func() { git commit --all --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
alias cap="git commit --all --reedit-message=HEAD && git push"
alias capf="git commit --all --reedit-message=HEAD && git push --force"
alias car="git commit --all --reuse-message=HEAD"
alias carp="git commit --all --reuse-message=HEAD && git push"
alias carpf="git commit --all --reuse-message=HEAD && git push --force"
alias cc="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- $@') }; func"
alias cda="conda deactivate"
alias ce="conda env"
alias cec="conda create -yc conda-forge -n"
alias cee="conda env export > environment.yaml"
alias cel="conda env list"
alias cer="conda env remove"
alias cern="conda env remove -n"
alias cerp="conda env remove -p"
alias ceu="conda env update"
alias ci="conda install -yc conda-forge"
alias ciz="conda init zsh"
alias cl="conda list"
alias cm="func() { git commit --message \"$(echo '${*:-Changed files: $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")}')\"; }; func";
alias cmp="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias cmpf="func() { git commit --message \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push --force; }; func";
alias cn="git clean -n"
alias cnd="git clean -nd"
alias co-="git checkout --"
alias co="git checkout"
alias cob="git checkout -b"
alias coh="func() { git checkout $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias com="git checkout master"
alias cr="conda remove"
alias crp="git commit --reuse-message=HEAD && git push"
alias crpf="git commit --reuse-message=HEAD && git push --force"
alias cu="conda update"
alias cx="conda uninstall"
alias d="git diff --word-diff=color"
alias dc="git difftool -yt code --extcmd 'code --wait --diff'"
alias dcs="git difftool -yt code --extcmd 'code --wait --diff' --staged"
alias dd="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && dt $(echo '$commit -- $@') }; func"
alias dh="func() { git diff --word-diff=color $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias dl="git diff --word-diff=color"
alias dn="git difftool -yt nvim --extcmd 'nvim -d'"
alias dns="git difftool -yt nvim --extcmd 'nvim -d' --staged"
alias dp="git difftool -yt pycharm --extcmd 'pycharm diff $LOCAL $REMOTE'"
alias dps="git difftool -yt pycharm --extcmd 'pycharm diff'"
alias ds="git diff --word-diff=color --staged"
alias dt="git difftool -yt vimdiff" # difftool is dt to match mergetool (mt)
alias dts="git difftool -yt vimdiff --staged"
alias duh="du -h"
alias dus="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias duss="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --staged"
alias dw="git diff --word-diff=color"
alias e="exa --all --classify --color=always"
alias ee="func() { local both=$(echo '$(exa --all --classify --color=always $@ | fzf --ansi --preview="if [[ {} == */ ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open --; }; func"
alias el="exa --all --classify --color=always --tree | less"
alias em="exa --all --classify --color=always --tree | more"
alias et="exa --all --classify --color=always --tree"
alias fcl="fc -l"
alias fcld="fc -ld"
alias fclf="fc -lf"
alias fixnames="find /tmp/ -depth -name *\ * -execdir rename 's/ /_/g' '{}' \;"
alias fl="fasd -fl"
alias fn="fasd -fe 'nvim'"
alias fo="fasd -fe open"
alias fp="fasd -fe pycharm"
alias fu="fasd -fe 'nvim -u ~/.SpaceVim/init.vim'"
alias fv="fasd -fe '$EDITOR'" # relies on EDITOR variable from line 121
alias g="grep --color=always --exclude-dir={.git,.idea,.vscode}"
alias gg="func() { local commit_file=$(echo '$(git grep -l ${1:-^} $(git rev-list --all --abbrev-commit) -- ${@:2} | fzf --bind="alt-enter:execute-silent(git checkout {1} -- {2})+down" --delimiter=: --no-multi --nth=2.. --preview="git diff HEAD --color=always {1} {2} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$commit_file') ] && echo -n $(echo '$commit_file') | tr ':' '\0' | xargs -0 git checkout; }; func"
alias gi="grep -i --color=always --exclude-dir={.git,.idea,.vscode}"
alias gir="grep -ir --color=always --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=always --exclude-dir={.git,.idea,.vscode}"
alias h2s="func() { local name=$(echo '${1:-origin}') && git remote set-url $(echo '$name $(git remote get-url $name | sed "s+https://+git@+;s+/+:+")') }; func"
alias hai="gh auth login"
alias hao="gh auth logout"
alias har="gh auth refresh"
alias has="gh auth status"
alias hgc="gh gist create"
alias hge="gh gist edit"
alias hgl="gh gist list"
alias glances="glances --disable-left-sidebar --disable-top --process-short-name --hide-kernel-threads"
alias hgv="gh gist view"
alias hrc="func() { gh repo create $(echo '$1') --$(echo '${2:-private}') $(echo '${@:3}') -y && cd $(echo '$1'); }; func"
alias hrf="gh repo fork"
alias hrv="gh repo view"
alias i="func() { cookiecutter gh:mskar/cookiecutter --no-input proj_name=$(echo '$1') proj_desc=$(echo '${2:-""}') is_private=$(echo '${3:-"false"}') user_name=$(echo '${4:-"mskar"}') full_name=$(echo '${5:-"Martin Skarzynski"}') && cd $(echo '$(echo "$1" | tr "[:upper:]" "[:lower:]" | tr " " "_")') && make git env; }; func";
alias ig="func() { echo $(echo 'echo $@ | tr " " "\n" >> $(git rev-parse --show-toplevel)/.gitignore'); }; func";
alias ii="func() { local files=$(echo '$(git ls-files --others --exclude-standard | fzf)') && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -I file bash -c 'echo "file" >> \$(git rev-parse --show-toplevel)/.gitignore'; }; func";
alias it="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func";
alias ite="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func";
alias itee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func";
alias j="func() { local directory=$(echo '$(fd --type d ^ $@ | fzf --no-multi --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && cd $(echo '$directory'); }; func";
alias jj="func() { local directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --with-nth=4..)') && cd $(echo '$directory'); }; func";
alias jt="func() { local directory=$(echo '$(fasd -Rdl | fzf --delimiter=/ --no-multi --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --with-nth=4..)') && cd $(echo '$directory') && tmux attach -t $(echo '${1:-${directory##*/}}') || tmux new -s $(echo '${1:-${directory##*/}}'); }; func";
alias jl="func() { local ipynb=$(echo '$(fd --type f --extension ipynb ^ $@ | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func";
alias jn="func() { local ipynb=$(echo '$(fd --type f --extension ipynb ^ $@ | fzf --no-multi --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func";
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && cd $(echo '${ntimes// /../}'); }; func";
alias kg="func() { ssh-keygen -t rsa -b 4096 -f $(echo '$1') -C $(echo '$1') && ssh-add ~/.ssh/$(echo '$1') && cat ~/.ssh/$(echo '$1').pub; }; func";
alias l="git log --format='%C(cyan)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D'"
alias la="ls -a"
alias lah="ls -ah"
alias lal="ls -al"
alias ld="git log --format='%C(cyan)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --date=short"
alias ll="func() { local commit=$(echo '$(git log --color=always --format="%C(cyan)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" -S $1 -- ${@:2} | fzf --ansi --nth=1,2,4..-2 --no-multi --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- ${@:2}') }; func"
alias lp="git log -p --word-diff=color"
alias lr="git log --format='%C(cyan)%>(12,trunc)%ar %Creset%<(80,trunc)%s %Cblue%h %Cgreen%<(17,trunc)%cn %Cred%D'"
alias m="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func";
alias ma="mamba activate"
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func";
alias mc="git mergetool -t code --extcmd 'code --wait'"
alias mcs="git mergetool -t code --extcmd 'code --wait' --staged"
alias mda="mamba deactivate"
alias me="mamba env"
alias mec="mamba create -c conda-forge -n"
alias mee="mamba env export > environment.yaml"
alias mel="mamba env list"
alias mer="mamba env remove"
alias mern="mamba env remove -n"
alias merp="mamba env remove -p"
alias meu="mamba env update"
alias mi="mamba install -yc conda-forge"
alias miz="mamba init zsh"
alias ml="mamba list"
alias mm="func() { local file=$(echo '$(git diff --diff-filter=U --name-only --relative | fzf --bind="alt-o:execute-silent(git checkout --ours {} && git add {})+reload(git diff --diff-filter=U --name-only --relative),alt-t:execute-silent(git checkout --theirs {} && git add {})+reload(git diff --diff-filter=U --name-only --relative)" --preview="git log --color=always --color-words --format=\"%n%C(cyan)%>(12,trunc)%ar %Cred%D %Creset%s %Cgreen%cn %Cblue%h\" --merge --patch -- {} | sed 1d | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +Gvdiff! -- $(echo '$file'); }; func";
alias mn="git mergetool -t nvim --extcmd 'nvim -d'"
alias mns="git mergetool -t nvim --extcmd 'nvim -d' --staged"
alias mr="mamba remove"
alias mt="git mergetool -t vimdiff" # mv is taken
alias mts="git mergetool -t vimdiff --staged"
alias mu="mamba update"
alias mus="git mergetool -t nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --staged"
alias mx="mamba uninstall"
alias n="nvim"
alias nd="func() { n $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ne="func() { local files=$(echo '$(n -u NONE -es "+pu =v:oldfiles" +%p +q! | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias nf="func() { local files=$(echo '$(fd --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias ng="func() { local file=$(echo '$(rg -l $@ | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias nh="n -c History" # this only works with -c, not --cmd
alias nl="func() { local files=$(echo '$(rg -l $@ | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nn="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias no="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias np="func() { local files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nr="func() { local files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias ns="func() { n -S $(echo '~/.config/nvim/session/$1.vim'); }; func";
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias nu="n -u ~/.SpaceVim/init.vim"
alias nw="func() { local files=$(echo '$(fd -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0 -n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nz="n ~/.zshrc"
alias o="open"
alias od="func() { local directory=$(echo '$(fd --type d ^ $@ | fzf --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && [ $(echo '$directory') ] && echo $(echo '$directory') | tr '\n' '\0' | xargs -0 open; }; func";
alias of="func() { local files=$(echo '$(fd --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias oh="func() { local files=$(echo '$(fd -e html --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias oo="func() { local both=$(echo '$(fasd -Ral | fzf --preview="if [[ \"$(fasd -Rdl)\" =~ {} ]]; then; exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi")') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open; }; func"
alias op="func() { local files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias or="func() { local files=$(echo '$(fd -e Rproj --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias ow="func() { local files=$(echo '$(fd -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias p="git push"
alias pc="pycharm"
alias pd="pycharm diff"
alias pf="git push --force"
alias pi="pip install"
alias pie="pip install --editable"
alias pit="pip install --target"
alias piu="pip install --upgrade"
alias pm="pycharm merge"
alias po="git push origin"
alias pof="git push origin --force"
alias pom="git push origin master"
alias pomf="git push origin master --force"
alias pp="func() { local files=$(echo '$(fd -e js --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 pycharm; }; func";
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
alias rab="func() { local name=${1:-origin} && git remote add bit https://bitbucket.org/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func";
alias rah="func() { local name=${1:-origin} && git remote add hub https://github.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func";
alias ral="func() { local name=${1:-origin} && git remote add lab https://gitlab.com/$(echo '${${$(git remote get-url $name)#*.*[:/]}%.*}'); }; func";
alias rao="git remote add origin"
alias raol="git remote add origin $(echo '$(git remote get-url lab)')"
alias raoh="git remote add origin $(echo '$(git remote get-url hub)')"
alias raob="git remote add origin $(echo '$(git remote get-url bit)')"
alias rau="git remote add upstream"
alias rba="git rebase --abort"
alias rbc="git rebase --continue"
alias rbq="git rebase --quit"
alias rbs="git rebase --skip"
alias render="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func";
alias rh="func() { git reset $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhh="func() { git reset --hard $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhs="func() { git reset --soft $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rot13="func() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < $(echo '$1') > temp.txt && mv temp.txt $(echo '$1'); }; func";
alias rr="func() { local files=$(echo '$(git diff HEAD --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --staged --worktree --; }; func"
alias rrm="git remote remove"
alias rrmo="git remote remove origin"
alias rrmu="git remote remove upstream"
alias rs="func() { local files=$(echo '$(git diff --staged --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --staged --; }; func"
alias rsu="git remote set-url"
alias rsub="git remote set-url bit"
alias rsuba="func() { git remote set-url bit $(echo '$@') --add; }; func";
alias rsuh="git remote set-url hub"
alias rsuha="func() { git remote set-url hub $(echo '$@') --add; }; func";
alias rsul="git remote set-url lab"
alias rsula="func() { git remote set-url lab $(echo '$@') --add; }; func";
alias rsuo="git remote set-url origin"
alias rsuoa="func() { git remote set-url --add origin $(echo '$@'); }; func";
alias rsuoab="func() { git remote set-url --add origin $(echo '$(git remote get-url bit)'); }; func";
alias rsuoah="func() { git remote set-url --add origin $(echo '$(git remote get-url hub)'); }; func";
alias rsuoal="func() { git remote set-url --add origin $(echo '$(git remote get-url lab)'); }; func";
alias rsuu="git remote set-url upstream"
alias rsuua="func() { git remote set-url upstream $(echo '$@') --add; }; func";
alias rv="git remote -v"
alias rw="func() { local files=$(echo '$(git diff HEAD --diff-filter=M --name-only --relative $@ | fzf --preview="git diff HEAD --color=always --color-words -- {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git restore --source=HEAD --worktree --; }; func"
alias s2h="func() { local name=$(echo '${1:-origin}') && git remote set-url $(echo '$name $(git remote get-url $name | sed "s+:+/+;s+git@+https://+")') }; func"
alias s="git status"
alias sa="git stash apply"
alias saa="ssh-add -A";
alias sal="ssh-add -l";
alias sb="git stash branch"
alias sc="git stash clear"
alias sd="git stash drop"
alias sl="git stash list"
alias sp="git stash push"
alias ss="func() { local stash=$(echo '$(git stash list --format="%gd %s" | fzf --bind="alt-enter:execute-silent(git stash pop {1})+reload(git stash list --format=%gd\ %s),alt-x:execute-silent(git stash drop {1})+reload(git stash list --format=%gd\ %s)" --no-multi --preview="git stash show --color=always {1} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="60%" --with-nth=4.. | cut -d " " -f1)') && [ $(echo '$stash') ] && git stash pop $(echo '$stash') }; func"
alias su="git stash push && git pull --rebase"
alias sub="git stash push && git pull --rebase && git stash branch"
alias sun="git status --untracked-files=no"
alias sup="git stash push && git pull --rebase && git stash pop"
alias sw="git switch"
alias swC="git switch -C"
alias swc="git switch -c"
alias sz="source ~/.zshrc"
alias t="func() {local session=$(echo '${1:-${PWD##*/}}') && tmux attach -t $(echo '$session') || tmux new -s $(echo '$session'); }; func"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias ti="tmux info"
alias tk="tmux kill-session"
alias tkt="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new"
alias tns="tmux new -s"
alias ts="tmux switch"
alias tst="tmux switch -t"
alias tt="tmux attach -t $(echo '$(tmux list-sessions | fzf -m --no-sort | cut -d: -f1)')"
alias u="git pull --rebase"
alias uo="git pull origin --rebase"
alias uom="git pull --rebase origin master"
alias v="$EDITOR"
alias vd="func() { v $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ve="func() { local files=$(echo '$(v -es --noplugin -u ~/.vimrc "+set nonumber" "+pu =v:oldfiles" +%p +q! | sed /^.$/d | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vf="func() { local files=$(echo '$(fd --type f ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vfh="func() { local files=$(echo '$(fd --type f --hidden ^ $@ | fzf)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vg="func() { local file=$(echo '$(rg -l $@ | fzf --no-multi --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias vh="v -c History" # this only works with -c, not --cmd
alias vl="func() { local files=$(echo '$(rg -l $@ | fzf --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vo="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias vp="func() { local files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vr="func() { local files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vs="func() { v -S $(echo '~/.vim/session/$1.vim'); }; func";
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias vu="v -u ~/.SpaceVim/vimrc"
alias vv="func() { local files=$(echo '$(fasd -Rfl | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vw="func() { local files=$(echo '$(fd -e docx --type f ^ $@ | fzf --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always")') && [ $(echo '$files') ] && echo $(echo '$files') | sed 's/docx/md/;p;s/md/docx/' | tr '\n' '\0' | xargs -0 -n2 pandoc -f docx -t markdown -o && echo $(echo '${files//docx/md}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vz="v ~/.zshrc"
alias ww="func() { local files=$(echo '$(fd -e js --type f ^ $@ | fzf --delimiter=/ --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 webstorm; }; func";
alias x="git clean -df"
alias xx="func() {local untracked=$(echo '$(git clean -dfn | sed s/^Would\ remove\ // | fzf)') && [ $(echo '$untracked') ] && echo $(echo '$untracked') | tr '\n' '\0' | xargs -0 git clean -df; }; func";
alias y="fc -ln -1 | pbcopy"
alias yy="func() { local cmds=$(echo '$(fc -ln $@ | fzf -m )') && [ $(echo '$cmds') ] && echo $(echo '$cmds') | pbcopy; }; func";
alias z="fasd -d"
alias zc="fasd -de code"
alias zl="fasd -dl" # list all directories
alias zn="fasd -de 'nvim'"
alias zo="fasd -de open"
alias zp="fasd -de pycharm"
alias zu="fasd -de 'vim -u ~/.SpaceVim/vimrc'"
alias zv="fasd -de '$EDITOR'"
alias zz="fasd_cd() { local _fasd_ret=$(echo '$(fasd -e echo $@)') && [ -z $(echo '$_fasd_ret') ] || [ -d $(echo '$_fasd_ret') ] && cd $(echo '$_fasd_ret') || echo $(echo '$_fasd_ret'); }; fasd_cd -di"

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
bindkey -M viins "\e'" quote-line
bindkey -M viins '\e"' quote-region
bindkey -M viins '\e.' insert-last-word
bindkey -M viins '\e@' set-mark-command
bindkey -M viins '\eb' backward-word
bindkey -M viins '\ec' capitalize-word
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
bindkey -M viins '^r' fzf-history-widget
bindkey -M viins '^t' transpose-chars
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^x^b' vi-match-bracket
bindkey -M viins '^x^e' edit-command-line
bindkey -M viins '^x^f' fzf-file-widget
bindkey -M viins '^x^j' fzf-cd-widget
bindkey -M viins '^x^u' undo
bindkey -M viins '^x^x' exchange-point-and-mark
bindkey -M viins '^xu' undo
bindkey -M viins '^y' yank

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/$USER/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/$USER/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/$USER/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/$USER/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
