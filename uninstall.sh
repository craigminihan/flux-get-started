#! /usr/bin/env bash

set -e

helm uninstall -n demo nginx
helm uninstall -n demo mw

helm uninstall -n flux helm-operator
helm uninstall -n flux flux
kubectl delete namespace flux