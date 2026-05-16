#!/bin/bash -ex

. ./starter-scripts/The.C++.default/The.C++.default.common.sh

# pass --volume /home/ubuntu/<some-dir>:/your/host/system/real/directory
docker run -it \
    --name ${dockerContainerName} \
    --hostname ${dockerContainerHostName} \
    $@ ${dockerImageName}
