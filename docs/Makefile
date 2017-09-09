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
	pkill --echo --count "ruby2.3"

