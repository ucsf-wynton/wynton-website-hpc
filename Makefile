all: check

start:
	cd docs; $(MAKE) $@

restart:
	cd docs; $(MAKE) $@

stop:
	cd docs; $(MAKE) $@

check: spell shellcheck yaml-check markdownlint markdown-link-check check-usernames check-here-links

cron-shellcheck:
	cd cron-scripts; $(MAKE) shellcheck

## Backward compatibility /HB 2022-01-12
shellcheck: cron-shellcheck

markin-shellcheck:
	cd docs; $(MAKE) $@

spelling:
	cd docs; $(MAKE) $@

yaml-check:
	cd docs; $(MAKE) $@

markdownlint:
	cd docs; $(MAKE) $@

markdown-link-check:
	cd docs; $(MAKE) $@

check-usernames:
	cd docs; $(MAKE) $@

check-here-links:
	cd docs; $(MAKE) $@

check-absolute-links:
	cd docs; $(MAKE) $@

check-legacy:
	cd docs; $(MAKE) $@
