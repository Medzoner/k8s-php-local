#!/usr/bin/env bash

HELM_CMD="microk8s.helm"
HELM_CMD_OPTION="upgrade"
#HELM_CMD_OPTION="install --name"

NODE_IP=$( /sbin/ifconfig cni0| grep 'inet ' | cut -d: -f2 | awk '{ print $2}')


$(echo ${HELM_CMD}) $(echo ${HELM_CMD_OPTION}) global --set env=local -f ./charts/global/releases/local/values.yaml ./charts/global
$(echo ${HELM_CMD}) $(echo ${HELM_CMD_OPTION}) php    --set nodeIp=${NODE_IP} --set env=local -f ./charts/php/releases/local/values.yaml ./charts/php
