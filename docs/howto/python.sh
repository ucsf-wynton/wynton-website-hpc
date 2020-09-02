#! /usr/bin/env bash
#' @usage: mdi build python.sh

export TMPDIR=${TMPDIR:-/scratch/$USER/mdi}
mkdir -p "${TMPDIR}"

# shellcheck disable=SC2034
MDI_USER=alice
MDI_HOSTNAME=dev3
PS1="[\u@\h \W]\$ "

mdi_adjust_output() {
    local tilde
    tilde='~'
    mdi_replace_pwd | sed "s|${TMPDIR}|${tilde}|g"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Use an empty user Python module folder
if true; then
    export PYTHONUSERBASE=$(mktemp -d)
    export PYTHONUSERBASE="${TMPDIR}/.local"
    echo "PYTHONUSERBASE=${PYTHONUSERBASE}"
    export PATH="${PYTHONUSERBASE}/bin:${PATH}"
fi

mdi_code_block --label=pip-install <<EOF
python3 -m pip install --user HTSeq
EOF


mdi_code_block --label=pip-install-virtualenv <<EOF
python3 -m pip install --user virtualenv
which virtualenv
virtualenv --version
EOF
