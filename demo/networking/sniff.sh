#!/bin/bash
PREFPOD=$(kubectl get pod -l app=preference -o jsonpath='{.items[0].metadata.name}' -n customerportal)
kubectl exec -it $PREFPOD -n customerportal -c istio-proxy -- sudo tcpdump -A -s 0 'tcp port 8080 and (((ip[2:2]-((ip[0]&0xf)<<2))-((tcp[12]&0xf0)>>2))!=0)'