SHELL=bash
.ONESHELL:

include Makefile.checks

# Examples:
# export JEKYLL_HOST=selfhost; make serve 
# JEKYLL_HOST=selfhost make serve 
# make serve JEKYLL_HOST=selfhost
JEKYLL_HOST:=${JEKYLL_HOST}

JEKYLL_OPTS=
ifeq ($(JEKYLL_HOST),selfhost)
#JEKYLL_OPTS=--safe --baseurl '/hpc' --config _config.yml,_config_selfhost.yml
JEKYLL_OPTS=--safe --config _config.yml,_config_selfhost.yml
endif


## Requirements:
## * See https://jekyllrb.com/docs/installation/;
##   - Ruby Dev (e.g. sudo apt-get install ruby-dev)
##   - RubyGems ('bundle', e.g. sudo apt install ruby-bundler)
##   - Jekyll (e.g. gem install bundler jekyll github-pages)
dynamic:
	cd hpc/software; $(MAKE)

dynamic-force:
	cd hpc/software; $(MAKE) force

init: .git/hooks/pre-commit

.git/hooks/pre-commit:
	cd .git/hooks; \
	ln -s ../../.githooks/pre-commit .

start:
	bundle exec jekyll serve --port 4001 $(JEKYLL_OPTS) 2> ../jekyll.log &

stop:
	- pkill --echo --count --full jekyll

restart: stop start

serve: start

wynton:
	PAGES_REPO_NWO=UCSF-HPC/wynton jekyll build --incremental --destination ~/gitea/gitea/public/wynton-help

broadcast-off:
	cd hpc/assets/css/ && ln -fs broadcast-off.css broadcast.css

broadcast-on:
	cd hpc/assets/css/ && ln -fs broadcast-on.css broadcast.css

status-ok: broadcast-off
	sed -i -E 's/^([[:space:]]*status:)[[:space:]]+(.*)/\1 ok/' _config.yml

hpc/_data/users.yml: FORCE
	echo "nbr_of_accounts: $$(ldapsearch -H ldap://m1,ldap://m2 -LLL -x wyntonAccess=TRUE | grep -c ^uid:)" > $@.tmp
	echo "nbr_of_projects: $$(qconf -sprjl | wc -l | grep -vE '^[[:space:]]*0*[[:space:]]*$$')" >> $@.tmp
	echo "nbr_of_phi_accounts: $$(ldapsearch -H ldap://m1,ldap://m2 -LLL -x '(&(wyntonAccess=TRUE)(ProtectedAccess=TRUE))' | grep -c -E ^ucsfIDNumber:)">> $@.tmp
	if ! grep -q -E "nbr_of_projects:[[:space:]]*$$" $@.tmp; then \
	  mv $@.tmp $@; \
	else \
	  >&2 echo "WARNING: Empty 'nbr_of_project'. Ignoring. Keeping old."; \
	fi

hpc/_data/specs.yml-misc: FORCE
	## Node and core counts
	tf=$$(mktemp); \
	qstat -F | grep -E "(hf:x86-64-v=|qf:hostname=|hl:m_core=|-----)" | sed -E 's/^ *.*=//' | tr $$'\n' , | sed -E 's/--+/\n/g' | sed -E 's/(^,|,$$)//g' | sort -u > "$$tf"; \
	sed -i -E "s/^(nodes:) +[[:digit:]]+/\1 $$(wc --lines "$$tf" | sed 's/ .*//')/" "$@"

hpc/_data/specs.yml-gpu: hpc/assets/data/gpu_nodes.tsv
	## GPU counts
	module try-load CBI sqlite; \
	read -r -a count < <(grep -vE "^#" "$<" | sqlite3 ':memory:' '.mode tabs' '.import /dev/stdin data' 'select count("#GPUs"),sum("#GPUs") from data' 'select count("#GPUs"),sum("#GPUs") from data where Contributor == "communal"' | tr $$'\n' '\t'); \
	sed -i -E "s/^(gpu_nodes:) +[[:digit:]]+/\1 $${count[0]}/; s/^(gpus:) +[[:digit:]]+/\1 $${count[1]}/; s/^(communal_gpu_nodes:) +[[:digit:]]+/\1 $${count[2]}/; s/^(communal_gpus:) +[[:digit:]]+/\1 $${count[3]}/" "$@"


hpc/_data: hpc/_data/users.yml hpc/_data/specs.yml-gpu hpc/_data/specs.yml-misc

_data: hpc/_data
	cp -p $</* $@/

hpc/assets/data/compute_shares.tsv: FORCE
	wynton shares tsv > $@.tmp
	grep -q -E "^# Total queue_slots:[[:space:]]*0$$" $@.tmp || mv $@.tmp $@

hpc/assets/data/gpu_shares.tsv: FORCE
	wynton gpushares tsv > $@

assets: hpc/assets/data/compute_shares.tsv hpc/assets/data/gpu_shares.tsv

deploy:
	git pull
	git commit -am "Website updated [ci skip]" && git push 2> /dev/null

FORCE:
