#!/usr/bin/env bash
set -x
screen -ls
screen -S "$1" -p 0 -X stuff 'sudo mkdir -p /mnt/docker-data && sudo mount -t ext4 /dev/vdb /mnt/docker-data'
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff "sudo mkdir -p '$2' && sudo mount -t ext4 /dev/vdc '$2'"
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff "sudo chown -R ubuntu '$2'"
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff 'sudo apt-get -y -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && sudo apt-get -y install net-tools openssh-server apt-transport-https ca-certificates curl gnupg-agent software-properties-common &&  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&  sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu focal stable" &&  sudo apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false -y update &&  sudo apt-get -y install docker-ce docker-ce-cli containerd.io &&  sudo usermod -aG docker ubuntu && sudo sh -c "rsync -aP /var/lib/docker /mnt/docker-data" && sudo sh -c "printf ewogICJzdG9yYWdlLWRyaXZlciI6ICJ2ZnMiLAogICJkYXRhLXJvb3QiOiAiL21udC9kb2NrZXItZGF0YSIKfQoK | base64 -d > /etc/docker/daemon.json" &&  sudo service docker restart &&  ifconfig | grep --color=no "192.168" && sudo sh -c "echo \"PermitEmptyPasswords yes\" >> /etc/ssh/sshd_config && sudo service ssh restart"'
screen -S "$1" -p 0 -X stuff $(printf '\015')
