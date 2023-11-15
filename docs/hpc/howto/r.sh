#! /usr/bin/env bash
#' @usage: markin build r.sh

TMPDIR="${TMPDIR:-/scratch/$USER}"
[[ -z "${TMPDIR}" ]] && { 2>&1 echo "ERROR: TMPDIR is empty"; exit 1; }

export TMPDIR="${TMPDIR}/mdi"
[[ -d "${TMPDIR}" ]] && rm -rf "${TMPDIR}"
mkdir -p "${TMPDIR}"

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
    ## Our PYTHON examples run in ${TMPDIR} but should look like ${HOME}
    tmpdir="~"

    mdi_replace_pwd | \
	sed "s|${HOME}|${tilde}|g" | \
	sed "s|${TMPDIR}|${tmpdir}|g" | \
	sed "s|\b${USER}\b|${MDI_USER}|g" | \
	sed "s|\b${group}\b|${MDI_GROUP}|g" | \
        sed 's/\becho .* | R --vanilla/R/g'
}


## When piping to R, R requires either --vanilla, --save, or --no-save
## but we don't want to show that in our examples
R() {
    command R --vanilla
}

module purge
module load CBI r

# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Use an empty user Python module folder
if true; then
    R_LIBS_USER=$(mktemp -d)
    R_LIBS_USER="${TMPDIR}/.local"
    export R_LIBS_USER
    echo "R_LIBS_USER=${R_LIBS_USER}"
fi

mdi_code_block --label=r-version <<EOF
R --version

EOF

mdi_code_block --label=r-one-plus-two <<EOF
R # mdi-hide < <(echo "1+2"; echo "quit()"); echo "Save workspace image? [y/n/c]: n"

EOF


mdi_code_block --label=r-openmpi <<EOF
module load mpi/openmpi-x86_64
module list
EOF
module purge
module load CBI r

#mdi_code_block --label=r-gdal <<EOF
#module load CBI gdal
#module list
#EOF
#module purge
#module load CBI r

#mdi_code_block --label=r-hdf5 <<EOF
#module load CBI hdf5
#module list
#EOF
#module purge
#module load CBI r

mdi_code_block --label=r-scl-gcc-toolset <<EOF
module load CBI scl-gcc-toolset/12
gcc --version
EOF
module purge
module load CBI r
