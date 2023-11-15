#! /usr/bin/env bash
#' @usage: markin build python.sh

# shellcheck disable=SC2034
MDI_USER="alice"
MDI_GROUP="boblab"
MDI_HOSTNAME="{{ site.devel.name }}"
PS1="[\u@\h \W]\$ "

module purge

TMPDIR="${TMPDIR:-/scratch/$USER}"
[[ -z "${TMPDIR}" ]] && { 2>&1 echo "ERROR: TMPDIR is empty"; exit 1; }

export TMPDIR="${TMPDIR}/mdi"
[[ -d "${TMPDIR}" ]] && rm -rf "${TMPDIR}"
mkdir -p "${TMPDIR}"

mdi_adjust_output() {
    local group tilde tmpdir
    group=$(id --name --group)
    tilde="~"
    TMPDIR=${TMPDIR:-/scratch/${USER}}
    tmpdir=${TMPDIR/$USER/$MDI_USER}
    ## Our PYTHON examples run in ${TMPDIR} but should look like ${HOME}
    tmpdir="~"
    mdi_replace_pwd | sed "s|${PYTHONUSERBASE}|${HOME}/.local|g" | sed "s|${HOME}|${tilde}|g" | sed "s|${TMPDIR}|${tmpdir}|g" | sed "s|\b${USER}\b|${MDI_USER}|g" | sed "s|\b${group}\b|${MDI_GROUP}|g"
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - -
PATH_ORG=$PATH

# Use an empty pip cache
XDG_CACHE_HOME=$(mktemp -d)
export XDG_CACHE_HOME
echo "XDG_CACHE_HOME=${XDG_CACHE_HOME}"

# Use fresh, empty Python setup
PYTHONUSERBASE=$(mktemp -d)
export PYTHONUSERBASE
echo "PYTHONUSERBASE=${PYTHONUSERBASE}"
export PATH="${PYTHONUSERBASE}/bin:${PATH_ORG}"

mdi_code_block --label=pip-install-ex <<EOF
python3 -m pip install --user pandas
EOF

# Use an empty pip cache
XDG_CACHE_HOME=$(mktemp -d)
export XDG_CACHE_HOME
echo "XDG_CACHE_HOME=${XDG_CACHE_HOME}"

# Use fresh, empty Python setup
PYTHONUSERBASE=$(mktemp -d)
export PYTHONUSERBASE
echo "PYTHONUSERBASE=${PYTHONUSERBASE}"
export PATH="${PYTHONUSERBASE}/bin:${PATH_ORG}"

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

# shellcheck disable=1091
. my_project/bin/activate
mdi_code_block --label=virtualenv-which-python3 --workdir=my_project <<EOF
which python3
EOF

# shellcheck disable=1091
. my_project/bin/activate
mdi_code_block --label=virtualenv-which-python --workdir=my_project <<EOF
which python
python --version
EOF

# shellcheck disable=1091
. my_project/bin/activate
mdi_code_block --label=virtualenv-pip-list --workdir=my_project <<EOF
python3 -m pip list

EOF

# shellcheck disable=1091
. my_project/bin/activate
mdi_code_block --label=virtualenv-pip-install-ex <<EOF
python3 -m pip install pandas
EOF

# shellcheck disable=1091
. my_project/bin/activate
mdi_code_block --label=virtualenv-pip-list-2 --workdir=my_project <<EOF
python3 -m pip list

EOF

# shellcheck disable=1091
. my_project/bin/activate
deactivate
mdi_code_block --label=virtualenv-activate-2 <<EOF
cd my_project 
. bin/activate   ## ACTIVATE
pip3 show pandas

EOF

# shellcheck disable=1091
. my_project/bin/activate
mdi_code_block --label=virtualenv-deactivate <<EOF
deactivate

EOF

# shellcheck disable=1091
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

## Python 2 only supports pip (< 21)
python2 -m pip install --user --upgrade "pip==20.3" &> /dev/null
mdi_code_block --label=pip2-upgrade <<EOF
python2 -m pip install --user --upgrade "pip<21"
EOF

mdi_code_block --label=python-version <<EOF
python3 --version
EOF

module purge
