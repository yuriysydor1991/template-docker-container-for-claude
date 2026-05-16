#!/bin/bash -ex

. starter-scripts/The.C++.default/The.C++.default.common.sh

docker build \
    -f "${myDockerfile}" \
    $* -t ${dockerImageName} . 
