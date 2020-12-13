#!/usr/bin/env bash
screen -S "$1" -p 0 -X stuff 'sudo mkfs.ext4 /dev/vdb -L docker-data'
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff 'sudo mkfs.ext4 /dev/vdc -L docker-userdata'
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff 'sudo mkdir -p /mnt/docker-data && sudo mount -t ext4 /dev/vdb /mnt/docker-data'
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff "sudo mkdir -p '$2' && sudo mount -t ext4 /dev/vdc '$2'"
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff "sudo chown -R ubuntu '$2'"
screen -S "$1" -p 0 -X stuff $(printf '\015')
screen -S "$1" -p 0 -X stuff "echo 'data provision finished'"
screen -S "$1" -p 0 -X stuff $(printf '\015')

