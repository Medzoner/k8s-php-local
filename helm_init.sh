#!/usr/bin/env bash

microk8s.enable helm

microk8s.kubectl create serviceaccount --namespace kube-system tiller
microk8s.kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

#microk8s.kubectl config view --raw > config.yml
#export KUBECONFIG=$(pwd)/config.yml
helm init --upgrade --service-account tiller --override spec.selector.matchLabels.'name'='tiller',spec.selector.matchLabels.'app'='helm' --output yaml | sed 's@apiVersion: extensions/v1beta1@apiVersion: apps/v1@' | kubectl apply -f -
microk8s.kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
