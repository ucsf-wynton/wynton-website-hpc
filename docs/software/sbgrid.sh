#! /usr/bin/env bash

MDI_USER='alice'
MDI_HOSTNAME='{{ site.devel.name }}'
PS1="[\u@\h \W]\$ "

## Sanity checks
groups | grep -qw "sbgrid" || { 2>&1 echo "ERROR: User is not in the 'sbgrid' group: $USER"; exit 1; }
[[ -f /programs/sbgrid.shrc ]] || { 2>&1 echo "ERROR: No access to /programs/sbgrid.shrc"; exit 1; }

mdi_code_block --label="groups" <<EOF
groups
EOF

mdi_code_block --label="sbgrid" <<EOF
source /programs/sbgrid.shrc
EOF

rm -rf lxc/
