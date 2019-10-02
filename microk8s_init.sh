#!/usr/bin/env bash
sudo snap install microk8s --classic
sudo usermod -a -G microk8s $(echo $UID)

# restart user session
microk8s.enable dns
