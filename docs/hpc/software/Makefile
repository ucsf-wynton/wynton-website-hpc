SHELL=bash

PAGE=software-repositories

all: $(PAGE).md

clean:
	rm -rf lmod_data/

build:
	touch $(PAGE).md.rsp
	make all
	git diff

$(PAGE).md: $(PAGE).md.rsp r-packages
	module purge; \
	module load CBI r && \
	Rscript -e R.rsp::rfile $< --postprocess=FALSE

deploy: $(PAGE).md
	git commit $< -m "SOFTWARE: Rebuilt set of available modules [${HOSTNAME}]" &> /dev/null; true
	git push &> /dev/null; true

r-packages:
	module purge; \
	module load CBI r && \
	Rscript -e "chooseCRANmirror(ind = 1)" \
          -e "if (!requireNamespace('R.rsp'  )) install.packages('R.rsp')" \
          -e "if (!requireNamespace('remotes')) install.packages('remotes')" \
          -e "if (!requireNamespace('lmodweb')) remotes::install_github('ucsf-wynton/lmodweb')"

sbgrid:
	markin build $@.sh
	markin inject $@.md

scl:
	markin build $@.sh
	markin inject $@.md

apptainer:
	markin build $@.sh
	markin inject $@.md

