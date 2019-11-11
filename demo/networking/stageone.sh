#!/bin/bash
kubectl apply -f ../manifests/customerportal.yaml -n customerportal
kubectl apply -f ../manifests/customerportal-gateway.yaml -n customerportal

printf "\nIs Customer Portal running? ...\n"
kubectl exec -it $(kubectl get pod -l app=customer -o jsonpath='{.items[0].metadata.name}' -n customerportal) -c customer -n customerportal -- curl customer:8080

printf "\nHere's the URL for Customer Portal\n"
INGRESSIP=($(kubectl get service istio-ingressgateway --namespace istio-system -o jsonpath='{.status.loadBalancer.ingress[0].ip}'))
printf "http://$INGRESSIP/customer\n"

printf "\nDoes Customer Portal works from outside as well:\n"
curl -s http://$INGRESSIP/customer