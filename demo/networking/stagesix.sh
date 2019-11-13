#!/bin/bash
CUSPOD=$(kubectl get pod -l app=customer -o jsonpath='{.items[0].metadata.name}' -n customerportal)
PREFPOD=$(kubectl get pod -l app=preference -o jsonpath='{.items[0].metadata.name}' -n customerportal)
RECPOD=$(kubectl get pod -l app=recommendation -o jsonpath='{.items[0].metadata.name}' -n customerportal)

printf "\n*** customer => preference => recommendation ***\n"

printf "\nRecommendation can't talk to Preference\n"
kubectl exec -it $RECPOD -n customerportal -c recommendation -- curl preference:8080

printf "\n\nRecommendation can't talk to Customer\n"
kubectl exec -it $RECPOD -n customerportal -c recommendation -- curl customer:8080

printf "\n\nCustomer can talk to Preference\n"
kubectl exec -it $CUSPOD -n customerportal -c customer -- curl preference:8080

printf "Preference can talk to Recommendation\n"
kubectl exec -it $PREFPOD -n customerportal -c preference -- curl recommendation:8080
