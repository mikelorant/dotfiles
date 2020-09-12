#!/usr/bin/env bash

# export KUBECTL_EXTERNAL_DIFF="~/.kube/kube_external_diff.sh"

DIFF_ARGS=(
  "--minimal"
  "--width=120"
  "--color=always"
  "--unified=1"
  "--new-file"
  "-I" "^  generation:"
  "-I" "^    deprecated.daemonset.template.generation:"
)

/usr/local/bin/diff "${DIFF_ARGS[@]}" "$@" | awk '!/^diff/ {if ($1 ~ /(---|\+\+\+)/) {print $1, $2} else {print $0}}'
