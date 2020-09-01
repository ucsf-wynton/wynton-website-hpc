#! /usr/bin/env bash

MDI_USER='alice'
MDI_HOSTNAME='{{ site.devel.name }}'
PS1="[\u@\h \W]\$ "

mdi_code_block --label="build" <<EOF
mkdir lxc
cd lxc/
singularity build rocker_r-base.img docker://rocker/r-base
ls -l rocker_r-base.img
EOF


mdi_code_block --label="rscript-sum" --workdir=lxc <<EOF
singularity exec rocker_r-base.img Rscript -e "sum(1:10)"

EOF
