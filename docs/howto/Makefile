all:

%.md: FORCE
	mdi inject "$@"

r: FORCE
#	mdi build "$@".sh
	mdi inject "$@".md

python: FORCE
	mdi build "$@".sh
	mdi inject "$@".md

FORCE:
