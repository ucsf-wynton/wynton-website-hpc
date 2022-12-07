#! /usr/bin/env bash

## wynton shares
PATH="/wynton/home/cbi/shared/software/CBI-testing/wynton-tools/bin:$PATH"

## wynton shares queries 'qconf'
PATH="/opt/sge/bin/lx-amd64/:$PATH"

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




