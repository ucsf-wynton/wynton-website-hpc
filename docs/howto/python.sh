#! /usr/bin/env bash
#' @usage: mdi build python.sh

# shellcheck disable=SC2034
MDI_USER=alice
MDI_HOSTNAME=dev3
MDI_PWD='~'

# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Use an empty user Python module folder
export PYTHONUSERBASE=$(mktemp -d)
echo "PYTHONUSERBASE=${PYTHONUSERBASE}"

echo "Code block #1"
mdi_code_block <<EOF
python2 -m pip install --user HTSeq
EOF

ls -alR "${PYTHONUSERBASE}"
