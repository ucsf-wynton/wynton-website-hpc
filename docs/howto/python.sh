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
    mdi_replace_pwd | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tilde}|g" 
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

mdi_code_block --label=pip-install-htseq <<EOF
python3 -m pip install --user HTSeq
EOF


mdi_code_block --label=pip-install-virtualenv <<EOF
python3 -m pip install --user virtualenv
which virtualenv
virtualenv --version
EOF

mdi_code_block --label=virtualenv-init <<EOF
virtualenv -p python3 my_project
EOF

mdi_code_block --label=virtualenv-activate <<EOF
cd my_project 
. bin/activate   ## IMPORTANT! Note period in front

EOF

. my_project/bin/activate
mdi_code_block --label=virtualenv-which-python3 --workdir=my_project <<EOF
which python3
EOF

. my_project/bin/activate
mdi_code_block --label=virtualenv-which-python --workdir=my_project <<EOF
which python
python --version
EOF

. my_project/bin/activate
mdi_code_block --label=virtualenv-pip-list --workdir=my_project <<EOF
python3 -m pip list

EOF

. my_project/bin/activate
mdi_code_block --label=virtualenv-pip-install-htseq <<EOF
python3 -m pip install HTSeq
EOF

. my_project/bin/activate
mdi_code_block --label=virtualenv-pip-list-2 --workdir=my_project <<EOF
python3 -m pip list

EOF

. my_project/bin/activate
deactivate
mdi_code_block --label=virtualenv-activate-2 <<EOF
cd my_project 
. bin/activate   ## ACTIVATE
pip3 show HTSeq

EOF

. my_project/bin/activate
mdi_code_block --label=virtualenv-deactivate <<EOF
deactivate

EOF

. my_project/bin/activate
deactivate
mdi_code_block --label=virtualenv-deactivate-which-python3 <<EOF
which python3
EOF


mdi_code_block --label=pip-upgrade <<EOF
python3 -m pip install --user --upgrade pip
EOF

mdi_code_block --label=pip-version-2 <<EOF
python3 -m pip --version
EOF
