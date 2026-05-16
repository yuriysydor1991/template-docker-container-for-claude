# The C++ default profile

For starting and building big all-in-one container. Watch the [Dockerfiles/The.C++.default.Dockerfile](/Dockerfiles/The.C++.default.Dockerfile) for the details.

## Buiding container 

To build the container run:

```
./starter-scripts/The.C++.default/The.C++.default.build.sh 
```

## Starting container 

To start the container for multiple runs:

```
# script args are passed for docker command
starter-scripts/The.C++.default/The.C++.default.start.sh

# you may also pass args for docker command
# for example, add some directories from host system

starter-scripts/The.C++.default/The.C++.default.start.sh --volume /your/host/dir/.claude:/home/ubuntu/.claude
```

For a single container start (with it's deletion after exit) run:

```
# script args are passed for docker command
./starter-scripts/The.C++.default/The.C++.default.start-single.sh
```
