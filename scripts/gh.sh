gh auth login
gh ssh-key add ~/.ssh/$(whoami)_$(sysctl hw.model | cut -d\ -f2).pub -t $(whoami)_$(sysctl hw.model | cut -d\ -f2)
