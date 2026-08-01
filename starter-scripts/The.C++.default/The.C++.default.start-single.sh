#!/bin/bash -ex

. starter-scripts/The.C++.default/The.C++.default.common.sh

docker run --rm -it \
    --name ${dockerContainerName} \
    --hostname ${dockerContainerHostName} \
    --cpus=${allowedCores} \
    $@ ${dockerImageName}
