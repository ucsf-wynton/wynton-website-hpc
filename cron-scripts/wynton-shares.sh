#! /usr/bin/env bash

## wynton shares
SOFTWARE_HOME=/wynton/home/cbi/shared/software/CBI
PATH="${SOFTWARE_HOME}/wynton-tools-0.2.0/bin:$PATH"
command -v wynton > /dev/null || { >&2 echo "ERROR: Failed to locate the 'wynton' tool"; exit 1; }

## wynton shares queries 'qconf'
PATH="/opt/sge/bin/lx-amd64/:$PATH"
command -v qconf > /dev/null || { >&2 echo "ERROR: Failed to locate the 'qconf' tool"; exit 1; }

WORKDIR=${WORKDIR:-$HOME/repositories/ucsf-wynton/wynton-website-hpc/docs}

date --rfc-3339=seconds

(
    cd "$WORKDIR" || exit 1;
    tmpfile=$(mktemp);

    wynton shares tsv > "$tmpfile";
    grep -q -E "^# Total queue_slots:[[:space:]]*0$$" "$tmpfile" || mv "$tmpfile" "hpc/assets/data/compute_shares.tsv";

    wynton gpushares tsv > "$tmpfile";
    mv "$tmpfile" "hpc/assets/data/gpu_shares.tsv";
    make deploy;
)




