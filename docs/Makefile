SHELL=bash
.ONESHELL:

TMPDIR:=$(shell mktemp -d)

## Colored strings?
ifdef TERM
	TPUT:=true
	OK  :=$(shell tput setaf 2; printf "%s" " OK "; tput sgr0)
	FAIL:=$(shell tput setaf 1; printf "%s" "FAIL"; tput sgr0)
	YAMLLINT_OPTS:=-f colored
else
	TPUT:=false
	OK  :=$(shell printf "%s" " OK ")
	FAIL:=$(shell printf "%s" "FAIL")
	YAMLLINT_OPTS:=
endif

# Examples:
# export JEKYLL_HOST=selfhost; make serve 
# JEKYLL_HOST=selfhost make serve 
# make serve JEKYLL_HOST=selfhost
JEKYLL_HOST:=${JEKYLL_HOST}

JEKYLL_OPTS=
ifeq ($(JEKYLL_HOST),selfhost)
JEKYLL_OPTS=--safe --config _config.yml,_config_selfhost.yml
endif


## Requirements:
## * See https://jekyllrb.com/docs/installation/;
##   - Ruby Dev (e.g. sudo apt-get install ruby-dev)
##   - RubyGems ('bundle', e.g. sudo apt install ruby-bundler)
##   - Jekyll (e.g. gem install bundler jekyll github-pages)
dynamic:
	cd software; $(MAKE)

dynamic-force:
	cd software; $(MAKE) force

init: .git/hooks/pre-commit

.git/hooks/pre-commit:
	cd .git/hooks; \
	ln -s ../../.githooks/pre-commit .

start:
	bundle exec jekyll serve --baseurl '/hpc' --port 4001 $(JEKYLL_OPTS) 2>> jekyll.log &

stop:
	- pkill --echo --count --full jekyll

restart: stop start

serve: start

wynton:
	PAGES_REPO_NWO=UCSF-HPC/wynton jekyll build --incremental --destination ~/gitea/gitea/public/wynton-help

spell:
	@Rscript -e 'paths <- dir(path = c("..", "."), pattern = "*[.]md$$", full.names = TRUE, recursive = TRUE); paths <- grep("_site", paths, value = TRUE, invert = TRUE); words <- spelling::spell_check_files(paths, ignore = readLines("WORDLIST")); print(words); ok <- (nrow(words) == 0); quit(status = !ok)'

broadcast-off:
	cd assets/css/ && ln -fs broadcast-off.css broadcast.css

broadcast-on:
	cd assets/css/ && ln -fs broadcast-on.css broadcast.css

status-ok: broadcast-off
	sed -i -E 's/^([[:space:]]*status:)[[:space:]]+(.*)/\1 ok/' _config.yml

_data/users.yml: FORCE
	echo "nbr_of_accounts: $$(ldapsearch -H ldap://m1,ldap://m2 -LLL -x wyntonAccess=TRUE | grep -c ^uid:)" > $@
	echo "nbr_of_projects: $$(qconf -sprjl | wc -l)" >> $@

_data: _data/users.yml

assets/data/compute_shares.tsv: FORCE
	wynton shares tsv > $@

assets: assets/data/compute_shares.tsv

deploy:
	git pull
	git commit -am "Website updated [ci skip]" && git push 2> /dev/null

yaml-check:
	@Rscript -e 'paths <- dir(path = c(".", "_data"), pattern = "*[.]yml$$", full.names = TRUE, recursive = TRUE); yaml <- lapply(paths, FUN = yaml::read_yaml)'

markdownlint:
	@stdout=$(TMPDIR)/stdout

	ok_count=0
	error_count=0
	config=.markdownlint.json

	echo "*** $@:"
	if [[ ! -f "$$config" ]]; then
	   echo "File not found: $$config (PWD=$$PWD)"
	   ls -la
	   exit 1
	fi

	files=$$(find . -type f -name "*.md" -not -path "./_site/*")
	for file in $$files; do
	   $(TPUT) && printf "[    ] checking %s" "$$file"
	   if markdownlint --config "$$config" "$$file" 2>> "$$stdout" ; then
	     ok_count=$$((ok_count+1))
	     $(TPUT) && printf "\r"
	     printf "[$(OK)] checking %s\\n" "$$file"
	   else
	     error_count=$$((error_count+1))
	     $(TPUT) && printf "\r"
	     printf "[$(FAIL)] checking %s\\n" "$$file"
	   fi
	done

	echo "RESULT: $$ok_count OK, $$error_count ERROR"
	if (( error_count > 0 )); then
	  cat "$$stdout"
	  exit 1
	fi

markdown-link-check:
	@stdout=$(TMPDIR)/stdout

	ok_count=0
	error_count=0
	config=.markdown-link-check.json

	echo "*** $@:"
	if [[ ! -f "$$config" ]]; then
	   echo "File not found: $$config (PWD=$$PWD)"
	   ls -la
	   exit 1
	fi

	files=$$(find . -type f -name "*.md" -not -path "./_site/*")
	for file in $$files; do
	   $(TPUT) && printf "[    ] checking %s" "$$file"
	   if markdown-link-check --quiet --config "$$config" "$$file" &>> "$$stdout" ; then
	     ok_count=$$((ok_count+1))
	     $(TPUT) && printf "\r"
	     printf "[$(OK)] checking %s\\n" "$$file"
	   else
	     error_count=$$((error_count+1))
	     $(TPUT) && printf "\r"
	     printf "[$(FAIL)] checking %s\\n" "$$file"
	   fi
	done

	echo "RESULT: $$ok_count OK, $$error_count ERROR"
	if (( error_count > 0 )); then
	  grep -B 1 -E "(^ERROR:|^\[(✖|x)\]|Status: [0-9]+$$)" "$$stdout"
	  echo "$$stdout"
	  exit 1
	fi


check: spell markdownlint markdown-link-check

FORCE:
