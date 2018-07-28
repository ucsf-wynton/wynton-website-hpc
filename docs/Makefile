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

serve:
	bundle exec jekyll serve --port 4001 &

stop:
	pkill --echo --count --full jekyll


wynton:
	PAGES_REPO_NWO=UCSF-HPC/wynton jekyll build --incremental --destination ~/gitea/gitea/public/wynton-help
