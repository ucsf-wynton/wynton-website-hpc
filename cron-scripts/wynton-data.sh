#! /usr/bin/env bash

## WORKAROUND: 'module' is not available when running cron jobs
SOFTWARE_HOME=/wynton/home/cbi/shared/software/CBI
PATH=/opt/sge/bin/lx-amd64/:$PATH
PATH=${SOFTWARE_HOME}/_rocky8/R-4.3.2-gcc10/bin:$PATH
PATH=${SOFTWARE_HOME}/_rocky8/sqlite-3.43.2/bin:$PATH

## Required R packages
## FIXME: Freeze an R package library with the required packages
R_LIBS_USER=$(Rscript --vanilla -e "cat(Sys.getenv('R_LIBS_USER'))")
export R_LIBS_USER

WORKDIR=${WORKDIR:-$HOME/repositories/ucsf-wynton/wynton-website-hpc/docs}

date --rfc-3339=seconds

(
    cd "$WORKDIR" || exit 1;
    make _data;
    make deploy;
)
