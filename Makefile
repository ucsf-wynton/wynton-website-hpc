all: check

start:
	cd docs; $(MAKE) $@

restart:
	cd docs; $(MAKE) $@

stop:
	cd docs; $(MAKE) $@

check: spell shellcheck yaml-check markdownlint markdown-link-check check-usernames check-here-links

cron-shellcheck:
	$(MAKE) -C cron-scripts --silent shellcheck

## Backward compatibility /HB 2022-01-12
shellcheck: cron-shellcheck

markin-shellcheck:
	@$(MAKE) -C docs --silent $@

spelling:
	@$(MAKE) -C docs --silent $@

yaml-check:
	@$(MAKE) -C docs --silent $@

markdownlint:
	@$(MAKE) -C docs --silent $@

markdown-link-check:
	@$(MAKE) -C docs --silent $@

check-usernames:
	@$(MAKE) -C docs --silent $@

check-here-links:
	@$(MAKE) -C docs --silent $@

check-absolute-links:
	@$(MAKE) -C docs --silent $@

check-legacy:
	@$(MAKE) -C docs --silent $@
