#! /usr/bin/env bash

set -e

kubectl create namespace flux

helm upgrade -i flux fluxcd/flux \
--set git.url=git@github.com:craigminihan/flux-get-started \
--namespace flux --set git.readonly=true,sync.state=secret,registry.disableScanning=true --set allowedNamespaces[0]="demo"

helm upgrade -i helm-operator fluxcd/helm-operator \
--set git.ssh.secretName=flux-git-deploy \
--namespace flux --set helm.versions=v3 --set allowNamespace="demo" \
--set configureRepositories.enable=true \
--set configureRepositories.repositories[0].name=avondata \
--set configureRepositories.repositories[0].url=https://charts.avondata.cloud \
--set configureRepositories.repositories[0].username=avon \
--set 'configureRepositories.repositories[0].password=Avon1886!'

# TODO:
# - add: configureRepositories
# - prom?