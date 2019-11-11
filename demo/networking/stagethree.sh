#!/bin/bash
printf "Create policies to encrypt in-transit ...\n"
kubectl apply -f ../manifests/enable-tls.yaml -n customerportal

printf "\nSend some traffic from a POD ...\n"
PREFPOD=$(kubectl get pod -l app=preference -o jsonpath='{.items[0].metadata.name}' -n customerportal)
kubectl exec -it $PREFPOD -n customerportal -c preference -- curl recommendation:8080

printf "\nSend some traffic from the external endpoint ...\n"
INGRESSIP=($(kubectl get service istio-ingressgateway --namespace istio-system -o jsonpath='{.status.loadBalancer.ingress[0].ip}'))
curl -s http://$INGRESSIP/

printf "\nCheck that mTLS is enabled ...\n"
istioctl authn tls-check $PREFPOD preference.customerportal.svc.cluster.local -n customerportal