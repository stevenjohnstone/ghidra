#!/bin/sh -x

export DOCKER_HOST=unix:///run/user/1000/docker.sock
xmount="/tmp/.X11-unix:/tmp/.X11-unix"

dirmount="$HOME/re:/root/re"
[ $# -eq 1 ] && {
    dirmount="$(readlink --canonicalize "$1"):/root/re"
}
docker run --rm -d --cap-drop=all -e DISPLAY="$DISPLAY" -v "$xmount" -v "$dirmount" ghidra

