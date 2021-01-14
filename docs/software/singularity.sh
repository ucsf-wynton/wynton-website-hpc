#! /usr/bin/env bash

# shellcheck disable=SC2034
MDI_USER="alice"
MDI_GROUP="boblab"
MDI_HOSTNAME="{{ site.devel.name }}"
PS1="[\u@\h \W]\$ "

mdi_adjust_output() {
    local group tilde tmpdir
    group=$(id --name --group)
    tilde="~"
    TMPDIR=${TMPDIR:-/scratch/${USER}}
    tmpdir=$(echo "${TMPDIR}" | sed "s|${USER}|${MDI_USER}|")
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tmpdir}|g" | sed "s|\b${USER}\b|${MDI_USER}|g" | sed "s|\b${group}\b|${MDI_GROUP}|g"
}

mdi_code_block --label="build" <<EOF
mkdir lxc
cd lxc/
singularity build rocker_r-base.img docker://rocker/r-base
ls -l rocker_r-base.img
EOF


export R_PROFILE_USER=""
export R_ENVIRON_USER=""
mdi_code_block --label="rscript-sum" --workdir=lxc <<EOF
singularity exec rocker_r-base.img Rscript -e "sum(1:10)"

EOF
