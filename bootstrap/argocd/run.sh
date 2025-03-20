#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing ArgoCD"

helm upgrade -i argocd oci://ghcr.io/argoproj/argo-helm/argo-cd --version 7.8.13 -n argocd --create-namespace --wait -f "${SCRIPT_DIR}/../../apps/argocd/values.yaml"
kubectl apply -f "${SCRIPT_DIR}/bootstrap.yaml"
