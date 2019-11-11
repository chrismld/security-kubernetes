#!/bin/bash
printf "customer => preference => recommendation\n"
printf "\nRecommendation can talk to Customer\n"
RECPOD=$(kubectl get pod -l app=recommendation -o jsonpath='{.items[0].metadata.name}' -n customerportal)
kubectl exec -it $RECPOD -n customerportal -c recommendation -- curl customer:8080

printf "\nRecommendation can talk to Preference\n"
kubectl exec -it $RECPOD -n customerportal -c recommendation -- curl preference:8080
