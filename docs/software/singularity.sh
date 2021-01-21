#! /usr/bin/env bash
# Usage: mdi build singularity.sh

MDI_USER='alice'
MDI_GROUP='boblab'
MDI_HOSTNAME='{{ site.devel.name }}'
PS1="[\u@\h \W]\$ "

[[ -d "lxc" ]] && { 1>&2 echo "WARNING: Delete lxc/ to re-generated"; }

## Skip if already exists
if [[ ! -d "lxc" ]]; then
mdi_code_block --label="build" <<EOF
mkdir lxc
cd lxc/
singularity build rocker_r-base.img docker://rocker/r-base
ls -l rocker_r-base.img
EOF
fi

1>&2 echo "WARNING: .mdi/singularity.sh.code-block.label=run needs to be updated manually"

mdi_code_block --label="rscript-sum" --workdir=lxc <<EOF
singularity exec rocker_r-base.img Rscript -e "sum(1:10)"

EOF


## Post-process tweaks
GROUP=$(id --name --group)
sed -i -E "s/${USER}/${MDI_USER}/g" .mdi/*.sh.code-block.*
sed -i -E "s/${GROUP}/${MDI_GROUP}/g" .mdi/*.sh.code-block.*
