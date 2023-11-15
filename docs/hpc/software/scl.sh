#! /usr/bin/env bash
# Usage: markin build scl.sh

# shellcheck disable=SC2034
MDI_USER="alice"
MDI_GROUP="boblab"
MDI_HOSTNAME="{{ site.devel.name }}"
PS1="[\u@\h \W]\$ "

module purge

mdi_code_block --label="list" <<EOF
scl list-collections
EOF

mdi_code_block --label="list-one" <<EOF
scl list-packages gcc-toolset-11
EOF

mdi_code_block --label="gcc-toolset-version" <<EOF
scl enable gcc-toolset-12 "gcc --version"
EOF

mdi_code_block --label="module-load-scl-gcc-toolset" <<EOF
module load CBI scl-gcc-toolset/12
gcc --version
EOF

module load CBI scl-gcc-toolset/12
mdi_code_block --label="module-unload-scl-gcc-toolset" <<EOF
module unload CBI scl-gcc-toolset/12
gcc --version
EOF

1>&2 echo "WARNING: .mdi/scl.code-block.label=gcc-toolset-version-2 needs to be updated manually"

