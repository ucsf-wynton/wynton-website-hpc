#! /usr/bin/env bash

MDI_USER='alice'
MDI_HOSTNAME='{{ site.devel.name }}'
PS1="[\u@\h \W]\$ "

mdi_code_block --label="groups" <<EOF
groups
EOF

mdi_code_block --label="sbgrid" <<EOF
source /programs/sbgrid.shrc
EOF

rm -rf lxc/
