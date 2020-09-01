#! /usr/bin/env bash

MDI_USER='alice'
MDI_HOSTNAME='{{ site.devel.name }}'
PS1="[\u@\h \W]\$ "

mdi_code_block <<EOF
groups
EOF

mdi_code_block <<EOF
source /programs/sbgrid.shrc
EOF
