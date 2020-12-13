#!/usr/bin/env bash
screen -S "$1" -p 0 -X stuff 'sudo mkfs.ext4 /dev/vdb -L docker-data'
screen -S "$1" -p 0 -X stuff $(printf '\015')
