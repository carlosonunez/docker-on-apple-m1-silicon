#!/usr/bin/env bash
# This script leverages docker-m1-hack (https://github.com/carlosonunez/docker-m1)
# to run Docker Compose services on a remote host while transparently handling
# data synchronization.
# This is a temporary solution while I await access to Docker's beta of Docker
# Desktop on ARM.
if $(sysctl -n machdep.cpu | grep -qi "VirtualApple") || \
  $(sysctl -n machdep.cpu | grep -qi "apple processor")
then
  if test "$1" == "run"
  then
    >&2 echo "WARNING: You're running this on Apple Silicon. Here be dragons."
    docker_host_ip=$(docker context ls | grep docker-arm64 | awk '{print $3}' | cut -f2 -d '@')
    if ! ssh ubuntu@$docker_host_ip test -d $PWD
    then
      ssh ubuntu@$docker_host_ip mkdir -p $PWD
    fi
    rsync --exclude=.git -avh $PWD/ ubuntu@$docker_host_ip:$PWD &&
      docker $* &&
      rsync -avh --exclude=.git --update ubuntu@$docker_host_ip:$PWD/ $PWD
  else
    docker $*
  fi
else
  docker-compose $*
fi
