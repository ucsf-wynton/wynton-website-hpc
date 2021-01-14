#! /usr/bin/env bash

# shellcheck disable=SC2034
MDI_USER="alice"
MDI_GROUP="boblab"
MDI_HOSTNAME="{{ site.devel.name }}"
PS1="[\u@\h \W]\$ "

mdi_adjust_output() {
    local tilde
    tilde='~'
    GROUP=$(id --name --group)
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tilde}|g" | sed "s|\b${USER}\b|${MDI_USER}|g" | sed "s|\b${GROUP}\b|${MDI_GROUP}|g"
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
