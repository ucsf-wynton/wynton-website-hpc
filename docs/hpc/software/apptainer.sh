#! /usr/bin/env bash
# Usage: markin build apptainer.sh

## ----------------------------------------------------------------------------
## Configuration
## ----------------------------------------------------------------------------
export R_PROFILE=
export R_ENVIRON=
export R_ENVIRON_USER=
export R_PROFILE_USER=

MDI_USER='alice'
MDI_GROUP='boblab'
# shellcheck disable=SC2034
MDI_HOSTNAME='{{ site.devel.name }}'
PS1="[\u@\h \W]\$ "

path=lxc


## ----------------------------------------------------------------------------
## R
## ----------------------------------------------------------------------------
file=rocker_r-base.sif
[[ -f "${path}/${file}" ]] && { >&2 echo "WARNING: Delete ${path}/${file} to re-generated"; }

## Skip if already exists
if [[ ! -f "${path}/${file}" ]]; then
>&2 echo "Building ${path}/${file} ..."
mdi_code_block --label="build" <<EOF
mkdir ${path}
cd ${path}/
apptainer build ${file} docker://rocker/r-base
ls -l ${file}
EOF
>&2 ls -l "${path}/${file}"
fi

1>&2 echo "WARNING: .mdi/apptainer.code-block.label=run needs to be updated manually"
1>&2 echo "WARNING: .mdi/apptainer.code-block.label=command needs to be updated manually"
1>&2 echo "WARNING: .mdi/apptainer.code-block.label=shell needs to be updated manually"


mdi_code_block --label="rscript-sum" --workdir=lxc <<EOF
apptainer exec "${file}" Rscript -e "sum(1:10)"

EOF



## ----------------------------------------------------------------------------
## isoseq3
## ----------------------------------------------------------------------------
## AD HOC/FIXME
cp "${path}/isoseq3.def" .mdi/apptainer.code-block.label=isoseq3-def

file=isoseq3.sif
[[ -f "${path}/${file}" ]] && { >&2 echo "WARNING: Delete ${path}/${file} to re-generated"; }

## Skip if already exists
if [[ ! -f "${path}/${file}" ]]; then
>&2 echo "Building ${path}/${file} ..."
mdi_code_block --label="isoseq3-build" <<EOF
mkdir ${path}
cd ${path}/
apptainer build ${file} isoseq3.def
EOF
>&2 ls -l "${path}/${file}"
fi


mdi_code_block --label="isoseq3-ls" --workdir=lxc <<EOF
ls -l ${file}

EOF


mdi_code_block --label="isoseq3-version" --workdir=lxc <<EOF
./${file} --version

EOF


## ----------------------------------------------------------------------------
## Post-process tweaks
## ----------------------------------------------------------------------------
GROUP=$(id --name --group)
sed -i -E "s/${USER}/${MDI_USER}/g" .mdi/*.code-block.*
sed -i -E "s/${GROUP}/${MDI_GROUP}/g" .mdi/*.code-block.*
