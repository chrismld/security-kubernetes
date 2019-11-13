#!/bin/bash
printf "Create the proper communication rules ...\n"
kubectl -n istio-system get cm istio -o jsonpath="{@.data.mesh}" | grep disablePolicyChecks
kubectl apply -f ../../manifests/enforce-communication.yaml -n customerportal
watch kubectl get rules -n customerportal