#!/bin/bash

CLUSTER-NAME=$(terraform output -raw cluster_name)
AWS_REGION=$(terraform output -raw region)

#seting-up environment
aws eks --region "$AWS_REGION" update-kubeconfig --name "$CLUSTER_NAME"

#metric-server
helm repo add metrics-server \
https://kubernetes-sigs.github.io/metrics-server/
helm upgrade --install metrics-server metrics-server/metrics-server

#cluster-autoscaler
helm repo add autoscaler https://kubernetes.github.io/autoscaler
helm install my-release autoscaler/cluster-autoscaler \
--set 'autoDiscovery.clusterName'=$CLUSTER_NAME
