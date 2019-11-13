#!/bin/bash
kubectl config use-context msignite-security
printf "Creating a secret in Azure Vault ...\n"
az keyvault secret set --vault-name msignitefrcma --name secretparis --value "MS Ignite Paris!!"
sed -i -e 's/secrettwo/secretparis/g' appsecrets.yaml

printf "Re-Creating the pod mount volumes again ...\n"
kubectl delete pod aks-kv-sample-pod
kubectl apply -f appsecrets.yaml

printf "Connecting to the pod ...\n"
sleep 5
kubectl exec -it aks-kv-sample-pod sh