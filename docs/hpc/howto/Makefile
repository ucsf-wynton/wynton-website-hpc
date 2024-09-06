SHELL=bash

all:

install:
	module purge; \
	module load CBI r; \
	Rscript --version; \
	Rscript -e "if (!requireNamespace('remotes')) { chooseCRANmirror(ind = 1); install.packages('remotes') }"; \
	Rscript -e "remotes::install_github('HenrikBengtsson/markin')"; \
	Rscript -e "packageVersion('markin')"

debug:
	module purge; \
	module load CBI r; \
	Rscript --version; \
	Rscript -e "packageVersion('markin')"

%.md: FORCE
	markin inject "$@"

r: FORCE
	markin build "$@".sh
	sed -i 's|/R-4.1.2-gcc8|/R-4.1.3-gcc8|g' .mdi/r.code-block*
	sed -i 's|/R-4-1-branch|/R-4.1.3-gcc8|g' .mdi/r.code-block*

	sed -i 's|/wynton/home/cbi/shared/software|{{ site.path.cbi_software }}|g' .mdi/r.code-block*
	sed -i 's|/c4/home/alice/software/R-devel|{{ site.path.cbi_software }}|g' .mdi/r.code-block*
	sed -i 's|/software/c4/cbi/software|{{ site.path.cbi_software }}|g' .mdi/r.code-block*

	sed -i 's|/4.0-CBI-gcc8|4.1-CBI-gcc8|g' .mdi/r.code-block*
	sed -i 's|/c4/home/alice/|{{ site.user.home }}|g' .mdi/r.code-block*

	markin inject "$@".md

	sed -i 's|/R-4.1.2-gcc8|/R-4.1.3-gcc8|g' "$@".md

python: FORCE
	module purge;      markin build "$@".sh
	module load CBI r; markin inject "$@".md

conda: FORCE
	module purge;      markin build "$@".sh
	module load CBI r; markin inject "$@".md

FORCE:
