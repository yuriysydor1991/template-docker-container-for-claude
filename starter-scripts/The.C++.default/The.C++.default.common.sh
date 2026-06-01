dockerFilesDir="Dockerfiles"

myDockerfile=${dockerFilesDir}/The.C++.default.Dockerfile

dockerContainerHostName=the-cxx-default

if [[ ! -z ${CLAUDE_CONTAINER_NAME} ]]
then
    dockerContainerHostName="${CLAUDE_CONTAINER_NAME}"
fi

dockerImageName=${dockerContainerHostName}-docker-image
dockerContainerName=${dockerContainerHostName}-docker-container
