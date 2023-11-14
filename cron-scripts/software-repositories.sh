#! /usr/bin/env bash

# exit when any command fails
set -e

echo "Wynton HPC website: Update Software Repository page ..."

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

## Setup shell, including Lmod
#shellcheck disable=SC1091
[[ -f /etc/bashrc ]] && . /etc/bashrc

## Assert module is defined
type module

## Required software
SOFTWARE_HOME=/wynton/home/cbi/shared/software/CBI
PATH=${SOFTWARE_HOME}/_rocky8/R-4.3.2-gcc10/bin:$PATH

## Required R packages
## FIXME: Freeze an R package library with the required packages
R_LIBS_USER=$(Rscript --vanilla -e "cat(Sys.getenv('R_LIBS_USER'))")
export R_LIBS_USER

## Session info
Rscript --version
Rscript -e ".libPaths()"

cd "$SCRIPT_PATH/../docs/hpc/software"
git pull -X theirs
make clean
make build
make deploy

echo "Wynton HPC website: Update Software Repository page ... done"
