#! /usr/bin/env bash

# exit when any command fails
set -e

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

## Required software
module load CBI r

## Required R packages
## FIXME: Freeze an R package library with the required packages
# R_LIBS_USER=...

## Session info
Rscript --version
Rscript -e ".libPaths()"

cd "$SCRIPT_PATH/../docs/software"
git pull -X theirs
make build
make deploy
