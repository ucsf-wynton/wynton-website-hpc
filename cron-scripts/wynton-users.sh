#! /usr/bin/env bash

SOFTWARE_HOME=/wynton/home/cbi/shared/software/CBI
PATH=/opt/sge/bin/lx-amd64/:$PATH
PATH=${SOFTWARE_HOME}/R-3.6.1/bin:$PATH
R_LIBS_USER=${HOME}/R/x86_64-pc-linux-gnu-library/3.6-CBI 

WORKDIR=${WORKDIR:-$HOME/repositories/UCSF-HPC/wynton/docs}

date --rfc-3339=seconds

(
    cd "$WORKDIR"; 
    make _data/users.yml;
    make deploy;
)
