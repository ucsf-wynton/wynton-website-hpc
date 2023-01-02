#! /usr/bin/env bash

SOFTWARE_HOME=/wynton/home/cbi/shared/software/CBI
PATH=/opt/sge/bin/lx-amd64/:$PATH
PATH=${SOFTWARE_HOME}/R-4.2.1-gcc10/bin:$PATH
export R_LIBS_USER=${HOME}/R/x86_64-pc-linux-gnu-library/4.2-CBI-gcc10

WORKDIR=${WORKDIR:-$HOME/repositories/ucsf-wynton/wynton-website-hpc/docs}

date --rfc-3339=seconds

(
    cd "$WORKDIR" || exit 1;
    make _data;
    make deploy;
)
