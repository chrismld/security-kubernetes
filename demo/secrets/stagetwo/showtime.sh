#!/bin/bash
az keyvault secret set --vault-name msignitefrcma --name secretparis --value "MS Ignite Paris!!"
sed -i -e 's/secrettwo/secretparis/g' appsecrets.yaml
kubectl delete pod aks-kv-sample-pod
kubectl apply -f appsecrets.yaml
sleep 3
kubectl exec -it aks-kv-sample-pod sh