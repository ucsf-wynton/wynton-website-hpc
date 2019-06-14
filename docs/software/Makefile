PAGE=software-repositories

all: $(PAGE).md

force:
	touch $(PAGE).md.rsp
	make all

$(PAGE).md: $(PAGE).md.rsp
	Rscript -e R.rsp::rfile $< --postprocess=FALSE

deploy: $(PAGE).md
	git commit $< -m "SOFTWARE: Rebuilt set of available modules" &> /dev/null; true
	git push &> /dev/null; true


