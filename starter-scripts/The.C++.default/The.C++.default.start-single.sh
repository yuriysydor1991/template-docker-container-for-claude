#!/bin/bash -ex

. starter-scripts/The.C++.default/The.C++.default.common.sh

echo "COMMAND: docker run --rm -it \
    --name ${dockerContainerName} \
    --hostname ${dockerContainerHostName} \
    $@ ${dockerImageName}"

docker run --rm -it \
    --name ${dockerContainerName} \
    --hostname ${dockerContainerHostName} \
    $@ ${dockerImageName}
