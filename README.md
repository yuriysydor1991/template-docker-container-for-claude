# The C++ default profile

For starting and building big all-in-one container. Watch the [Dockerfiles/The.C++.default.Dockerfile](/Dockerfiles/The.C++.default.Dockerfile) for the details.

# Buiding container 

To build the container run:

```
./starter-scripts/The.C++.default/The.C++.default.build.sh 
```

# Starting container

## Multirun container

### Starting the container

To start the container for multiple runs:

```
# script args are passed for docker command
starter-scripts/The.C++.default/The.C++.default.start.sh

# you may also pass args for docker command
# for example, add some directories from host system

starter-scripts/The.C++.default/The.C++.default.start.sh --volume /your/host/dir/.claude:/home/ubuntu/.claude
```

### Restarting container after first start

After the first start container with the `The.C++.default.start.sh` script next container runs with the command:

```
./starter-scripts/The.C++.default/The.C++.default.restart.sh
```

with no additional parameters.

### Supporting multiple containers from single Claude docker image

Start any number containers with the unique names by adding the `CLAUDE_CONTAINER_NAME` environment variable at the start of the command:

```
# script args are passed for docker command
CLAUDE_CONTAINER_NAME=some-unique-container-name-part starter-scripts/The.C++.default/The.C++.default.start.sh

# you may also pass args for docker command
# for example, add some directories from host system

CLAUDE_CONTAINER_NAME=some-unique-container-name-part starter-scripts/The.C++.default/The.C++.default.start.sh --volume /your/host/dir/.claude:/home/ubuntu/.claude
```

or restart it by:

```
CLAUDE_CONTAINER_NAME=some-unique-container-name-part ./starter-scripts/The.C++.default/The.C++.default.restart.sh
```

### Single run container
For a single container start (with it's deletion after exit) run:

```
# script args are passed for docker command
./starter-scripts/The.C++.default/The.C++.default.start-single.sh
```

or

```
# script args are passed for docker command
CLAUDE_CONTAINER_NAME=some-unique-container-name-part ./starter-scripts/The.C++.default/The.C++.default.start-single.sh
```
