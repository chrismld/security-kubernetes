#!/bin/bash
sed -i -e 's/secretparis/secrettwo/g' appsecrets.yaml
kubectl delete pod aks-kv-sample-pod
kubectl apply -f appsecrets.yaml