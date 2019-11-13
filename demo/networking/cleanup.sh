#!/bin/bash
kubectl delete -f ../../manifests/enable-tls.yaml -n customerportal
kubectl delete -f ../../manifests/enforce-communication.yaml -n customerportal
kubectl delete namespace customerportal
