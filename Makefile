check: shellcheck yaml-check markdownlint spell 

shellcheck:
	cd cron-scripts; $(MAKE) $@

spell:
	cd docs; $(MAKE) $@

yaml-check:
	cd docs; $(MAKE) $@

markdownlint:
	cd docs; $(MAKE) $@

