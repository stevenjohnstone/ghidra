#!/bin/sh -x

mounts="-v /tmp/.X11-unix:/tmp/.X11-unix"
[ $# -eq 1 ] && {
    mounts="$mounts -v $(readlink --canonicalize "$1"):/root/target"
}
docker run --rm -d --cap-drop=all -e DISPLAY="$DISPLAY" $mounts ghidra

