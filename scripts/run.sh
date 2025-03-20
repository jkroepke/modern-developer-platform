#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

KUBECTL_BIN="${KUBECTL:-kubectl}"
HELM_BIN="${HELM:-helm}"

for cmd in "${KUBECTL_BIN}" "${HELM_BIN}"; do
  if ! command -v "$cmd" &> /dev/null; then
    fail "$cmd is not installed"
    exit 1
  fi
done

echo "Checking if Kubernetes cluster is reachable"

if ! kubectl cluster-info &> /dev/null; then
  echo "Kubernetes cluster is not reachable"
  exit 1
fi

"${SCRIPT_DIR}/../bootstrap/argocd/run.sh"
