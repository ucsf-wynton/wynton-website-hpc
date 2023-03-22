#! /usr/bin/env bash

## WORKAROUND: 'module' is not available when running cron jobs
SOFTWARE_HOME=/wynton/home/cbi/shared/software/CBI
PATH=/opt/sge/bin/lx-amd64/:$PATH
PATH=${SOFTWARE_HOME}/R-4.2.2-gcc10/bin:$PATH
PATH=${SOFTWARE_HOME}/sqlite-3.41.1/bin:$PATH

export R_LIBS_USER=${HOME}/R/x86_64-pc-linux-gnu-library/4.2-CBI-gcc10

WORKDIR=${WORKDIR:-$HOME/repositories/ucsf-wynton/wynton-website-hpc/docs}

date --rfc-3339=seconds

(
    cd "$WORKDIR" || exit 1;
    make _data;
    make deploy;
)
