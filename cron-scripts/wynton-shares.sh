#! /usr/bin/env bash

TARGET=${TARGET:-$HOME/repositories/UCSF-HPC/wynton/docs/assets/data}

module load CBI CBI-testing wynton-tools

tmpfile=$(mktemp)
wynton shares tsv > "$tmpfile"

mv "$tmpfile" "${TARGET}/compute_shares.tsv"
