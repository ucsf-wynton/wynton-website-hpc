#! /usr/bin/env bash

export TMPDIR=${TMPDIR:-/scratch/$USER/mdi}
mkdir -p "${TMPDIR}"

# shellcheck disable=SC2034
MDI_USER=alice
MDI_HOSTNAME={{ site.devel.name }}
PS1="[\u@\h \W]\$ "

mdi_adjust_output() {
    local tilde
    tilde='~'
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tilde}|g" 
}


module unload matlab
## FIXME: https://github.com/HenrikBengtsson/mdi/issues/9
#mdi_code_block --label=module-load-matlab <<EOF
#module load matlab
#matlab -nosplash -nodesktop # mdi-hide <<< "$(printf '1+2${ENTER}quit')"; printf "1+2\nquit\n"
#
#EOF


module unload matlab
## FIXME: https://github.com/HenrikBengtsson/mdi/issues/8
#mdi_code_block --label=matlab-not-found <<EOF
#matlab
#EOF
