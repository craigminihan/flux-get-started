#! /usr/bin/env bash

helm upgrade -i flux fluxcd/flux \
--set git.url=git@github.com:craigminihan/flux-get-started \
--namespace flux --set git.readonly=true --set allowedNamespaces[0]="demo"

helm upgrade -i helm-operator fluxcd/helm-operator \
--set git.ssh.secretName=flux-git-deploy \
--namespace flux --set helm.versions=v3
