#!/bin/bash
printf "Start sniffing in the Istio proxy ...\n\n"

printf "\nSend traffic to confirm there's no encryption in transit ...\n"
PREFPOD=$(kubectl get pod -l app=preference -o jsonpath='{.items[0].metadata.name}' -n customerportal)
kubectl exec -it $PREFPOD -n customerportal -c preference -- curl recommendation:8080