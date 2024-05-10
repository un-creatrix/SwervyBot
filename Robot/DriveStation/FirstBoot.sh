#!/bin/bash
echo "First Boot Install and Setup"
sudo su
echo "Checking for system updates"
apt update
apt upgrade -y
echo " - Removing Old Docker Images"
apt remove docker.io
apt remove docker-compose
apt remove docker-doc
apt remove podman-docker
echo " - Updating CA Certificates"
apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
echo " -+ Installing Docker"
curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo " == Completed Docker Install"

exit #exits su