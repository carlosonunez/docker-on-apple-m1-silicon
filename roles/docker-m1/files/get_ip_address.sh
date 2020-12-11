#!/usr/bin/env bash
sudo sh -c 'grep "192.168" {{ stage_dir }}/screenlog.0 | sed "s/.*\(.*\)netmask/\1/" | tr -d " "'

