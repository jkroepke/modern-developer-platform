#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing ArgoCD"

helm upgrade -i argocd oci://ghcr.io/argoproj/argo-helm/argo-cd -n argocd --create-namespace --wait -f "${SCRIPT_DIR}/../../apps/argocd/values.yaml"
