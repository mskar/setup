# If you ran brew install vim, add /usr/local/bin/vim to $PATH to use homebrew installed vim, rather than the version pre-installed on mac at /usr/bin/vim
# Or run brew install vim --with-override-system-vi
export PATH="/usr/local/bin/vim:$PATH"
# to use vi at the command line (you start in Insert mode, rather than Normal mode).
set -o vi
# to enable bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# added by Miniconda3 installer
export PATH="/Users/marskar/miniconda3/bin:$PATH"
# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/marskar/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/marskar/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/marskar/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/marskar/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
