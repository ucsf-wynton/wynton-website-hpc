#! /usr/bin/env bash

# exit when any command fails
set -e

echo "Wynton HPC website: Update Software Repository page ..."

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

## Required software
SOFTWARE_HOME=/wynton/home/cbi/shared/software/CBI
PATH=${SOFTWARE_HOME}/R-4.2.1-gcc10/bin:$PATH

## Required R packages
## FIXME: Freeze an R package library with the required packages
export R_LIBS_USER=/wynton/home/cbi/hb/R/x86_64-pc-linux-gnu-library/4.2-CBI-gcc10

## Session info
Rscript --version
Rscript -e ".libPaths()"

cd "$SCRIPT_PATH/../docs/software"
git pull -X theirs
make clean
make build
make deploy

echo "Wynton HPC website: Update Software Repository page ... done"
