all:

%.md: FORCE
	mdi inject "$@"

r: FORCE
	mdi build "$@".sh
	sed -i 's|/R-4.1.2-gcc8|/R-4.1.3-gcc8|g' .mdi/r.code-block*
	sed -i 's|/R-4-1-branch|/R-4.1.3-gcc8|g' .mdi/r.code-block*

	sed -i 's|/wynton/home/cbi/shared/software|{{ site.path.cbi_software }}|g' .mdi/r.code-block*
	sed -i 's|/c4/home/alice/software/R-devel|{{ site.path.cbi_software }}|g' .mdi/r.code-block*
	sed -i 's|/software/c4/cbi/software|{{ site.path.cbi_software }}|g' .mdi/r.code-block*

	sed -i 's|/4.0-CBI-gcc8|4.1-CBI-gcc8|g' .mdi/r.code-block*
	sed -i 's|/c4/home/alice/|{{ site.user.home }}|g' .mdi/r.code-block*

	mdi inject "$@".md

	sed -i 's|/R-4.1.2-gcc8|/R-4.1.3-gcc8|g' "$@".md

python: FORCE
	mdi build "$@".sh
	mdi inject "$@".md

FORCE:
