#! /usr/bin/env bash

# shellcheck disable=SC2034
MDI_USER="alice"
MDI_GROUP="boblab"
MDI_HOSTNAME="{{ site.devel.name }}"
PS1="[\u@\h \W]\$ "

mdi_code_block --label="list" <<EOF
scl --list
EOF

mdi_code_block --label="list-one" <<EOF
scl --list rh-ruby25
EOF

mdi_code_block --label="ruby-ex-1" <<EOF
scl enable rh-ruby25 "irb --version"
EOF

1>&2 echo "WARNING: .mdi/scl.sh.code-block.label=ruby-ex-2 needs to be updated manually"

