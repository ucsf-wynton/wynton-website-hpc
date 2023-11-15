#! /usr/bin/env bash
# Usage: markin build sbgrid.sh

## Sanity checks
groups | grep -qw "sbgrid" || { 2>&1 echo "ERROR: User is not in the 'sbgrid' group: $USER"; exit 1; }
[[ -f /programs/sbgrid.shrc ]] || { 2>&1 echo "ERROR: No access to /programs/sbgrid.shrc"; exit 1; }

# shellcheck disable=SC2034
MDI_USER="alice"
MDI_GROUP="boblab"
# shellcheck disable=SC2034
MDI_HOSTNAME="{{ site.devel.name }}"
PS1="[\u@\h \W]\$ "

mdi_adjust_output() {
    local group tilde tmpdir
    group=$(id --name --group)
    tilde="~"
    TMPDIR=${TMPDIR:-/scratch/${USER}}
    tmpdir=${TMPDIR/$USER/$MDI_USER}
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tmpdir}|g" | sed "s|\b${USER}\b|${MDI_USER}|g" | sed "s|\b${group}\b|${MDI_GROUP}|g"
}

mdi_code_block --label="groups" <<EOF
groups
EOF

mdi_code_block --label="sbgrid" <<EOF
source /programs/sbgrid.shrc
EOF

mdi_code_block --label="sbgrid-info-relion" <<EOF
sbgrid-info -l relion
EOF

mdi_code_block --label="sbgrid-relion-version" <<EOF
relion --version
EOF
