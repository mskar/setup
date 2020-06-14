MAC_LINUX = MacOSX
USER_NAME = mskar
REPO_NAME = book
PROJ_DESC = 
IS_PRIVATE = true
HOME_PAGE = https://$(USER_NAME).github.io/$(REPO_NAME)
VENV_NAME = $(REPO_NAME)
VENV_PATH = ~/miniconda/envs/$(VENV_NAME)

all: env git

# Conda environment setup
env: ~/miniconda $(VENV_PATH)/bin/activate

~/miniconda:
	curl https://repo.anaconda.com/miniconda/Miniconda3-latest-$(MAC_LINUX)-x86_64.sh -o ~/miniconda.sh
	bash ~/miniconda.sh -bp ~/miniconda

$(VENV_PATH)/bin/activate: environment.yml
	conda env update -n $(VENV_NAME) --file environment.yml
	touch $(VENV_PATH)/bin/activate

environment.yml:
	conda create -yn $(VENV_NAME) python=3
	conda env export --from-history -n $(VENV_NAME) > environment.yml

# Git setup (assumes identical github and bitbucket usernames)
git: .git/

.git/:
	curl --data '{"name":"$(REPO_NAME)","description":"$(PROJ_DESC)","private":$(IS_PRIVATE),"homepage":"$(HOME_PAGE)"}' --user $(USER_NAME) https://api.github.com/user/repos
	curl --data '{"description":"$(PROJ_DESC)","is_private":"$(IS_PRIVATE)","website":"$(HOME_PAGE)"}' --header "Content-Type: application/json" --user $(USER_NAME) https://api.bitbucket.org/2.0/repositories/$(USER_NAME)/$(REPO_NAME)
	git init
	git add --all
	git commit --message "First commit to the project named $(REPO_NAME)"
	git remote add origin https://github.com/$(USER_NAME)/$(REPO_NAME)
	git remote set-url origin https://$(USER_NAME)@bitbucket.org/$(USER_NAME)/$(REPO_NAME) --add
	git remote add hub https://github.com/$(USER_NAME)/$(REPO_NAME)
	git remote add bit https://$(USER_NAME)@bitbucket.org/$(USER_NAME)/$(REPO_NAME)
	git push --set-upstream origin master
	curl --data '{"source":{"branch":"master","path":"/docs"}}' --header "ACCEPT: application/vnd.github.switcheroo-preview+json" --user $(USER_NAME) https://api.github.com/repos/$(USER_NAME)/$(REPO_NAME)/pages

# Git workflow
add: git
	git add --update

commit: add
	git commit --message "Changed files: $$(git status --porcelain | grep -v '?' | cut -c4- | tr '\n' ' ')"

push: commit
	git push

amend:
	git add --update
	git commit --amend --reset-author --reuse-message=HEAD
	git push --force

# Python-specific section (delete if not needed)
python: pyignore $(VENV_PATH)/bin/black $(VENV_PATH)/bin/pytest

pyignore:
	curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore >> .gitignore

$(VENV_PATH)/bin/black:
	conda install -n $(VENV_NAME) black
	conda env export --from-history -n $(VENV_NAME) > environment.yml
	touch $(VENV_PATH)/bin/activate

$(VENV_PATH)/bin/pytest:
	conda install -n $(VENV_NAME) pytest pytest-mypy
	conda env export --from-history -n $(VENV_NAME) > environment.yml
	touch $(VENV_PATH)/bin/activate

pytest: $(VENV_PATH)/bin/black pytest.ini
	$(VENV_PATH)/bin/pytest

pytest.ini:
	echo "[pytest]\naddopts = --doctest-modules --mypy --mypy-ignore-missing-imports" > pytest.ini

pylint: $(VENV_PATH)/bin/black
	$(VENV_PATH)/bin/black

# R-specific section (delete if not needed)
r: rignore $(VENV_PATH)/lib/R/library/testthat $(VENV_PATH)/lib/R/library/styler

rignore:
	curl https://raw.githubusercontent.com/github/gitignore/master/R.gitignore >> .gitignore

$(VENV_PATH)/lib/R/library/testthat:
	conda install -n $(VENV_NAME) r-testthat
	conda env export --from-history -n $(VENV_NAME) > environment.yml
	touch $(VENV_PATH)/bin/activate

$(VENV_PATH)/lib/R/library/styler:
	conda install -n $(VENV_NAME) r-styler
	conda env export --from-history -n $(VENV_NAME) > environment.yml
	touch $(VENV_PATH)/bin/activate

rtest: $(VENV_PATH)/lib/R/library/testthat
	mkdir -p tests/testthat
	$(VENV_PATH)/bin/Rscript -e "testthat::test_dir('tests/testthat')"

rlint: $(VENV_PATH)/lib/R/library/styler
	$(VENV_PATH)/bin/Rscript -e "styler::style_dir()"

.PHONY: env git add commit push amend pyignore pytest pylint rignore rtest rlint
