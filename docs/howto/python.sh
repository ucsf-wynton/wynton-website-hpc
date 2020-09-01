#! /usr/bin/env bash
#' @usage: mdi build python.sh

# shellcheck disable=SC2034
MDI_USER=alice
MDI_HOSTNAME=dev3
PS1="[\u@\h \W]\$ "

# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Use an empty user Python module folder
export PYTHONUSERBASE=$(mktemp -d)

echo "Code block #1"
mdi_code_block --label=pip-install <<EOF
python2 -m pip install --user HTSeq
EOF
