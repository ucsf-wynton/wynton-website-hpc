#! /usr/bin/env bash

export TMPDIR=${TMPDIR:-/scratch/$USER/mdi}
mkdir -p "${TMPDIR}"

# shellcheck disable=SC2034
MDI_USER=alice
MDI_HOSTNAME=dev3
PS1="[\u@\h \W]\$ "

mdi_adjust_output() {
    local tilde
    tilde='~'
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tilde}|g" 
}


module unload matlab

mdi_code_block --label=module-load-matlab <<EOF
module load matlab
module list
#matlab -nosplash -nodesktop
#>> quit

EOF


module unload matlab

mdi_code_block --label=matlab-not-found <<EOF
matlab
EOF
