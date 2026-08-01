dockerFilesDir="Dockerfiles"

myDockerfile=${dockerFilesDir}/The.C++.default.Dockerfile
allowedCores=2

dockerDefaultImageNamePrefix=the-cxx-default
dockerContainerHostName=${dockerDefaultImageNamePrefix}

if [[ ! -z ${CLAUDE_CONTAINER_NAME} ]]
then
    dockerContainerHostName="${CLAUDE_CONTAINER_NAME}"
fi

dockerImageName=${dockerDefaultImageNamePrefix}-docker-image
dockerContainerName=${dockerContainerHostName}-docker-container
