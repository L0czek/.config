#!/bin/bash

set -eu

PROG="wvkbd-deskintl"

# SIGUSR1 = hide, SIGUSR2 = show, SIGRTMIN = toggle
export PATH=$PATH:/home/loczek/.local/bin
SIGNAL="SIGRTMIN"
if [ "${#}" -gt 0 ]; then
    SIGNAL="${1}"
fi

if ! pgrep "${PROG}" > /dev/null; then
    "${PROG}" \
        --hidden \
        --alpha 204 \
        &
    # "${PROG}" \
    #     --hidden \
    #     --alpha 80 \
    #     --non-exclusive \
    #     &
fi

pkill --signal "${SIGNAL}" "${PROG}"
