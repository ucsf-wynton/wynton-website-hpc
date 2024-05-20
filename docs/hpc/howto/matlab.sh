#! /usr/bin/env bash
#' @usage: markin build matlab.sh

export TMPDIR=${TMPDIR:-/scratch/$USER/mdi}
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
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tmpdir}|g" | sed "s|\b${USER}\b|${MDI_USER}|g" | sed "s|\b${group}\b|${MDI_GROUP}|g"
}


module unload matlab

## FIXME: https://github.com/HenrikBengtsson/mdi/issues/9
#mdi_code_block --label=module-load-matlab <<EOF
#module load matlab
#matlab -nosplash -nodesktop # mdi-hide <<< "$(printf '1+2${ENTER}quit')"; printf "1+2\nquit\n"
#
#EOF

1>&2 echo "WARNING: .mdi/matlab.code-block.label=module-load-matlab needs to be updated manually"                                                  

module unload matlab

