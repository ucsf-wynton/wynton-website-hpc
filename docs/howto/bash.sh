#! /usr/bin/env bash
#' @usage: markin build bash.sh

export TMPDIR=${TMPDIR:-/scratch/$USER/mdi}
mkdir -p "${TMPDIR}"

# shellcheck disable=SC2034
MDI_USER=alice
# shellcheck disable=SC2034
MDI_HOSTNAME="{{ site.devel.name }}"
PS1="[\u@\h \W]\$ "

mdi_adjust_output() {
    local tilde
    tilde='~'
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tilde}|g" 
}


mdi_code_block --label=bash-SHELL <<EOF
echo "\$SHELL"
EOF


mdi_code_block --label=bash-bashrc-fresh <<EOF
cat /etc/skel/.bashrc
EOF

