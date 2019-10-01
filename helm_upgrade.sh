#!/usr/bin/env bash

HELM_CMD="microk8s.helm"
HELM_CMD_OPTION="upgrade"
HELM_CMD_OPTION="install --name"

$(echo ${HELM_CMD}) $(echo ${HELM_CMD_OPTION}) global --set env=local -f ./charts/global/releases/local/values.yaml ./charts/global
$(echo ${HELM_CMD}) $(echo ${HELM_CMD_OPTION}) php    --set env=local -f ./charts/php/releases/local/values.yaml ./charts/php
