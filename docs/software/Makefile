SHELL=bash

PAGE=software-repositories

all: $(PAGE).md

build:
	touch $(PAGE).md.rsp
	make all
	git diff

$(PAGE).md: $(PAGE).md.rsp
	module load CBI r && \
	Rscript -e R.rsp::rfile $< --postprocess=FALSE

deploy: $(PAGE).md
	git commit $< -m "SOFTWARE: Rebuilt set of available modules" &> /dev/null; true
	git push &> /dev/null; true

sbgrid:
	markin build $@.sh
	markin inject $@.md

scl:
	markin build $@.sh
	markin inject $@.md

singularity:
	markin build $@.sh
	markin inject $@.md


