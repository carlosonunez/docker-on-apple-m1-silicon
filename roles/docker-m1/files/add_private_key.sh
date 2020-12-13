#!/usr/bin/env bash
screen -S "$1" -p 0 -X stuff "mkdir -p ~/.ssh && rm -f ~/.ssh/authorized_keys && echo '$(cat $2)' >> ~/.ssh/authorized_keys"
screen -S "$1" -p 0 -X stuff $(printf '\015')
