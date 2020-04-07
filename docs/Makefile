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
	bundle exec jekyll serve --baseurl '/hpc' --port 4001 $(JEKYLL_OPTS) &>> jekyll.log &

stop:
	- pkill --echo --count --full jekyll

restart: stop start

serve: start

wynton:
	PAGES_REPO_NWO=UCSF-HPC/wynton jekyll build --incremental --destination ~/gitea/gitea/public/wynton-help

spell:
	Rscript -e 'paths <- dir(pattern = "*[.]md$$", full.names = TRUE, recursive = TRUE); paths <- grep("_site", paths, value = TRUE, invert = TRUE); words <- spelling::spell_check_files(paths, ignore = readLines("WORDLIST")); words'

broadcast-off:
	cd assets/css/ && ln -fs broadcast-off.css broadcast.css

broadcast-on:
	cd assets/css/ && ln -fs broadcast-on.css broadcast.css


_data/users.yml: FORCE
	echo "nbr_of_accounts: $$(ldapsearch -h m1 -x -LLL | grep -c 'wyntonAccess: TRUE')" > $@

_data: _data/users.yml

_config.yml: _config.yml.rsp FORCE
	Rscript -e R.rsp::rfile $<

assets/data/compute_shares.tsv: FORCE
	wynton shares tsv > $@

assets: assets/data/compute_shares.tsv

deploy:
	git pull
	git commit -am "Website updated" && git push 2> /dev/null

FORCE:
