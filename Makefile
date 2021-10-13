check: spell shellcheck yaml-check markdownlint markdown-link-check

cron-shellcheck:
	cd cron-scripts; $(MAKE) $@

markin-shellcheck:
	cd docs; $(MAKE) $@

spell:
	cd docs; $(MAKE) $@

yaml-check:
	cd docs; $(MAKE) $@

markdownlint:
	cd docs; $(MAKE) $@

markdown-link-check:
	cd docs; $(MAKE) $@
